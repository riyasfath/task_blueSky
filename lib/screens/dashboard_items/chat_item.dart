import 'package:flutter/material.dart';
import '../dashboard_screen.dart';
import '../login_screen.dart'; // Import LoginScreen

class ChatItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await _showExitDialog(context);
      },
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(8.0),
          children: <Widget>[
            ChatContact(
              name: 'abinav',
              lastMessage: 'Hey, how are you?',
              time: '10:30 AM',
              avatarColor: Colors.blue,
            ),
            ChatContact(
              name: 'munavvir',
              lastMessage: 'See you at the meeting.',
              time: '9:45 AM',
              avatarColor: Colors.red,
            ),
            ChatContact(
              name: 'Robert ',
              lastMessage: 'Can we reschedule?',
              time: 'Yesterday',
              avatarColor: Colors.green,
            ),
            ChatContact(
              name: 'Emily ',
              lastMessage: 'Thanks for the update!',
              time: '2 days ago',
              avatarColor: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _showExitDialog(BuildContext context) async {
    return (await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Exit'),
          content: const Text('Do you really want to exit?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => DashboardScreen()),
                      (route) => false,
                );
              },
            ),
          ],
        );
      },
    )) ?? false;
  }
}

class ChatContact extends StatelessWidget {
  final String name;
  final String lastMessage;
  final String time;
  final Color avatarColor;

  ChatContact({
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.avatarColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: avatarColor,
        child: Text(
          name[0],
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      title: Text(name),
      subtitle: Text(lastMessage),
      trailing: Text(time),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatDetailScreen(name: name)),
        );
      },
    );
  }
}

class ChatDetailScreen extends StatelessWidget {
  final String name;

  ChatDetailScreen({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$name\'s Chat'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text('Chat details for $name'),
      ),
    );
  }
}
