import 'package:flutter/material.dart';
import '../dashboard_screen.dart';
import '../login_screen.dart'; // Import LoginScreen

class SettingsItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await _showExitDialog(context);
      },
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            // General Settings
            SettingsSection(
              title: 'General',
              options: [
                SettingsOption(
                  icon: Icons.language,
                  title: 'Language',
                  onTap: () {
                    // Handle language selection
                  },
                ),
                SettingsOption(
                  icon: Icons.notifications,
                  title: 'Notifications',
                  onTap: () {
                    // Handle notifications settings
                  },
                ),
                SettingsOption(
                  icon: Icons.dark_mode,
                  title: 'Dark Mode',
                  onTap: () {
                    // Handle dark mode toggle
                  },
                ),
              ],
            ),
            SizedBox(height: 16.0),
            // Account Settings
            SettingsSection(
              title: 'Account',
              options: [
                SettingsOption(
                  icon: Icons.person,
                  title: 'Profile',
                  onTap: () {
                    // Handle profile management
                  },
                ),
                SettingsOption(
                  icon: Icons.lock,
                  title: 'Change Password',
                  onTap: () {
                    // Handle password change
                  },
                ),
                SettingsOption(
                  icon: Icons.email,
                  title: 'Email Preferences',
                  onTap: () {
                    // Handle email preferences
                  },
                ),
              ],
            ),
            SizedBox(height: 16.0),
            // App Settings
            SettingsSection(
              title: 'App Settings',
              options: [
                SettingsOption(
                  icon: Icons.update,
                  title: 'Check for Updates',
                  onTap: () {
                    // Handle app update check
                  },
                ),
                SettingsOption(
                  icon: Icons.help,
                  title: 'Help & Support',
                  onTap: () {
                    // Handle help and support
                  },
                ),
                SettingsOption(
                  icon: Icons.info,
                  title: 'About',
                  onTap: () {
                    // Handle about section
                  },
                ),
              ],
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

class SettingsSection extends StatelessWidget {
  final String title;
  final List<SettingsOption> options;

  SettingsSection({
    required this.title,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        ...options,
      ],
    );
  }
}

class SettingsOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  SettingsOption({
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
