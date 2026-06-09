import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: AddboxApp()));
}

class AddboxApp extends StatelessWidget {
  const AddboxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ADDBOX APP',
      theme: ThemeData.dark(),
      home: const Scaffold(
        body: Center(
          child: Text(
            'ADDBOX APP – Sistema de Inspecciones',
            style: TextStyle(fontSize: 22),
          ),
        ),
      ),
    );
  }
}
