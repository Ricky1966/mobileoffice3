import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:mobileoffice3/pages/bolle/addbolle.dart';
import 'package:mobileoffice3/pages/bolle/editbolle.dart';
import 'package:mobileoffice3/pages/bolle/pdfbolle.dart';
import 'package:mobileoffice3/pages/bolle/searchbolle.dart';
import 'package:mobileoffice3/pages/bolle/viewbolle.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:mobileoffice3/providers/provider.dart';

class BolleMenu extends StatefulWidget {
  const BolleMenu({super.key});

  @override
  State<BolleMenu> createState() => _BolleMenuState();
}

class _BolleMenuState extends State<BolleMenu> {
  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final bodies = [
    ViewBolle(),
    SearchBolle(),
    AddBolle(),
    EditBolle(),
    PDFBolle(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bolle Menu'),
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
      body: bodies[_page], // Use the selected page from the list of bodies
      /* Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_page.toString(), textScaler: TextScaler.linear(10.0)),
            ],
          ),
        ),
      ),
      */
    );
  }
}
