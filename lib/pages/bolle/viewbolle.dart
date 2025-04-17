// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class ViewBolle extends StatefulWidget {
  const ViewBolle({super.key});

  @override
  _ViewBolleState createState() =>
      _ViewBolleState();
}

class _ViewBolleState extends State<ViewBolle> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('View Modal Screen', style: TextStyle(fontSize: 24)),
    );
  }
}