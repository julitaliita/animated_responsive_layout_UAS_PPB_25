import 'package:flutter/material.dart';
import '../models/data.dart';
import '../models/models.dart';
import 'email_widget.dart';
import 'search_bar.dart';

class EmailListView extends StatelessWidget {
  const EmailListView({
    super.key,
    required this.onEmailSelected,
  });

  final ValueChanged<Email> onEmailSelected;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: emails.length,
      itemBuilder: (context, index) {
        final email = emails[index];
        return InkWell(
          onTap: () => onEmailSelected(email),
          child: EmailWidget(email: email),
        );
      },
    );
  }
}