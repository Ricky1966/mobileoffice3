// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mobileoffice3/providers/bollecontroller.dart';

// ignore: must_be_immutable
class AddBolle extends StatelessWidget {
  AddBolle({super.key});

  BolleController addBolleController = Get.find<BolleController>();

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SizedBox(
          height: 500,
          width: MediaQuery.of(context).size.width,
          child: Card(
            elevation: 30,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: Colors.grey[200],
            child: FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  FormBuilderDateTimePicker(
                    name: 'Data registrazione',
                    initialTime: TimeOfDay.now(),
                    inputType: InputType.date,
                    format: DateFormat('dd/MM/yyyy'),
                    decoration: const InputDecoration(
                      labelText: 'Data registrazione',
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                    initialValue: DateTime.now(),
                  ),
                  const SizedBox(height: 10),
                  FormBuilderTextField(
                    maxLength: 50,
                    name: 'Intestazione',
                    decoration: const InputDecoration(
                      labelText: 'Intestazione max 50 caratteri',
                    ),
                  ),
                  const SizedBox(height: 10),
                  FormBuilderTextField(
                    maxLength: 20,
                    name: 'Numero Bolla',
                    decoration: const InputDecoration(
                      labelText: 'Numero Bolla',
                    ),
                  ),
                  const SizedBox(height: 10),
                  FormBuilderDateTimePicker(
                    name: 'Data Bolla',
                    initialTime: TimeOfDay.now(),
                    inputType: InputType.date,
                    format: DateFormat('dd/MM/yyyy'),
                    decoration: const InputDecoration(
                      labelText: 'Data emissione bolla',
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                    initialValue: DateTime.now(),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.saveAndValidate()) {
                            addBolleController.dateBollaController =
                                _formKey
                                    .currentState!
                                    .fields['Data registrazione']!
                                    .value;
                            print(addBolleController.dateBollaController);
                            addBolleController.intestazioneController =
                                _formKey
                                    .currentState!
                                    .fields['Intestazione']!
                                    .value;
                            print(addBolleController.intestazioneController);
                            addBolleController.numBollaController =
                                _formKey
                                    .currentState!
                                    .fields['Numero Bolla']!
                                    .value;
                            print(
                              addBolleController.numBollaController.toString(),
                            );
                            addBolleController.dateAddBollaController =
                                _formKey
                                    .currentState!
                                    .fields['Data Bolla']!
                                    .value;
                            print(addBolleController.dateAddBollaController);
                            print(
                              _formKey.currentState!.value.entries.toList(),
                            );
                            addBolleController.writeFile();
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
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
