import 'package:flutter/material.dart';
import 'models/models.dart';
import 'widgets/email_list_view.dart';
import 'widgets/search_bar.dart';
import 'widgets/reply_list_view.dart';
import 'widgets/disappearing_bottom_navigation_bar.dart';
import 'widgets/disappearing_navigation_rail.dart';
import 'widgets/animated_floating_action_button.dart';
import 'transitions/list_detail_transition.dart';
import 'pages/articles_page.dart';
import 'pages/messages_page.dart';
import 'pages/groups_page.dart';

class DestinationsView extends StatefulWidget {
  const DestinationsView({super.key});

  @override
  State<DestinationsView> createState() => _DestinationsViewState();
}
class _DestinationsViewState extends State<DestinationsView> {
  int selectedIndex = 0;
  Email? selectedEmail;

  final destinations = const [
    NavigationDestination(
      icon: Icon(Icons.inbox_outlined),
      selectedIcon: Icon(Icons.inbox),
      label: 'Inbox',
    ),
    NavigationDestination(
      icon: Icon(Icons.article_outlined),
      selectedIcon: Icon(Icons.article),
      label: 'Articles',
    ),
    NavigationDestination(
      icon: Icon(Icons.chat_bubble_outline),
      selectedIcon: Icon(Icons.chat_bubble),
      label: 'Messages',
    ),
    NavigationDestination(
      icon: Icon(Icons.group_outlined),
      selectedIcon: Icon(Icons.group),
      label: 'Groups',
    ),
  ];
  void _handleAddAction(BuildContext context) {
    switch (selectedIndex) {
      case 0:
        _showAddDialog(context, 'New Email');
        break;
      case 1:
        _showAddDialog(context, 'New Article');
        break;
      case 2:
        _showAddDialog(context, 'New Message');
        break;
      case 3:
        _showAddDialog(context, 'New Group');
        break;
    }
  }
  void _handleDeleteAction(BuildContext context) {
    String title;

    switch (selectedIndex) {
      case 0:
        title = 'Delete Email';
        break;
      case 1:
        title = 'Delete Article';
        break;
      case 2:
        title = 'Delete Message';
        break;
      case 3:
        title = 'Delete Group';
        break;
      default:
        title = 'Delete';
    }
    _showDeleteDialog(context, title);
  }
  void _showDeleteDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: const Text('Apakah Anda yakin ingin menghapus data ini?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Batal'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('$title berhasil')));
              },
              child: const Text('Hapus'),
            ),
          ],
        );
      },
    );
  }
  void _showAddDialog(BuildContext context, String title) {
    final TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Masukkan nama'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$title ditambahkan: ${controller.text}'),
                  ),
                );
              },
              child: const Text('Tambah'),
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 600;

        return Scaffold(
          drawer: Drawer(
            child: Column(
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(color: Color.fromARGB(255, 37, 118, 184)),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'animated responsive layout',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.inbox),
                  title: const Text('Inbox'),
                  selected: selectedIndex == 0,
                  onTap: () {
                    setState(() => selectedIndex = 0);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.article),
                  title: const Text('Articles'),
                  selected: selectedIndex == 1,
                  onTap: () {
                    setState(() => selectedIndex = 1);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.chat_bubble),
                  title: const Text('Messages'),
                  selected: selectedIndex == 2,
                  onTap: () {
                    setState(() => selectedIndex = 2);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.group),
                  title: const Text('Groups'),
                  selected: selectedIndex == 3,
                  onTap: () {
                    setState(() => selectedIndex = 3);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ), 
          appBar: AppBar(
            elevation: 1,
            title: Text(destinations[selectedIndex].label),
            actions: [
              IconButton(
                icon: const Icon(Icons.delete_outline),
                tooltip: 'Hapus',
                onPressed: () {
                  _handleDeleteAction(context);
                },
              ),
            ],
          ),
          body: IndexedStack(
            index: selectedIndex,
            children: [
              Row(
                children: [
                  if (!isMobile)
                    DisappearingNavigationRail(
                      isVisible: true,
                      selectedIndex: selectedIndex,
                      destinations: destinations,
                      onDestinationSelected: (index) {
                        setState(() => selectedIndex = index);
                      },
                    ),

                  if (!isMobile) const VerticalDivider(width: 1),

                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              const SearchBarWidget(),
                              Expanded(
                                child: EmailListView(
                                  onEmailSelected: (email) {
                                    setState(() {
                                      selectedEmail = email;
                                    });
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
                    ),
                  ),
                ],
              ),

              const ArticlesPage(),
              const MessagesPage(),
              const GroupsPage(),
            ],
          ),
          bottomNavigationBar: DisappearingBottomNavigationBar(
            isVisible: isMobile,
            selectedIndex: selectedIndex,
            destinations: destinations,
            onDestinationSelected: (index) {
              setState(() => selectedIndex = index);
            },
          ),
          floatingActionButton: AnimatedFloatingActionButton(
            isVisible: true,
            onPressed: () {
              _handleAddAction(context);
            },
          ),
        );
      },
    );
  }
}
 