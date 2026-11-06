import 'package:flutter/material.dart';
import 'student.dart'; // Import the Student model template

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'State & Serialization App',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const StudentStatePage(),
    );
  }
}

class StudentStatePage extends StatefulWidget {
  const StudentStatePage({super.key});

  @override
  State<StudentStatePage> createState() => _StudentStatePageState();
}

class _StudentStatePageState extends State<StudentStatePage> {
  // Step 6 – Instantiate your observable list tracking active items
  final List<String> students = [];
  int _idCounter = 1;

  void _triggerSerializationExperiment() {
    // Step 3 – Initialize custom student model instance element
    Student student = Student(
      id: _idCounter++,
      name: 'Raj',
      course: 'CSE',
    );

    // Step 4 – Convert Dart data object blueprint into a JSON Map architecture
    Map<String, dynamic> data = student.toJson();
    print('--- Serialization (toJson) ---');
    print(data);

    // Step 5 – Inverse conversion from JSON Map format back into a custom Dart object
    Student newStudent = Student.fromJson(data);
    print('--- Deserialization (fromJson) ---');
    print('Restored Student Name parameter: ${newStudent.name}');

    // Step 6 – Mutate visual app state scope parameters safely using setState
    setState(() {
      students.add('${newStudent.name} (ID: ${newStudent.id} - ${newStudent.course})');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State & Serialization Lab'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: _triggerSerializationExperiment,
              icon: const Icon(Icons.bolt),
              label: const Text('Process Serialization & Add Student'),
            ),
            const SizedBox(height: 16),
            const Divider(),
            const Text(
              'Active Student Records Roster',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            
            // Step 7 – Construct reactive ListView builder linked to your state array
            Expanded(
              child: students.isEmpty
                  ? const Center(child: Text('No student records generated yet.'))
                  : ListView.builder(
                      itemCount: students.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          child: ListTile(
                            leading: CircleAvatar(child: Text('${index + 1}')),
                            title: Text(students[index]),
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
