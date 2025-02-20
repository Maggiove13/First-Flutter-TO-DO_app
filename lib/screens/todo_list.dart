import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../main.dart'; // Importamos main.dart para acceder a prefs

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final List<String> _tasks = []; // Lista de tareas
  final TextEditingController _controller =
      TextEditingController(); // Controlador para el input
  static const String _storageKey = 'todo_tasks';

  @override
  void initState() {
    super.initState();
    _loadTasks(); // Cargar tareas al iniciar
  }

  // Cargar tareas desde SharedPreferences
  Future<void> _loadTasks() async {
    try {
      final String? tasksJson = prefs.getString(_storageKey);
      print('Cargando tareas: $tasksJson');

      if (tasksJson != null) {
        final List<dynamic> decoded = json.decode(tasksJson);
        setState(() {
          _tasks.clear();
          _tasks.addAll(decoded.cast<String>());
        });
        print('Tareas cargadas: $_tasks');
      }
    } catch (e) {
      print('Error al cargar tareas: $e');
    }
  }

  // Guardar tareas en SharedPreferences
  Future<void> _saveTasks() async {
    try {
      final String tasksJson = json.encode(_tasks);
      await prefs.setString(_storageKey, tasksJson);
      print('Tareas guardadas: $tasksJson');

      // Verificación adicional
      final saved = prefs.getString(_storageKey);
      print('Verificación de guardado: $saved');
    } catch (e) {
      print('Error al guardar tareas: $e');
    }
  }

  // Añadir tarea
  Future<void> _addTask() async {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _tasks.add(_controller.text);
        _controller.clear();
      });
      await _saveTasks(); // Guardar después de añadir
      print(
        'Tarea añadida. Total de tareas: ${_tasks.length}',
      ); // Log para debug
    }
  }

  // Eliminar tarea
  Future<void> _removeTask(int index) async {
    setState(() {
      _tasks.removeAt(index);
    });
    await _saveTasks(); // Guardar después de eliminar
    print(
      'Tarea eliminada. Tareas restantes: ${_tasks.length}',
    ); // Log para debug
  }

  // Añadir este método a la clase _TodoListScreenState
  Future<void> _clearTasks() async {
    try {
      await prefs.remove(_storageKey);
      setState(() {
        _tasks.clear();
      });
      print('Todas las tareas han sido eliminadas');
    } catch (e) {
      print('Error al limpiar tareas: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Tareas"),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_sweep),
            onPressed: _clearTasks,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: "Añadir nueva tarea",
                    ),
                  ),
                ),
                IconButton(icon: const Icon(Icons.add), onPressed: _addTask),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_tasks[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _removeTask(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTask,
        child: const Icon(Icons.add),
      ),
    );
  }
}
