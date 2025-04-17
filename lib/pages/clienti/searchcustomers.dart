import 'package:flutter/material.dart';

class SearchCustomers extends StatelessWidget {
  const SearchCustomers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Customers')),
      body: const Center(child: Text('Search Customers Page')),
    );
  }
}
