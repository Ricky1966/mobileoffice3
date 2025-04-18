import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:mobileoffice3/providers/customerscontroller.dart';

// ignore: must_be_immutable
class AddCustomers extends StatelessWidget {
  AddCustomers({super.key});

  ClientiController addCustomersController = Get.find<ClientiController>();

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SizedBox(
          height: 350,
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
                  FormBuilderTextField(
                    name: 'Intestazione',
                    decoration: const InputDecoration(
                      labelText: 'Intestazione max 50 caratteri',
                    ),
                    maxLength: 50,
                  ),
                  const SizedBox(height: 10),
                  FormBuilderTextField(
                    maxLength: 50,
                    name: 'Città',
                    decoration: const InputDecoration(
                      labelText: 'Città max 50 caratteri',
                    ),
                  ),
                  const SizedBox(height: 10),
                  FormBuilderTextField(
                    maxLength: 2,
                    name: 'Provincia',
                    decoration: const InputDecoration(
                      labelText: 'Provincia max 2 caratteri',
                    ),
                  ),
                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.saveAndValidate()) {
                            addCustomersController.clienteController =
                                _formKey
                                    .currentState!
                                    .fields['Intestazione']!
                                    .value;
                            addCustomersController.cittaController =
                                _formKey.currentState!.fields['Città']!.value;
                            addCustomersController.provinciaController =
                                _formKey
                                    .currentState!
                                    .fields['Provincia']!
                                    .value;
                            print(
                              _formKey.currentState!.value.entries.toList(),
                            );
                            addCustomersController.writeFile();
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
