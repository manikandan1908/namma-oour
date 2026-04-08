import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'signup_screen.dart';
import 'home_screen.dart';

void main() {
  runApp(const NammaOourApp());
}

class NammaOourApp extends StatelessWidget {
  const NammaOourApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Namma Oour',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: const Color(0xFF1955D1),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1955D1),
          primary: const Color(0xFF1955D1),
          secondary: const Color(0xFFEF3D56),
        ),
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          centerTitle: false,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            color: Color(0xFF1E293B),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
          bodyLarge: TextStyle(color: Color(0xFF475569)),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
