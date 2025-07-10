import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/ride_hail_provider.dart';
import '../screens/ride_selection_screen.dart';

class ServiceTabsWidget extends StatelessWidget {
  const ServiceTabsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RideHailProvider>(
      builder: (context, provider, child) {
        return Container(
          height: 50,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: provider.serviceTabs.length,
            itemBuilder: (context, index) => _buildTabItem(context, provider, index),
          ),
        );
      },
    );
  }

  Widget _buildTabItem(BuildContext context, RideHailProvider provider, int index) {
    final isSelected = provider.selectedTabIndex == index;
    
    return GestureDetector(
      onTap: () => _handleTabTap(context, provider, index),
      child: Container(
        margin: const EdgeInsets.only(right: 15),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey[300]!,
            width: 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                _getTabIcon(provider.serviceTabs[index]),
                size: 18,
                color: isSelected ? Colors.white : Colors.grey[600],
              ),
              const SizedBox(width: 8),
              Text(
                provider.serviceTabs[index],
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black87,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getTabIcon(String tabName) {
    switch (tabName) {
      case 'Ride':
        return Icons.directions_car;
      case 'Delivery':
        return Icons.local_shipping;
      case 'Eats':
        return Icons.restaurant;
      case 'Flights':
        return Icons.flight;
      default:
        return Icons.category; // just in case
    }
  }

  void _handleTabTap(BuildContext context, RideHailProvider provider, int index) {
    provider.setSelectedTabIndex(index);
    
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const RideSelectionScreen()),
      );
    }
  }
} 