import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mobileoffice3/providers/appbinding.dart';
import 'mobile_app.dart';

void main() {
  Intl.defaultLocale = 'it_IT';
  WidgetsFlutterBinding.ensureInitialized();
  AppBindings().dependencies();
  runApp(const ProviderScope(child: MobileApp()));
}
