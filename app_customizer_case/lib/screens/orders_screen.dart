import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Órdenes'),
        centerTitle: true,
      ),
      body: const SafeArea(
        child: Center(
          child: Text('Historial de órdenes'),
        ),
      ),
    );
  }
}

