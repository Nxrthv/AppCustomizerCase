import 'package:flutter/material.dart';
import 'package:app_custom/models/order_history.dart';
import 'package:intl/intl.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = OrderHistory.orders;

    return Scaffold(
      appBar: AppBar(title: const Text('Mis pedidos')),
      body: orders.isEmpty
          ? const Center(child: Text('📦 Aún no tienes pedidos'))
          : ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                final date = DateFormat('dd/MM/yyyy HH:mm').format(order.date);
                final total = order.items.fold(0.0, (sum, item) => sum + item.caseModel.price);

                return Card(
                  child: ExpansionTile(
                    title: Text('Pedido #${index + 1} - S/. ${total.toStringAsFixed(2)}'),
                    subtitle: Text(date),
                    children: order.items.map((item) {
                      return ListTile(
                        leading: item.localImage != null
                            ? Image.file(item.localImage!, width: 40, height: 40, fit: BoxFit.cover)
                            : item.networkImageUrl != null
                                ? Image.network(item.networkImageUrl!, width: 40, height: 40, fit: BoxFit.cover)
                                : const Icon(Icons.image),
                        title: Text(item.caseModel.name),
                        subtitle: Text("S/. ${item.caseModel.price.toStringAsFixed(2)}"),
                      );
                    }).toList(),
                  ),
                );
              },
            ),
    );
  }
}
