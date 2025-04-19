import 'package:flutter/material.dart';
import 'package:mobileoffice3/pages/homepage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MobileApp extends StatelessWidget {
  const MobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Office 4.0',
      supportedLocales: const [Locale('it', ''), Locale('en', '')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      locale: const Locale('it', ''),
      theme: ThemeData(
        // Define the default brightness and colors.
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          // ···
          //brightness: Brightness.dark,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(title: 'Mobile Office 4.0'),
    );
  }
}
