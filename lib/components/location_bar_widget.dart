import 'package:flutter/material.dart';

class LocationBarWidget extends StatelessWidget {
  const LocationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: _buildContainerDecoration(),
      child: Row(
        children: [
          _buildLocationChip('FAV', Colors.blue),
          const SizedBox(width: 10),
          _buildLocationChip('SAN', Colors.green),
          const Spacer(),
          _buildLocationChip('5 mins', Colors.orange),
        ],
      ),
    );
  }

  BoxDecoration _buildContainerDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          blurRadius: 5,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }

  Widget _buildLocationChip(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
} 