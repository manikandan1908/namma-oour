import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Theme.of(context).primaryColor, width: 3),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(35),
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Icon(
                      FontAwesomeIcons.users,
                      color: Theme.of(context).primaryColor,
                      size: 30,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              
              Text(
                'Join Namma Oour',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 10),
              const Text(
                'Create an account to connect with friends',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 40),

              // Inputs
              _buildInputField(
                context,
                icon: FontAwesomeIcons.user,
                hint: 'Full Name',
              ),
              const SizedBox(height: 16),
              _buildInputField(
                context,
                icon: FontAwesomeIcons.envelope,
                hint: 'Email ID',
              ),
              const SizedBox(height: 16),
              _buildInputField(
                context,
                icon: FontAwesomeIcons.lock,
                hint: 'Password',
                isPassword: true,
              ),
              const SizedBox(height: 30),

              // Sign Up Button
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Back to Login
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "Already have an account? Login",
                  style: TextStyle(color: Color(0xFF1955D1)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(BuildContext context, {required IconData icon, required String hint, bool isPassword = false}) {
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
        obscureText: isPassword,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, size: 18, color: const Color(0xFF64748B)),
          hintText: hint,
          hintStyle: const TextStyle(color: Color(0xFF94A3B8)),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 18),
        ),
      ),
    );
  }
}
