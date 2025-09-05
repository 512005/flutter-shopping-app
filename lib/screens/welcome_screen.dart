// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'signup_screen.dart';
import 'signin_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final titleStyle = GoogleFonts.suwannaphum(
      fontWeight: FontWeight.w700,
      fontSize: 24,
      color: Theme.of(context).colorScheme.primary,
    );

    return Scaffold(
      appBar: AppBar(title: Text('Shopping', style: titleStyle)),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Local image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/images/local.png',
                      width: 140,
                      height: 140,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Online image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1512436991641-6745cdb1723f?q=80&w=600&auto=format&fit=crop',
                      width: 140,
                      height: 140,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) =>
                          const Icon(Icons.broken_image, size: 48),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text('Welcome', style: titleStyle),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.of(
                      context,
                    ).push(_fadeTo(const SignUpScreen())),
                    child: const Text('Sign Up'),
                  ),
                  const SizedBox(width: 12),
                  OutlinedButton(
                    onPressed: () => Navigator.of(
                      context,
                    ).push(_fadeTo(const SignInScreen())),
                    child: const Text('Sign In'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  PageRouteBuilder _fadeTo(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (_, animation, __) =>
          FadeTransition(opacity: animation, child: page),
    );
  }
}
