import 'package:flutter/material.dart';

class ViewCustomers extends StatelessWidget {
  const ViewCustomers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('View Customers')),
      body: const Center(child: Text('Customer list will be displayed here')),
    );
  }
}
