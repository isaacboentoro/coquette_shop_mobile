import 'package:flutter/material.dart';
import 'package:coquette_shop_mobile/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Mental Health Tracker',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme:  ColorScheme.fromSeed(seedColor: const Color(0xFF458588))
        ),
        home: const LoginPage(),
      ),
    );
  }
}
