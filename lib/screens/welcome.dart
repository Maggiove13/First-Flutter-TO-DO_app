import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.secondaryContainer,
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    size: 100,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(height: 32),
                  Text(
                    '¡Bienvenido a tu app de tareas!',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Organiza tus actividades y mantén la motivación',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 48),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/todo');
                    },
                    icon: const Icon(Icons.list_alt),
                    label: const Text("Lista de Tareas"),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/quotes');
                    },
                    icon: const Icon(Icons.lightbulb_outline),
                    label: const Text('Inspiración Diaria'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
