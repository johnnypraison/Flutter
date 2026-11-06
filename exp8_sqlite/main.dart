import 'package:flutter/material.dart';
import 'database_helper.dart'; // Links the CRUD engine

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Database Persistence App',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const StudentFormPage(),
    );
  }
}

class StudentFormPage extends StatefulWidget {
  const StudentFormPage({super.key});

  @override
  State<StudentFormPage> createState() => _StudentFormPageState();
}

class _StudentFormPageState extends State<StudentFormPage> {
  final List<Map<String, dynamic>> _studentList = [];
  final _nameController = TextEditingController();
  final _courseController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _refreshRecords(); // Auto-fetches persistent rows on launch
  }

  Future<void> _refreshRecords() async {
    final data = await DatabaseHelper.instance.queryAllStudents();
    setState(() {
      _studentList.clear();
      _studentList.addAll(data);
    });
  }

  // Step 6 – Collect input information from TextFields and push into SQLite
  Future<void> _handleSubmit() async {
    if (_nameController.text.trim().isEmpty || _courseController.text.trim().isEmpty) {
      return;
    }

    await DatabaseHelper.instance.insertStudent({
      'name': _nameController.text.trim(),
      'course': _courseController.text.trim(),
    });

    _nameController.clear();
    _courseController.clear();
    _refreshRecords(); // Reload list view data mapping
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SQLite Persistence Lab')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        key: const Key('main_padding'),
        child: Column(
          children: [
            // Input Fields
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Student Name'),
            ),
            TextField(
              controller: _courseController,
              decoration: const InputDecoration(labelText: 'Course Module'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _handleSubmit,
              child: const Text('Add Student Record'),
            ),
            const Divider(height: 32),

            // Step 7 – Display target students utilizing a ListView.builder component
            Expanded(
              child: _studentList.isEmpty
                  ? const Center(child: Text('No database entries detected.'))
                  : ListView.builder(
                      itemCount: _studentList.length,
                      itemBuilder: (context, index) {
                        final item = _studentList[index];
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(child: Text('${item['id']}')),
                            title: Text(item['name']),
                            subtitle: Text('Course: ${item['course']}'),
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
