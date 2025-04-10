import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      constraints: const BoxConstraints(maxWidth: 480),
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 31, 24, 31), // Ubah padding bawah dari 301 jadi 31
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header section
            Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFFEDEDED)),
                    color: Colors.white,
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.arrow_back, size: 20),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                const SizedBox(width: 20),
                const Text(
                  'Search',
                  style: TextStyle(
                    color: Color(0xFF101010),
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 19),
            const SearchInput(),

            const SizedBox(height: 20),
            // Recent searches header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Pencarian terkini',
                  style: TextStyle(
                    color: Color(0xFF101010),
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Delete',
                    style: TextStyle(
                      color: Color(0xFF88D8E9),
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 11),
            // Recent searches list
            Column(
              children: const [
                RecentSearchItem(title: 'Mujair'),
                RecentSearchItem(title: 'Bandeng'),
                RecentSearchItem(title: 'Udang'),
                RecentSearchItem(title: 'Tongkol'),
                RecentSearchItem(title: 'Kakap'),
              ],
            ),

            const SizedBox(height: 33),
            const Text(
              'Pesanan terbaru saya',
              style: TextStyle(
                color: Color(0xFF101010),
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 16),
            const RecentOrderCard(
              title: 'Mujair',
              vendor: 'Lapak Pak Roni',
              rating: 4.9,
            ),

            Container(
              height: 2,
              color: const Color(0xFFEDEDED),
              margin: const EdgeInsets.symmetric(vertical: 13),
            ),

            const RecentOrderCard(
              title: 'Tongkol',
              vendor: 'Lapak Pak Hadi',
              rating: 4.9,
            ),
          ],
        ),
      ),
    );
  }
}

class SearchInput extends StatelessWidget {
  const SearchInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFFEDEDED)),
          color: Colors.white,
        ),
        child: Row(
          children: const [
            Icon(Icons.search, size: 20, color: Color(0xFF878787)),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                'Search',
                style: TextStyle(
                  color: Color(0xFF878787),
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RecentSearchItem extends StatelessWidget {
  final String title;

  const RecentSearchItem({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.history, size: 24, color: Color(0xFF878787)),
              const SizedBox(width: 12),
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF101010),
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const Icon(Icons.close, size: 20, color: Color(0xFF878787)),
        ],
      ),
    );
  }
}

class RecentOrderCard extends StatelessWidget {
  final String title;
  final String vendor;
  final double rating;

  const RecentOrderCard({
    Key? key,
    required this.title,
    required this.vendor,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 70,
          height: 65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.black,
          ),
        ),
        const SizedBox(width: 9),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF101010),
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                vendor,
                style: const TextStyle(
                  color: Color(0xFF878787),
                  fontFamily: 'Inter',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.star, size: 16, color: Colors.amber),
                  const SizedBox(width: 4),
                  Text(
                    rating.toString(),
                    style: const TextStyle(
                      color: Color(0xFF101010),
                      fontFamily: 'Inter',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
