import 'package:flutter/material.dart';
import 'home_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _email,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Enter your email';
                  if (!v.contains('@')) return 'Email must include @';
                  return null;
                },
              ),
              TextFormField(
                controller: _password,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (v) {
                  if (v == null || v.length < 6) return 'At least 6 characters';
                  return null;
                },
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text('Success'),
                        content: const Text('Account sign-in successfully'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                              Navigator.of(context).pushAndRemoveUntil(
                                _fadeTo(const HomeScreen()),
                                (_) => false,
                              );
                            },
                            child: const Text('Close'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: const Text('Sign In'),
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
