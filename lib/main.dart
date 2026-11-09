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
          seedColor: const Color(0xFF5457EA),
        ),
        // Main interface background.
        scaffoldBackgroundColor: const Color(0xFFA5B4FC),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF6366F1),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        // Text fields use a white fill.
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Color(0xFFFFFFFF),
        ),
        // All elevated buttons use the requested color.
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF5457EA),
            foregroundColor: Colors.white,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xFF5457EA),
          ),
        ),
        useMaterial3: true,
      ),
      home: const Authpage(),
    );
  }
}