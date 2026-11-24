import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'My Study Planner',
      home: HomeScreen(),
    );
  }
}

// The screen is now STATEFUL because the data changes.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ===================== LOGIC =====================
  // Data: a list of maps with the keys subject, hours, done
    // LOGIC: your own data (subject, hours, done)
  final List<Map<String, dynamic>> goals = [
    {'subject': 'Mobile Application', 'hours': 5, 'done': false},
    {'subject': 'English', 'hours': 2, 'done': false},
    {'subject': 'Networking N+', 'hours': 3, 'done': false},
  ];

  // LOGIC: add a sample goal (replaced by a real form in Phase 4)
  void addSampleGoal() {
    setState(() {
      goals.add({'subject': 'New goal', 'hours': 2, 'done': false});
    });
  }

  // LOGIC: flip done between true and false for one goal
  void toggleGoal(int index) {
    setState(() {
    // ! flips the value: true becomes false, false becomes true
      goals[index]['done'] = !goals[index]['done'];
    });
  }

  // LOGIC: remove one goal
  void deleteGoal(int index) {
    setState(() {
      // removeAt deletes the item at this position in the list
      goals.removeAt(index);
    });
  }
  // =================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // STATIC
      appBar: AppBar(title: const Text('My Study Planner')),

      body: ListView.builder(
        itemCount: goals.length, // one tile per goal in the data
        itemBuilder: (context, index) {
          final goal = goals[index];
          final bool done = goal['done'];

          return Card(
            child: ListTile(
              // CONNECTION 1: UI calls LOGIC (toggle)
              leading: Checkbox(
                value: done,
                onChanged: (_) => toggleGoal(index),
              ),
              title: Text(
                goal['subject'],
                style: TextStyle(
                  // if done is true, draw a line through the text
                  decoration: done
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              subtitle: Text('${goal['hours']} hours'),
              // CONNECTION 2: UI calls LOGIC (delete)
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => deleteGoal(index),
              ),
            ),
          );
        },
      ),

      // STATIC + CONNECTION: button calls the add function
      floatingActionButton: FloatingActionButton(
        onPressed: addSampleGoal,
        child: const Icon(Icons.add),
      ),
    );
  }
}
