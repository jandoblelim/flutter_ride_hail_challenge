import 'package:flutter/material.dart';

class LocationSectionWidget extends StatelessWidget {
  const LocationSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: _buildContainerDecoration(),
      child: Column(
        children: [
          _buildLocationRow('Pickup', 'Wheble Reston East', Colors.blue),
          const SizedBox(height: 20),
          _buildLocationRow('Dropoff', 'WMATA Metro Station', Colors.red),
        ],
      ),
    );
  }

  BoxDecoration _buildContainerDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }

  Widget _buildLocationRow(String label, String address, Color dotColor) {
    return Row(
      children: [
        _buildLocationDot(dotColor),
        const SizedBox(width: 15),
        _buildLocationDetails(label, address),
      ],
    );
  }

  Widget _buildLocationDot(Color color) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildLocationDetails(String label, String address) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            address,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
} 