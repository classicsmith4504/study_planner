import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// STATIC: root of the app (MaterialApp gives theme + navigation)
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'My Study Planner',
      home: HomeScreen(), // StatelessWidget: content never changes yet
    );
  }
}

// STATIC: the whole screen
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // STATIC: top bar
      appBar: AppBar(title: const Text('My Study Planner')),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // STATIC: heading above the list
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Study Goals',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),

          // STATIC: goal card 1 (example)
          const Card(
            child: ListTile(
              title: Text('Mobile Application'),
              subtitle: Text('5 hours'),
            ),
          ),

          // STATIC: goal card 2 (example)
          const Card(
            child: ListTile(
              title: Text('English'),
              subtitle: Text('2 hours'),
            ),
          ),

          // STATIC: goal card 3 (example)
          const Card(
            child: ListTile(
              title: Text('Networking N+'),
              subtitle: Text('3 hours'),
            ),
          ),
        ],
      ),

      // STATIC: button that does nothing yet
      floatingActionButton: FloatingActionButton(
        onPressed: () {}, // empty on purpose in Phase 1
        child: const Icon(Icons.add),
      ),
    );
  }
}
