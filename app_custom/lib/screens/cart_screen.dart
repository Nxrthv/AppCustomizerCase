import 'package:app_custom/models/order_history.dart';
import 'package:app_custom/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:app_custom/models/cart.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final total = Cart.items.fold(0.0, (sum, item) => sum + item.caseModel.price);

    return Scaffold(
      appBar: AppBar(title: const Text('Carrito')),
      body: Column(
        children: [
          Expanded(
            child: Cart.items.isEmpty
                ? const Center(child: Text('🛒 Tu carrito está vacío'))
                : ListView.builder(
                    itemCount: Cart.items.length,
                    itemBuilder: (context, index) {
                      final item = Cart.items[index];
                      return Card(
                        child: ListTile(
                          leading: item.localImage != null
                              ? Image.file(item.localImage!, width: 60, fit: BoxFit.cover)
                              : item.networkImageUrl != null
                                  ? Image.network(item.networkImageUrl!, width: 60, fit: BoxFit.cover)
                                  : const Icon(Icons.image),
                          title: Text(item.caseModel.name),
                          subtitle: Text("S/.${item.caseModel.price.toStringAsFixed(2)}"),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              setState(() {
                                Cart.removeItem(index);
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
          ),
          if (Cart.items.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    'Total: S/. ${total.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: _showPaymentSheet,
                    icon: const Icon(Icons.payment),
                    label: const Text('Realizar compra'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(fontSize: 18),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  void _showPaymentSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Seleccionar método de pago',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: Image.asset('assets/images/visa.png', height: 32),
              title: const Text('Tarjeta Visa'),
              trailing: const Icon(Icons.check_circle, color: Colors.green),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Visa seleccionada')),
                );
              },
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () {
                // Crear pedido con contenido del carrito
                final order = OrderModel(
                  items: List.from(Cart.items),
                  date: DateTime.now(),
                );

                OrderHistory.addOrder(order);   // Agregar pedido
                Cart.clear();                   // Vaciar carrito

                Navigator.pop(context);
                setState(() {}); // Para que se actualice el carrito vacío

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('✅ Pedido generado correctamente')),
                );
              },
              icon: const Icon(Icons.check),
              label: const Text('Confirmar compra'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(45),
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}