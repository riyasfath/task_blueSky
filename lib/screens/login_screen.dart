import 'package:flutter/material.dart';
import 'package:task_bluesky/screens/dashboard_screen.dart';
import 'package:task_bluesky/screens/phoneLogin_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome Screen', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.green],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'LOGIN',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.green),
                ),
                const SizedBox(height: 30.0),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Gmail',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.mail, color: Colors.green),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 15.0),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock, color: Colors.green),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.visibility, color: Colors.green),
                      onPressed: () {
                        // Toggle password visibility
                      },
                    ),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 15.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardScreen()),
                    );
                  },
                  child: const Text('Login', style: TextStyle(color: Colors.green)),
                ),
                const SizedBox(height: 30.0),
                ElevatedButton.icon(
                  onPressed: () {
                    // Navigate to Phone login screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PhoneLoginScreen()),
                    );
                  },
                  icon: const Icon(Icons.phone_android, color: Colors.green),
                  label: const Text('Login with Phone', style: TextStyle(color: Colors.green)),
                ),
                const SizedBox(height: 30.0),
                TextButton(
                  onPressed: () {
                  },
                  child: const Text('Forgot Password?', style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(height: 16.0),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {
                      // Navigate to sign up screen or handle sign up action
                    },
                    child: const Text('Register', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
