import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/ride_hail_provider.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RideHailProvider>(
      builder: (context, provider, child) {
        return Container(
          decoration: _buildContainerDecoration(),
          child: _buildBottomNavigationBar(provider),
        );
      },
    );
  }

  BoxDecoration _buildContainerDecoration() {
    return BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          blurRadius: 10,
          offset: const Offset(0, -2),
        ),
      ],
    );
  }

  BottomNavigationBar _buildBottomNavigationBar(RideHailProvider provider) {
    return BottomNavigationBar(
      currentIndex: provider.selectedBottomNavIndex,
      onTap: (index) => provider.setSelectedBottomNavIndex(index),
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      items: _getNavigationItems(),
    );
  }

  List<BottomNavigationBarItem> _getNavigationItems() {
    return const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'Orders'),
      BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
    ];
  }
} 