import 'dart:io';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pdf/widgets.dart' as pw;

class ClientiController extends GetxController {
  late String clienteController;
  late String cittaController;
  late String provinciaController;
  RxString content = 'Data Read from file will appear here'.obs;

  Future<PermissionStatus> _getStoragePermission() async {
    var permissionStatus =
        Platform.isIOS
            ? await Permission.storage.request()
            : await Permission.manageExternalStorage.request();
    if (permissionStatus.isDenied || permissionStatus.isRestricted) {
      // Here just ask for the permission for the first time
      permissionStatus = await Permission.storage.request();

      // I noticed that sometimes popup won't show after user press deny
      // so I do the check once again but now go straight to appSettings
      if (permissionStatus.isDenied) {
        await openAppSettings();
      }
    } else if (permissionStatus.isPermanentlyDenied) {
      // Here open app settings for user to manually enable permission in case
      // where permission was permanently denied
      await openAppSettings();
    }
    return permissionStatus;
  }

  Future<String?> _getDocumentsPath() async {
    Directory? directory;
    try {
      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        directory = Directory('/storage/emulated/0/Documents/');
        // Put file in global Documents folder, if for an unknown reason it didn't exist, we fallback
        // ignore: avoid_slow_async_io
        if (!await directory.exists()) {
          directory = await getExternalStorageDirectory();
        }
      }
    } catch (e) {
      print("Cannot get download folder path with error=$e");
    }
    return directory?.path;
  }

  void writeFile() async {
    if (clienteController.isNotEmpty ||
        cittaController.isNotEmpty ||
        provinciaController.isNotEmpty) {
      PermissionStatus permissionStatus = await _getStoragePermission();
      if (permissionStatus == PermissionStatus.granted) {
        try {
          String? externalStoragePath = await _getDocumentsPath();
          print(externalStoragePath);
          if (externalStoragePath != null) {
            await createPDF(externalStoragePath);
            // Create the file in the Documents folder
            //Platform.lineTerminator is used to add new line to the text
            externalStoragePath += "/Customers.txt";
            File file = File(externalStoragePath);
            file.writeAsString(
              "$clienteController,$cittaController,$provinciaController,${Platform.lineTerminator}",
              mode: FileMode.writeOnlyAppend,
            );
            content.value = 'File written successfully!';
          }
        } catch (e) {
          print('Error in writing file=$e');
          content.value = 'Error in writing file=$e';
        }
      }
    } else {
      print('Enter some content first in the textbox');
      content.value = 'Enter some content first in the textbox';
    }
  }

  void readFile() async {
    PermissionStatus permissionStatus = await _getStoragePermission();
    if (permissionStatus == PermissionStatus.granted) {
      try {
        String? externalStoragePath = await _getDocumentsPath();
        if (externalStoragePath != null) {
          externalStoragePath += "/Customers.txt";
          File file = File(externalStoragePath);
          content.value =
              'File read successfully:${Platform.lineTerminator}${Platform.lineTerminator}${await file.readAsString()}';
        }
      } catch (e) {
        print('Error in reading file=$e');
        content.value = 'Error in reading file=$e';
      }
    }
  }

  createPDF(String? externalStoragePath) async {
    final pdf = pw.Document();
    //final pdffile = File('/storage/emulated/0/Documents/example.pdf');
    pdf.addPage(
      pw.Page(
        build:
            (pw.Context context) => pw.Center(
              child: pw.Text(
                'Customer: $clienteController ${Platform.lineTerminator}Address: $cittaController ${Platform.lineTerminator} Shire: $provinciaController',
                textAlign: pw.TextAlign.center,
                style: const pw.TextStyle(fontSize: 40),
              ),
            ),
      ),
    );
    final pdffile = File('$externalStoragePath/Customers.pdf');
    await pdffile.writeAsBytes(await pdf.save());
  }
}
