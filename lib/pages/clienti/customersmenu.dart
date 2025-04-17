import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:mobileoffice3/pages/clienti/addcustomers.dart';
import 'package:mobileoffice3/pages/clienti/editcustomers.dart';
import 'package:mobileoffice3/pages/clienti/pdfcustomers.dart';
import 'package:mobileoffice3/pages/clienti/searchcustomers.dart';
import 'package:mobileoffice3/pages/clienti/vewcustomers.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:mobileoffice3/providers/provider.dart';

class ClientiMenu extends StatefulWidget {
  const ClientiMenu({super.key});

  @override
  State<ClientiMenu> createState() => _ClientiMenuState();
}

class _ClientiMenuState extends State<ClientiMenu> {
  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final bodies = [
    ViewCustomers(),
    SearchCustomers(),
    AddCustomers(),
    EditCustomers(),
    PDFCustomers(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clienti Menu'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        items: [
          CurvedNavigationBarItem(child: Icon(Icons.list), label: 'Lista'),
          CurvedNavigationBarItem(child: Icon(Icons.search), label: 'Search'),
          CurvedNavigationBarItem(
            child: Icon(Icons.add_business_rounded),
            label: 'Add',
          ),
          CurvedNavigationBarItem(child: Icon(Icons.edit), label: 'Edit'),
          CurvedNavigationBarItem(
            child: Icon(Icons.picture_as_pdf),
            label: 'Pdf',
          ),
        ],
        color: Theme.of(context).colorScheme.inversePrimary,
        buttonBackgroundColor: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: bodies[_page],
      /*Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_page.toString(), textScaler: TextScaler.linear(10.0)),
              ElevatedButton(
                child: Text('Go To Page of index 1'),
                onPressed: () {
                  final CurvedNavigationBarState? navBarState =
                      _bottomNavigationKey.currentState;
                  navBarState?.setPage(1);
                },
              ),
            ],
          ),
        ),
      ),
      */
    );
  }
}
