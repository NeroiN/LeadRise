import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lead_rise/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  late final StreamSubscription<AuthState> _authSubscription;

  @override
  void initState() {
    super.initState();
    _authSubscription = supabase.auth.onAuthStateChange.listen((event) {
      final session = event.session;
      if(session != null) {
        Navigator.of(context).pushReplacementNamed('/account');
      }
    });
  }

    @override
  void dispose() {
    _emailController.dispose();
    _authSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              label: Text('Email'),
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
          onPressed: () async {
            try {
              final email = _emailController.text.trim();
              await supabase.auth.signInWithOtp(email: email,
              emailRedirectTo: 'io.supabase.flutterquickstart://login-callback/'
              );
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Проверь свою почту')));
              }
            } on AuthException catch(error){
              // ignore: use_build_context_synchronously
              ScaffoldMessenger.of(context).showSnackBar(
                // ignore: use_build_context_synchronously
                SnackBar(
                 content: Text(error.message), 
                backgroundColor: Theme.of(context).colorScheme.error,
                )
              );
            } (error) {
              // ignore: use_build_context_synchronously
              ScaffoldMessenger.of(context).showSnackBar(
                // ignore: use_build_context_synchronously
                SnackBar(
                 content: const Text('ERROR!'), 
                backgroundColor: Theme.of(context).colorScheme.error,
                )
              );
            };
          },
            child: const Text('Login'),
          
          ),
        ],
      ),
    );
  }
}