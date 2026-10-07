import 'package:fchat/services/auth/auth_gate.dart';
import 'package:fchat/firebase_options.dart';
import 'package:fchat/pages/home_page.dart';
import 'package:fchat/pages/settings_page.dart';
import 'package:fchat/themes/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const AuthGate(),
      initialRoute: '/auth',
      routes: {
        '/auth': (context) => const AuthGate(),
        '/home': (context) => HomePage(),
        '/settings': (context) => const SettingsPage(),
      },
    );
  }
}
