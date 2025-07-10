import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/ride_hail_provider.dart';

class VehicleTypesWidget extends StatelessWidget {
  const VehicleTypesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RideHailProvider>(
      builder: (context, provider, child) {
        return Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle(),
              const SizedBox(height: 15),
              _buildVehicleTypeButtons(provider),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSectionTitle() {
    return const Text(
      'Vehicle Type',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildVehicleTypeButtons(RideHailProvider provider) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = constraints.maxWidth > 600;
        
        if (isTablet) {
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 3,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
            itemCount: provider.vehicleTypes.length,
            itemBuilder: (context, index) => _buildTypeButton(provider, provider.vehicleTypes[index]),
          );
        } else {
          return Row(
            children: provider.vehicleTypes.map((type) => _buildTypeButton(provider, type)).toList(),
          );
        }
      },
    );
  }

  Widget _buildTypeButton(RideHailProvider provider, String type) {
    final isSelected = provider.selectedVehicleType == type;
    
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = constraints.maxWidth > 600;
        
        return GestureDetector(
          onTap: () => provider.setVehicleType(type),
          child: Container(
            margin: isTablet ? EdgeInsets.zero : const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: _buildButtonDecoration(isSelected),
            child: Center(
              child: Text(
                type,
                style: _buildButtonTextStyle(isSelected),
              ),
            ),
          ),
        );
      },
    );
  }

  BoxDecoration _buildButtonDecoration(bool isSelected) {
    return BoxDecoration(
      color: isSelected ? Colors.blue : Colors.white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        color: isSelected ? Colors.blue : Colors.grey[300]!,
        width: 1,
      ),
    );
  }

  TextStyle _buildButtonTextStyle(bool isSelected) {
    return TextStyle(
      color: isSelected ? Colors.white : Colors.black87,
      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
    );
  }
} 