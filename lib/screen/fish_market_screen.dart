import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/image_slider.dart';
import '../widgets/category_section.dart';
import '../widgets/bottom_nav_bar.dart';


class FishMarketScreen extends StatelessWidget {
  const FishMarketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(),
              const ImageSlider(),

              // Kategori
              const Padding(
                padding: EdgeInsets.fromLTRB(14, 20, 14, 0),
                child: Text(
                  'Kategori',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
              const CategorySection(),

              // Produk Terbaru
              const Padding(
                padding: EdgeInsets.fromLTRB(14, 20, 14, 0),
                child: Text(
                  'Produk Terbaru',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    ProductCard(
                      fishType: 'ikan tawar',
                      name: 'Mujair',
                      seller: 'Lapak Pak Hadi',
                      rating: 4.9,
                      price: 'Rp 65.000/kg',
                    ),
                    ProductCard(
                      fishType: 'ikan laut',
                      name: 'Tongkol',
                      seller: 'Lapak Pak Roni',
                      rating: 4.8,
                      price: 'Rp 48.000/kg',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 0),
    );
  }
}

// =====================
// WIDGET ProductCard
// =====================
class ProductCard extends StatelessWidget {
  final String fishType;
  final String name;
  final String seller;
  final double rating;
  final String price;

  const ProductCard({
    Key? key,
    required this.fishType,
    required this.name,
    required this.seller,
    required this.rating,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 5,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar Placeholder
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fishType,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.black54,
                    fontFamily: 'Inter',
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter',
                  ),
                ),
                Text(
                  seller,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter',
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.star, size: 14, color: Colors.orange),
                    const SizedBox(width: 4),
                    Text(
                      rating.toString(),
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                        color: Color(0xFF88D8E9),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        fontFamily: 'Inter',
                      ),
                    ),
                    const Icon(
                      Icons.shopping_cart_outlined,
                      color: Color(0xFFB4ECF9),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
