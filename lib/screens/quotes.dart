import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class QuotesScreen extends StatefulWidget {
  const QuotesScreen({Key? key}) : super(key: key);

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  String _quote = "Presiona el botón para obtener una frase motivadora";

  Future<void> _fetchQuote() async {
    final response = await http.get(Uri.parse("https://www.affirmations.dev/"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _quote = data["affirmation"];
      });
    } else {
      setState(() {
        _quote = "Error al obtener la frase";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Frases Motivadoras")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _quote,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _fetchQuote,
                child: const Text("Nueva Frase"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
