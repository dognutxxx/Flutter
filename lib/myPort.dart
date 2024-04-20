import 'package:flutter/material.dart';

class MyPort extends StatefulWidget {
  const MyPort({super.key});

  @override
  State<MyPort> createState() => _MyPortState();
}

class _MyPortState extends State<MyPort> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: const Text('My port'),
        centerTitle: true,
      ),
    );
  }
}
