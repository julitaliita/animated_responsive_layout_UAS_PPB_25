import 'package:flutter/material.dart';

class GroupsPage extends StatelessWidget {
  const GroupsPage({super.key});

  final List<Map<String, String>> groups = const [
    {
      'name': 'MK PPB 1 (III B)',
      'description': 'Kelompok belajar untuk tugas dan diskusi.',
    },
    {
      'name': 'grup belajar',
      'description': 'Tim proyek untuk kerja sama kelas.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 3 / 2,
      ),
      itemCount: groups.length,
      itemBuilder: (context, index) {
        final group = groups[index];
        return Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  group['name']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  group['description']!,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
