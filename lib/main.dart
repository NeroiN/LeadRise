import 'package:flutter/material.dart';
import 'package:lead_rise/pages/account_page.dart';
import 'package:lead_rise/pages/login_page.dart';
import 'package:lead_rise/pages/splash_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  /// TODO: update Supabase credentials with your own
 await Supabase.initialize(
    url: 'https://twyyazmpvnpjypgpcekw.supabase.co',
    anonKey: 
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR3eXlhem1wdm5wanlwZ3BjZWt3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDU2MTU1MzIsImV4cCI6MjAyMTE5MTUzMn0.ID1cnBrfWfPcvol98C6fZRl8VXkMqNuCJIumh-XIJEg',
  );
  runApp(MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.green,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.green,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.green,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/':(context) => SplashPage(),
        '/login':(context) => LoginPage(),
        '/account':(context) => AccountPage(),
      },
    );
  }
}
