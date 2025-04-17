import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mobileoffice3/pages/bolle/addbolle.dart';
import 'package:mobileoffice3/pages/bolle/bollemenu.dart';
import 'package:mobileoffice3/pages/clienti/customersmenu.dart';
import 'package:mobileoffice3/providers/apppreferences.dart';
//import 'package:mobileoffice3/pages/scrivifile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(child: Image.asset("images/logo.png")),

      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary,
                //border: Border.all(width: 1),
                //borderRadius: BorderRadius.circular(2),
              ),

              accountName: Text(
                "BRAVASoft",
                style: TextStyle(color: Colors.black),
              ),
              accountEmail: Text(
                "riccardo.bramati@gmail.com",
                style: TextStyle(color: Colors.black),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("images/logo.png"),
              ),
              /*
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundColor: Colors.black,
                  backgroundImage: NetworkImage(
                    "https://randomuser.me/api/portraits/women/74.jpg",
                  ),
                ),
              ],
              */
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Bolle"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BolleMenu()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.account_box),
              title: Text("Chilometri"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.grid_3x3_outlined),
              title: Text("Clienti"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ClientiMenu()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text("Archivia"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text("Condividi"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text("Sign out"),
              onTap: () {},
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("+ Bolla"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddBolle()),
          );
          setState(() {
            _counter = (_counter + 1);
            log(_counter.toString());
          });
        },
        //child: const Icon(Icons.add_box_rounded),
      ),
    );
  }
}
