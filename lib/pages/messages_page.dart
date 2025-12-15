import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  final List<Map<String, String>> messages = const [
    {
      'user': 'Hida',
      'message': 'Halo, bagaimana kabarmu?',
      'time': '08:15',
    },
    {
      'user': 'Aisyah',
      'message': 'Jangan lupa rapat jam 10.',
      'time': '08:45',
    },
    {
      'user': 'Rellia',
      'message': 'Sudah selesai tugasnya?',
      'time': '09:10',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final msg = messages[index];
        return ListTile(
          leading: const CircleAvatar(child: Icon(Icons.person)),
          title: Text(msg['user']!),
          subtitle: Text(msg['message']!),
          trailing: Text(msg['time']!),
        );
      },
    );
  }
}