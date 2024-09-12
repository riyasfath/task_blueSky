import 'package:flutter/material.dart';
import '../login_screen.dart'; // Import LoginScreen if not already imported

class DashboardItem extends StatelessWidget {
  const DashboardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Welcome Message
              Text(
                'Welcome, User!',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 16.0),

              // Quick Access Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  DashboardButton(
                    icon: Icons.attach_money,
                    title: 'Revenue',
                    onPressed: () {
                      // Handle revenue button press
                    },
                  ),
                  DashboardButton(
                    icon: Icons.analytics,
                    title: 'Analytics',
                    onPressed: () {
                      // Handle analytics button press
                    },
                  ),
                  DashboardButton(
                    icon: Icons.notifications,
                    title: 'Notifications',
                    onPressed: () {
                      // Handle notifications button press
                    },
                  ),
                ],
              ),
              SizedBox(height: 24.0),

              // Summary Cards

              SizedBox(height: 24.0),

              // Chart Placeholder
              Container(
                height: 200,
                color: Colors.grey.shade200,
                child: const Center(
                  child: Text(
                    'Chart Placeholder',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
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
                  MaterialPageRoute(builder: (context) => LoginScreen()),
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

class DashboardButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onPressed;

  DashboardButton({
    required this.icon,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, size: 32.0),
          SizedBox(height: 8.0),
          Text(title, style: TextStyle(fontSize: 16.0)),
        ],
      ),
    );
  }
}

class SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  SummaryCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, size: 40.0, color: Colors.white),
          const SizedBox(height: 8.0),
          Text(title, style: const TextStyle(color: Colors.white, fontSize: 18.0)),
          const SizedBox(height: 4.0),
          Text(value, style: const TextStyle(color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
