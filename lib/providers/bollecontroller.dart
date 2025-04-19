import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pdf/widgets.dart' as pw;

class BolleController extends GetxController {
  late String intestazioneController;
  late String numBollaController;
  late DateTime dateBollaController;
  late DateTime dateAddBollaController;

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
    if (intestazioneController.isNotEmpty || numBollaController.isNotEmpty) {
      PermissionStatus permissionStatus = await _getStoragePermission();
      if (permissionStatus == PermissionStatus.granted) {
        try {
          String? externalStoragePath = await _getDocumentsPath();
          print(externalStoragePath);
          if (externalStoragePath != null) {
            await createPDF(externalStoragePath);
            // Create the file in the Documents folder
            //Platform.lineTerminator is used to add new line to the text
            externalStoragePath += "/Bolle.txt";
            File file = File(externalStoragePath);
            file.writeAsString(
              "$dateAddBollaController,$intestazioneController,$numBollaController,$dateBollaController,${Platform.lineTerminator}",
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

  createPDF(String? externalStoragePath) async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4.landscape,
        margin: const pw.EdgeInsets.all(12),
        build:
            (pw.Context context) => pw.Center(
              widthFactor: 1.0,
              heightFactor: 1.0,
              child: pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                children: [
                  pw.Container(
                    width: 2700,
                    height: 20,
                    decoration: pw.BoxDecoration(
                      color: PdfColors.grey100,
                      shape: pw.BoxShape.rectangle,
                      border: pw.Border.all(color: PdfColors.black, width: 2.5),
                      borderRadius: pw.BorderRadius.circular(5),
                    ),
                    alignment: pw.Alignment.center,
                  ),
                  pw.Text(
                    'Bolle',
                    style: pw.TextStyle(
                      fontSize: 40,
                      fontWeight: pw.FontWeight.bold,
                    ),
                    textAlign: pw.TextAlign.center,
                  ),
                  pw.SizedBox(height: 20, width: 20),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    children: [
                      pw.Text(
                        DateFormat("dd/MM/yyyy").format(dateAddBollaController),
                        style: pw.TextStyle(
                          fontSize: 16,
                          fontWeight: pw.FontWeight.bold,
                        ),
                        textAlign: pw.TextAlign.center,
                      ),
                      pw.SizedBox(width: 10),
                      pw.Text(
                        intestazioneController,
                        style: pw.TextStyle(
                          fontSize: 16,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.SizedBox(width: 10),
                      pw.Text(
                        numBollaController,
                        style: pw.TextStyle(
                          fontSize: 16,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.SizedBox(width: 10),
                      pw.Text(
                        DateFormat("dd/MM/yyyy").format(dateBollaController),
                        style: pw.TextStyle(
                          fontSize: 16,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.SizedBox(width: 10),
                    ],
                  ),
                ],
              ),
            ),
      ),
    );
    final pdffile = File('$externalStoragePath/Bolle.pdf');
    await pdffile.writeAsBytes(await pdf.save());
  }

  void readFile() async {
    PermissionStatus permissionStatus = await _getStoragePermission();
    if (permissionStatus == PermissionStatus.granted) {
      try {
        String? externalStoragePath = await _getDocumentsPath();
        if (externalStoragePath != null) {
          externalStoragePath += "/Bolle.txt";
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
}
