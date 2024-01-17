import 'package:flutter/material.dart';
import 'package:restic/converter/theme/theme.dart';
import 'package:restic/converter/ui/page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: createTheme(),
      home:  const PageMain(),
    );
  }
}