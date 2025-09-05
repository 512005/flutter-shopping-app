import 'package:flutter/material.dart';
import 'home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirm = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    _confirm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _name,
                decoration: const InputDecoration(labelText: 'Full Name'),
                textCapitalization: TextCapitalization.words,
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Enter your name';
                  if (!RegExp(r'^[A-Z]').hasMatch(v))
                    return 'First letter must be uppercase';
                  return null;
                },
              ),
              TextFormField(
                controller: _email,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
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
              TextFormField(
                controller: _confirm,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                ),
                obscureText: true,
                validator: (v) {
                  if (v != _password.text) return 'Passwords do not match';
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
                        content: const Text('Account created successfully'),
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
                child: const Text('Create Account'),
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
