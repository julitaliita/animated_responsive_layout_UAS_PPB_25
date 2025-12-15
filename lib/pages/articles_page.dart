import 'package:flutter/material.dart';

class ArticlesPage extends StatelessWidget {
  const ArticlesPage({super.key});

  final List<Map<String, String>> articles = const [
    {
      'title': 'Bencana Alam: Gempa Bumi di Jawa',
      'subtitle': 'Gempa bumi mengguncang Jawa dengan magnitudo 6.2',
    },
    {
      'title': 'Kebakaran Hutan di Kalimantan',
      'subtitle': 'Asap tebal melanda beberapa kota akibat kebakaran hutan',
    },
    {
      'title': 'Banjir di Jakarta',
      'subtitle': 'Banjir merendam beberapa wilayah Jakarta setelah hujan deras',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: const Icon(Icons.article),
            title: Text(article['title']!),
            subtitle: Text(article['subtitle']!),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          ),
        );
      },
    );
  }
}
