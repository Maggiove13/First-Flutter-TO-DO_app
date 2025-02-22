import 'package:flutter/material.dart';
import 'dart:convert'; // para convertir datos JSON (se usa para guardar y recuperar tareas en SharedPreferences).
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
      if (!mounted) return; // Verificamos si el widget está montado

      //tasksJson puede recibir valor nulo
      final String? tasksJson = prefs.getString(
        _storageKey,
      ); // es un String en formato JSON
      print('Cargando tareas: $tasksJson');

      if (tasksJson != null) {
        final List<dynamic> decoded = json.decode(
          tasksJson,
        ); // convierte el String JSON en una estructura de Dart
        if (mounted) {
          // Verificamos nuevamente antes de setState
          setState(() {
            _tasks.clear(); // para evitar duplicados
            _tasks.addAll(
              decoded.cast<String>(),
            ); // convertir a una lista de strings
          });
        }
        print('Tareas cargadas: $_tasks');
      }
    } catch (e) {
      print('Error al cargar tareas: $e');
      // No lanzamos el error, solo lo registramos
    }
  }

  // Guardar tareas en SharedPreferences
  Future<void> _saveTasks() async {
    try {
      if (!mounted) return; // Verificamos si el widget está montado

      final String tasksJson = json.encode(
        _tasks,
      ); // Ahora es una cadena de texto (String) en formato JSON
      await prefs.setString(_storageKey, tasksJson);
      print('Tareas guardadas: $tasksJson');
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
      print('Tarea añadida. Total de tareas: ${_tasks.length}');
    }
  }

  // Eliminar tarea
  Future<void> _removeTask(int index) async {
    setState(() {
      _tasks.removeAt(index);
    });
    await _saveTasks(); // Guardar después de eliminar
    print('Tarea eliminada. Tareas restantes: ${_tasks.length}');
  }

  //Eliminar todas las tareas
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
                //Expanded es un widget que expande su hijo
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
