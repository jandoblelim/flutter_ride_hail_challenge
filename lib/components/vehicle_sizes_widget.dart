import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/ride_hail_provider.dart';

class VehicleSizesWidget extends StatelessWidget {
  const VehicleSizesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RideHailProvider>(
      builder: (context, provider, child) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle(),
              const SizedBox(height: 15),
              Expanded(child: _buildVehicleList(provider)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSectionTitle() {
    return const Text(
      'Vehicle Size',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildVehicleList(RideHailProvider provider) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = constraints.maxWidth > 600;
        
        if (isTablet) {
          // grid for bigger screens
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2.5,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
            itemCount: provider.vehicleSizes.length,
            itemBuilder: (context, index) => _buildVehicleItem(provider, provider.vehicleSizes[index]),
          );
        } else {
          // list for phones
          return ListView.builder(
            itemCount: provider.vehicleSizes.length,
            itemBuilder: (context, index) => _buildVehicleItem(provider, provider.vehicleSizes[index]),
          );
        }
      },
    );
  }

  Widget _buildVehicleItem(RideHailProvider provider, Map<String, dynamic> size) {
    final isSelected = provider.selectedVehicleSize == size['name'];
    
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = constraints.maxWidth > 600;
        
        return GestureDetector(
          onTap: () => provider.setVehicleSize(size['name']),
          child: Container(
            margin: isTablet ? EdgeInsets.zero : const EdgeInsets.only(bottom: 15),
            padding: const EdgeInsets.all(20),
            decoration: _buildVehicleDecoration(isSelected),
            child: isTablet ? _buildTabletLayout(size, isSelected) : _buildPhoneLayout(size, isSelected),
          ),
        );
      },
    );
  }

  Widget _buildPhoneLayout(Map<String, dynamic> size, bool isSelected) {
    return Row(
      children: [
        _buildCarIcon(isSelected),
        const SizedBox(width: 15),
        _buildVehicleDetails(size, isSelected),
        _buildPriceAndTime(size, isSelected),
        const SizedBox(width: 10),
        _buildNowBadge(),
      ],
    );
  }

  Widget _buildTabletLayout(Map<String, dynamic> size, bool isSelected) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _buildCarIcon(isSelected),
            const SizedBox(width: 15),
            Expanded(child: _buildVehicleDetails(size, isSelected)),
            _buildNowBadge(),
          ],
        ),
        const SizedBox(height: 15),
        _buildPriceAndTime(size, isSelected),
      ],
    );
  }

  BoxDecoration _buildVehicleDecoration(bool isSelected) {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      border: Border.all(
        color: isSelected ? Colors.blue : Colors.grey[300]!,
        width: isSelected ? 2 : 1,
      ),
      boxShadow: isSelected
          ? [
              BoxShadow(
                color: Colors.blue.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ]
          : [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
    );
  }

  Widget _buildCarIcon(bool isSelected) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(
        Icons.directions_car,
        color: isSelected ? Colors.white : Colors.grey[600],
        size: 24,
      ),
    );
  }

  Widget _buildVehicleDetails(Map<String, dynamic> size, bool isSelected) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            size['name'],
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.blue : Colors.black87,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'License: V83***7539', // fake license plate
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceAndTime(Map<String, dynamic> size, bool isSelected) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '\$${size['price'].toStringAsFixed(2)}',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.blue : Colors.black87,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          size['time'],
          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
        ),
      ],
    );
  }

  Widget _buildNowBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Text(
        'Now',
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
} 