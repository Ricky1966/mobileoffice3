import 'package:flutter/material.dart';

class EditBolle extends StatefulWidget {
  const EditBolle({super.key});

  @override
  _EditBolleState createState() => _EditBolleState();
}

class _EditBolleState extends State<EditBolle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Bolle')),
      body: Center(child: Text('Edit Bolle Page')),
    );
  }
}
