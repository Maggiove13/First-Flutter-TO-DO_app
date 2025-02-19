import 'package:flutter/material.dart';
import 'screens/welcome.dart';
import 'screens/todo_list.dart';
import 'screens/quotes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi App',
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/todo': (context) => const TodoListScreen(),
        '/quotes': (context) => const QuotesScreen(),
      },
    );
  }
}
