import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bienvenido')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '¡Bienvenido a tu app de tareas!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/todo');
              },
              child: const Text("Ir a Lista de Tareas"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/quotes');
              },
              child: const Text('Inspiración Diaria'),
            ),
          ],
        ),
      ),
    );
  }
}
