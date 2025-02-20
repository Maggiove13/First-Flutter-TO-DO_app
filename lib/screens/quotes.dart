import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

class QuotesScreen extends StatefulWidget {
  const QuotesScreen({Key? key}) : super(key: key);

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  String _quote = "Obten una frase motivadora";
  final Random _random = Random();

  // Lista de frases predefinidas
  final List<String> _predefinedQuotes = [
    "El único modo de hacer un gran trabajo es amar lo que haces",
    "Todo lo que puedas imaginar es real",
    "El éxito es la suma de pequeños esfuerzos repetidos día tras día",
    "La mejor forma de predecir el futuro es creándolo",
    "No cuentes los días, haz que los días cuenten",
    "El mejor momento para plantar un árbol era hace 20 años. El segundo mejor momento es ahora",
    "La disciplina es el puente entre metas y logros",
    "Los sueños no funcionan a menos que tú lo hagas",
    "Cree en ti mismo y todo será posible",
    "La persistencia puede cambiar el fracaso en un logro extraordinario",
  ];

  Future<void> _fetchQuote() async {
    try {
      final response = await http.get(
        Uri.parse("https://www.affirmations.dev/"),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _quote = data["affirmation"];
        });
      } else {
        _useBackupQuote();
      }
    } catch (e) {
      _useBackupQuote();
    }
  }

  void _useBackupQuote() {
    setState(() {
      _quote = _predefinedQuotes[_random.nextInt(_predefinedQuotes.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Frases Motivadoras"), elevation: 0),
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      _quote,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontStyle: FontStyle.italic,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton.icon(
                  onPressed: _fetchQuote,
                  icon: const Icon(Icons.refresh),
                  label: const Text("Nueva Frase"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
