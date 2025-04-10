import 'package:flutter/material.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildCategoryBox('IKAN LAUT'),
          const SizedBox(width: 98),
          _buildCategoryBox('IKAN TAWAR'),
        ],
      ),
    );
  }

  Widget _buildCategoryBox(String title) {
    return Container(
      width: 100,
      height: 90,
      decoration: BoxDecoration(
        color: const Color(0xFF88D8E9),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}