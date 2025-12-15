import 'package:flutter/material.dart';
import '../models/models.dart';
import '../widgets/email_list_view.dart';
import '../widgets/search_bar.dart';
import '../widgets/reply_list_view.dart';
import '../transitions/list_detail_transition.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({super.key});

  @override
  State<InboxPage> createState() => _InboxPageState();
}
class _InboxPageState extends State<InboxPage> {
  Email? selectedEmail;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              const SearchBarWidget(),
              Expanded(
                child: EmailListView(
                  onEmailSelected: (email) {
                    setState(() => selectedEmail = email);
                  },
                ),
              ),
            ],
          ),
        ),

        if (!isMobile) const VerticalDivider(width: 1),

        if (!isMobile)
          Expanded(
            child: ListDetailTransition(
              child: selectedEmail == null
                  ? const Center(child: Text('Select an email'))
                  : ReplyListView(email: selectedEmail!),
            ),
          ),
      ],
    );
  }
}