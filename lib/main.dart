import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/welcome.dart';
import 'screens/todo_list.dart';
import 'screens/quotes.dart';

late SharedPreferences prefs;

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    prefs = await SharedPreferences.getInstance();
    runApp(const MyApp());
  } catch (e) {
    print('Error inicializando la app: $e');
    // Inicializar la app incluso si hay error con SharedPreferences
    runApp(const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 38, 23, 68),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        // Personalización de los botones
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/todo': (context) => const TodoListScreen(),
        '/quotes': (context) => const QuotesScreen(),
      },
    );
  }
}
