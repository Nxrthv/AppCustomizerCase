import 'package:flutter/material.dart';
import 'admin_panel.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final TextEditingController _emailController = TextEditingController();
  String? _userType;

  void _login() {
    final email = _emailController.text.trim();

    if (email == 'admin@example.com') {
      setState(() => _userType = 'admin');
    } else if (email.contains('@')) {
      setState(() => _userType = 'user');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Correo inválido')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_userType == 'admin') return const AdminPanel();

    return Scaffold(
      appBar: AppBar(title: const Text('Cuenta')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('Iniciar sesión', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Correo electrónico',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _login,
              icon: const Icon(Icons.login),
              label: const Text('Ingresar'),
            ),
          ],
        ),
      ),
    );
  }
}
