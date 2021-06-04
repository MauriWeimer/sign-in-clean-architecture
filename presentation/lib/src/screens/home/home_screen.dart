import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static Route<void> route() => MaterialPageRoute(builder: (_) => const HomeScreen());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: const Center(
        child: const Text('hola'),
      ),
    );
  }
}
