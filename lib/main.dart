import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'beranda_page.dart';
import 'ramalan_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => RamalProvider(),
      child: const RamalApp(),
    ),
  );
}

class RamalApp extends StatelessWidget {
  const RamalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ramal App',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}