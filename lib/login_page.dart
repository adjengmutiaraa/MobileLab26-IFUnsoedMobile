
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController =
      TextEditingController();

  final TextEditingController _passwordController =
      TextEditingController();

  // Menyimpan username ke local storage
  Future<void> _saveUsername() async {
    SharedPreferences prefs =
        await SharedPreferences.getInstance();

    await prefs.setString(
      'username',
      _usernameController.text,
    );
  }

  // Menampilkan input username dan password
  Widget _showInput(
    TextEditingController controller,
    String placeholder,
    bool isPassword,
  ) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: placeholder,
        border: const OutlineInputBorder(),
      ),
    );
  }

  // Menampilkan dialog
  Future<void> _showDialog(
    String pesan,
    Widget alamat,
  ) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(pesan),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => alamat,
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  // Proses login
  Future<void> _login() async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username == 'admin' && password == 'admin') {
      await _saveUsername();

      if (!mounted) return;

      _showDialog(
        'Anda Berhasil Login',
        const HomePage(),
      );
    } else {
      _showDialog(
        'Username dan Password Salah',
        const LoginPage(),
      );
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _showInput(
              _usernameController,
              'Masukkan Username',
              false,
            ),

            const SizedBox(height: 15),

            _showInput(
              _passwordController,
              'Masukkan Password',
              true,
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: _login,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
