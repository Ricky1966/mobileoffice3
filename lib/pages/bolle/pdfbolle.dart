// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class PDFBolle extends StatefulWidget {
  const PDFBolle({super.key});

  @override
  _PDFBolleState createState() =>
      _PDFBolleState();
}

class _PDFBolleState extends State<PDFBolle> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('PDF Create Screen', style: TextStyle(fontSize: 24)),
    );
  }
}