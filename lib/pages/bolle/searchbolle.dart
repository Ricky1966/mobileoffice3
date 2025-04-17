import 'package:flutter/material.dart';

class SearchBolle extends StatefulWidget {
  const SearchBolle({super.key});

  @override
  _SearchBolleState createState() => _SearchBolleState();
}

class _SearchBolleState extends State<SearchBolle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Bolle')),
      body: const Center(child: Text('Search Bolle Page')),
    );
  }
}
