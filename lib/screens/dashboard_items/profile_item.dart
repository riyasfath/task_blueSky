import 'package:flutter/material.dart';
import '../login_screen.dart'; // Import LoginScreen if not already imported

class ProfileItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await _showExitDialog(context);
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Profile Picture
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: const NetworkImage(
                    'https://www.example.com/profile_picture.jpg', // Replace with your image URL
                  ),
                  backgroundColor: Colors.grey.shade200,
                ),
              ),
              SizedBox(height: 16.0),
              // User Info
              Center(
                child: Column(
                  children: <Widget>[
                    Text(
                      'Muhammed Riyas',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      'riyas@gmail.com',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.0),
              // Profile Options
              Expanded(
                child: ListView(
                  children: <Widget>[
                    ProfileOption(
                      icon: Icons.person,
                      title: 'Edit Profile',
                      onTap: () {
                        // Handle edit profile action
                      },
                    ),
                    ProfileOption(
                      icon: Icons.lock,
                      title: 'Change Password',
                      onTap: () {
                        // Handle change password action
                      },
                    ),
                    ProfileOption(
                      icon: Icons.notifications,
                      title: 'Notifications',
                      onTap: () {
                        // Handle notifications action
                      },
                    ),
                    ProfileOption(
                      icon: Icons.settings,
                      title: 'Settings',
                      onTap: () {
                        // Handle settings action
                      },
                    ),
                    ProfileOption(
                      icon: Icons.help,
                      title: 'Help & Support',
                      onTap: () {
                        // Handle help and support action
                      },
                    ),
                    ProfileOption(
                      icon: Icons.logout,
                      title: 'Logout',
                      onTap: () {
                        _showLogoutDialog(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showLogoutDialog(BuildContext context) async {
    final bool? shouldLogout = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Do you really want to log out?'),
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
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );

    if (shouldLogout == true) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false,
      );
    }
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

class ProfileOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  ProfileOption({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.green),
      title: Text(title),
      onTap: onTap,
    );
  }
}
