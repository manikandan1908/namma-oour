import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    // Basic validation & routing to Home
    if (_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter Email and Password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo placeholder or image
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFF1955D1), width: 4),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF1955D1).withOpacity(0.2),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        FontAwesomeIcons.users,
                        color: Color(0xFF1955D1),
                        size: 40,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                
                RichText(
                  text: const TextSpan(
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
                    children: [
                      TextSpan(text: 'Namma '),
                      TextSpan(text: 'Oour', style: TextStyle(color: Color(0xFFEF3D56))),
                    ],
                  ),
                ),
                const SizedBox(height: 48),

                _buildInputField(
                  controller: _emailController,
                  icon: FontAwesomeIcons.envelope,
                  hint: 'Email ID',
                ),
                const SizedBox(height: 16),
                _buildInputField(
                  controller: _passwordController,
                  icon: FontAwesomeIcons.lock,
                  hint: 'Password',
                  isPassword: true,
                ),
                const SizedBox(height: 32),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1955D1),
                      foregroundColor: Colors.white,
                      elevation: 4,
                      shadowColor: const Color(0xFF1955D1).withOpacity(0.4),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('Login', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(height: 24),
                
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/signup'),
                  child: const Text(
                    "Don't have an account? Sign Up",
                    style: TextStyle(color: Color(0xFF1955D1), fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required IconData icon,
    required String hint,
    bool isPassword = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Icon(icon, size: 18, color: const Color(0xFF64748B)),
          ),
          hintText: hint,
          hintStyle: const TextStyle(color: Color(0xFF94A3B8)),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 18),
        ),
      ),
    );
  }
}
