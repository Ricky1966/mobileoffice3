import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:mobileoffice3/providers/scrivifilecontroller.dart';

// ignore: must_be_immutable
class AddCustomers extends StatelessWidget {
  AddCustomers({super.key});

  ScriviFileController scriviFileController = Get.find<ScriviFileController>();

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                FormBuilderTextField(
                  name: 'Intestazione',
                  decoration: const InputDecoration(labelText: 'Intestazione'),
                ),
                const SizedBox(height: 10),
                FormBuilderTextField(
                  name: 'Città',
                  decoration: const InputDecoration(labelText: 'Città'),
                ),
                const SizedBox(height: 10),
                FormBuilderTextField(
                  name: 'Provincia',
                  decoration: const InputDecoration(labelText: 'Provincia'),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.saveAndValidate()) {
                          scriviFileController.customerController =
                              _formKey
                                  .currentState!
                                  .fields['Intestazione']!
                                  .value;
                          scriviFileController.cityController =
                              _formKey.currentState!.fields['Città']!.value;
                          scriviFileController.shireController =
                              _formKey.currentState!.fields['Provincia']!.value;
                          //print(_formKey.currentState!.value.entries.toList());
                          scriviFileController.writeFile();
                        }
                      },

                      child: const Text('Submit'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _formKey.currentState!.reset();
                      },
                      child: const Text('Reset'),
                    ),
                    SizedBox(height: 20),
                    Divider(height: 1, color: Colors.black),
                    SizedBox(height: 20),
                    Obx(() => Text(scriviFileController.content.value)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
