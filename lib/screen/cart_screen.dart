import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: CartScreen()));
}

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<bool> _selectedItems = [true, false];
  final List<int> _quantities = [1, 1];

  void _updateQuantity(int index, int newQuantity) {
    if (newQuantity > 0) {
      setState(() {
        _quantities[index] = newQuantity;
      });
    }
  }

  void _toggleSelection(int index) {
    setState(() {
      _selectedItems[index] = !_selectedItems[index];
    });
  }

  double get _totalPrice {
    double total = 0;
    if (_selectedItems[0]) total += 65000 * _quantities[0];
    if (_selectedItems[1]) total += 48000 * _quantities[1];
    return total;
  }

  int get _selectedCount => _selectedItems.where((item) => item).length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            CartHeader(itemCount: 2),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: [
                    CartItem(
                      isSelected: _selectedItems[0],
                      onSelectionChanged: () => _toggleSelection(0),
                      quantity: _quantities[0],
                      onQuantityChanged: (qty) => _updateQuantity(0, qty),
                      imageUrl:
                          'https://cdn.builder.io/api/v1/image/assets/TEMP/b35fd06778b078143ccc1900bf695c05068b412c',
                      category: 'Ikan tawar',
                      name: 'Mujair',
                      price: 65000,
                    ),
                    const SizedBox(height: 24),
                    CartItem(
                      isSelected: _selectedItems[1],
                      onSelectionChanged: () => _toggleSelection(1),
                      quantity: _quantities[1],
                      onQuantityChanged: (qty) => _updateQuantity(1, qty),
                      imageUrl:
                          'https://cdn.builder.io/api/v1/image/assets/TEMP/b35fd06778b078143ccc1900bf695c05068b412c',
                      category: 'Ikan laut',
                      name: 'Tongkol',
                      price: 48000,
                    ),
                  ],
                ),
              ),
            ),
            CartFooter(
              isAllSelected: _selectedItems.every((item) => item),
              onSelectAll: () {
                setState(() {
                  final newValue = !_selectedItems.every((item) => item);
                  for (var i = 0; i < _selectedItems.length; i++) {
                    _selectedItems[i] = newValue;
                  }
                });
              },
              totalPrice: _totalPrice,
              selectedCount: _selectedCount,
            ),
          ],
        ),
      ),
    );
  }
}

class CartHeader extends StatelessWidget {
  final int itemCount;

  const CartHeader({Key? key, required this.itemCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      color: const Color(0xFF88D8E9),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Ini akan kembali ke halaman sebelumnya
            },
          ),
          const SizedBox(width: 8),
          Text(
            'Keranjang saya ($itemCount)',
            style: const TextStyle(
              color: Color(0xFF101010),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}


class CartItem extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onSelectionChanged;
  final int quantity;
  final Function(int) onQuantityChanged;
  final String imageUrl;
  final String category;
  final String name;
  final double price;

  const CartItem({
    Key? key,
    required this.isSelected,
    required this.onSelectionChanged,
    required this.quantity,
    required this.onQuantityChanged,
    required this.imageUrl,
    required this.category,
    required this.name,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isSelected,
          onChanged: (_) => onSelectionChanged(),
        ),
        const SizedBox(width: 8),
        Image.network(imageUrl, width: 80, height: 80, fit: BoxFit.cover),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(category,
                  style: const TextStyle(fontSize: 12, color: Colors.grey)),
              Text(name,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600)),
              const SizedBox(height: 4),
              Text('Rp${price.toStringAsFixed(0)}/kg',
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500)),
              const SizedBox(height: 8),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () => onQuantityChanged(quantity - 1),
                  ),
                  Text(quantity.toString(),
                      style: const TextStyle(fontSize: 16)),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () => onQuantityChanged(quantity + 1),
                  ),
                ],
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.delete_outline),
          onPressed: () {
            // aksi hapus
          },
        ),
      ],
    );
  }
}

class CartFooter extends StatelessWidget {
  final bool isAllSelected;
  final VoidCallback onSelectAll;
  final double totalPrice;
  final int selectedCount;

  const CartFooter({
    Key? key,
    required this.isAllSelected,
    required this.onSelectAll,
    required this.totalPrice,
    required this.selectedCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey)),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Checkbox(
                value: isAllSelected,
                onChanged: (_) => onSelectAll(),
              ),
              const Text('Semua'),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text('Total'),
              Text('Rp${totalPrice.toStringAsFixed(0)}'),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF88D8E9),
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            ),
            child: Text('Checkout ($selectedCount)'),
          ),
        ],
      ),
    );
  }
}
