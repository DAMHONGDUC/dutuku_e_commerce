import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyOrderDetailScreen extends StatelessWidget {
  const MyOrderDetailScreen({super.key});

  // Mock data for an order detail (in a real app, you'd fetch this from an API)
  Map<String, dynamic> _getMockOrderDetails() {
    return {
      'orderId': 1,
      'status': 'Delivered',
      'orderDate': '2025-06-01',
      'deliveryAddress': '123 Main St, Anytown, USA 12345',
      'items': [
        {'name': 'Wireless Headphones', 'quantity': 1, 'price': 99.99},
        {'name': 'Phone Charger', 'quantity': 2, 'price': 19.99},
        {'name': 'Laptop Sleeve', 'quantity': 1, 'price': 29.99},
      ],
      'subtotal': 169.96,
      'shippingFee': 5.00,
      'total': 174.96,
      'paymentMethod': 'Credit Card (**** 1234)',
    };
  }

  @override
  Widget build(BuildContext context) {
    final orderDetails = _getMockOrderDetails();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Pop the current route off the nested My Order stack
            GoRouter.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order ID: ${orderDetails['orderId']}',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'Status: ${orderDetails['status']}',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: orderDetails['status'] == 'Delivered'
                    ? Colors.green
                    : Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text('Order Date: ${orderDetails['orderDate']}'),
            const SizedBox(height: 16),
            Text(
              'Delivery Information',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text('Address: ${orderDetails['deliveryAddress']}'),
            const SizedBox(height: 16),
            Text('Order Items', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            // Display list of items
            ..._buildOrderItems(
              orderDetails['items'] as List<Map<String, dynamic>>,
            ),
            const Divider(height: 32, thickness: 1),
            _buildSummaryRow(
              'Subtotal',
              '\$${orderDetails['subtotal'].toStringAsFixed(2)}',
            ),
            _buildSummaryRow(
              'Shipping Fee',
              '\$${orderDetails['shippingFee'].toStringAsFixed(2)}',
            ),
            const Divider(height: 16, thickness: 1),
            _buildSummaryRow(
              'Total',
              '\$${orderDetails['total'].toStringAsFixed(2)}',
              isTotal: true,
            ),
            const SizedBox(height: 16),
            Text(
              'Payment Method',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text('${orderDetails['paymentMethod']}'),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Example: Reorder button action
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Reordering Order ${orderDetails['orderId']}',
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                ),
                child: const Text('Reorder This Order'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper to build individual item rows
  List<Widget> _buildOrderItems(List<Map<String, dynamic>> items) {
    return items.map((item) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                '${item['quantity']}x ${item['name']}',
                style: const TextStyle(fontSize: 16),
              ),
            ),
            Text(
              '\$${(item['quantity'] * item['price']).toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
    }).toList();
  }

  // Helper to build summary rows (subtotal, shipping, total)
  Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isTotal ? 18 : 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: isTotal ? 18 : 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
