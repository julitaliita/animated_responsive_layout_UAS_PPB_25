import 'package:flutter/material.dart';
import '../models/models.dart';

class ReplyListView extends StatelessWidget {
  final Email email;
  const ReplyListView({
    super.key,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 22,
                        backgroundImage: AssetImage(email.sender.avatarUrl),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              email.sender.name.fullName,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              email.subject,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.star_border),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          constraints: BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context).size.width * 0.7),
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .surfaceVariant
                                .withOpacity(0.5),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          child: Text(
                            email.content,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          constraints: BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context).size.width * 0.7),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade100,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                          ),
                          child: const Text(
                            'This is your reply...',
                            style: TextStyle(color: Colors.black87),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.outlineVariant,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: const InputDecoration(
                                hintText: 'Reply...',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.send),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
