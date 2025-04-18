import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileoffice3/providers/customerscontroller.dart';

//ignore: must_be_immutable
class ScriviFile extends StatelessWidget {
  ClientiController scriviFileController = Get.find<ClientiController>();
  ScriviFile({super.key});
  DateTime selectedDate = DateTime.now();
  TextEditingController dateCtl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('Registra Clienti'),
          centerTitle: true,
        ),
        body: _createUI(),
      ),
    );
  }

  Widget _createUI() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(12, 20, 12, 20),
          child: SizedBox(
            height: 70,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter your customer name',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              keyboardType: TextInputType.name,
              maxLines: null,
              expands: true,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(12, 20, 12, 20),
          child: SizedBox(
            height: 70,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter customers city',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              keyboardType: TextInputType.name,
              maxLines: null,
              expands: true,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(12, 20, 12, 20),
          child: SizedBox(
            height: 70,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter customers shire',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              keyboardType: TextInputType.name,
              maxLines: null,
              expands: true,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(12, 0, 12, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  scriviFileController.writeFile();
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(150, 50),
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xff29b6f6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                ),
                child: Text('Write File'),
              ),
              ElevatedButton(
                onPressed: () {
                  scriviFileController.readFile();
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(150, 50),
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xff29b6f6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                ),
                child: Text('Read File'),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Divider(height: 1, color: Colors.black),
        SizedBox(height: 20),
        Obx(() => Text(scriviFileController.content.value)),
      ],
    );
  }
}
