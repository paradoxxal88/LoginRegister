import 'package:flutter/material.dart';

import 'auth/authpage.dart';
 
void main() {
  runApp(const LoginRegisterApp());
}
 
class LoginRegisterApp extends StatelessWidget {
  const LoginRegisterApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lab Activity 3',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),
        useMaterial3: true,
      ),
      home: const Authpage(),
    );
  }
}