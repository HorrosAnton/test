import 'package:flutter/material.dart';

void main() {
  runApp(TaskApp());
}

class TaskApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Список задач',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TaskListPage(),
    );
  }
}

class Task {
  int id;
  String text;

  Task({required this.id, required this.text});
}

class TaskListPage extends StatefulWidget {
  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  List<Task> tasks = [];
  int _nextId = 1;
  TextEditingController _controller = TextEditingController();

  void _addTask(String text) {
    if (text.isNotEmpty) {
      setState(() {
        tasks.add(Task(id: _nextId++, text: text));
        _controller.clear();
      });
    }
  }

  void _editTask(int id, String newText) {
    setState(() {
      final task = tasks.firstWhere((task) => task.id == id);
      task.text = newText;
    });
  }

  void _deleteTask(int id) {
    setState(() {
      tasks.removeWhere((task) => task.id == id);
    });
  }

  void _showEditDialog(BuildContext context, Task task) {
    TextEditingController editController = TextEditingController(text: task.text);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Редактировать задачу'),
          content: TextField(
            controller: editController,
            decoration: InputDecoration(hintText: 'Введите новую задачу'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Отмена'),
            ),
            TextButton(
              onPressed: () {
                _editTask(task.id, editController.text);
                Navigator.of(context).pop();
              },
              child: Text('Сохранить'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Мой список задач')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Поле для ввода новой задачи и кнопка добавления
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Введите новую задачу',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => _addTask(_controller.text),
                  child: Text('Добавить'),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Список задач с ListView.builder
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return Card(
                    child: ListTile(
                      title: Text(task.text),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.blue),
                            onPressed: () => _showEditDialog(context, task),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _deleteTask(task.id),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
