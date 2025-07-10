import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/ride_hail_provider.dart';

class CommunityEventsWidget extends StatelessWidget {
  const CommunityEventsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(),
          const SizedBox(height: 15),
          Expanded(child: _buildEventsList()),
        ],
      ),
    );
  }

  Widget _buildSectionTitle() {
    return const Text(
      'Community Events',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildEventsList() {
    return Consumer<RideHailProvider>(
      builder: (context, provider, child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            final isTablet = constraints.maxWidth > 600;
            
            if (isTablet) {
              // Grid layout for tablets
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: provider.communityEvents.length,
                itemBuilder: (context, index) => _buildEventItem(provider.communityEvents[index]),
              );
            } else {
              // List layout for phones
              return ListView.builder(
                itemCount: provider.communityEvents.length,
                itemBuilder: (context, index) => _buildEventItem(provider.communityEvents[index]),
              );
            }
          },
        );
      },
    );
  }

  Widget _buildEventItem(Map<String, String> event) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: _buildEventDecoration(),
      child: Row(
        children: [
          _buildEventIndicator(),
          const SizedBox(width: 15),
          _buildEventDetails(event),
          _buildArrowIcon(),
        ],
      ),
    );
  }

  BoxDecoration _buildEventDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          blurRadius: 5,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }

  Widget _buildEventIndicator() {
    return Container(
      width: 4,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  Widget _buildEventDetails(Map<String, String> event) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            event['date']!,
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            event['event']!,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildArrowIcon() {
    return const Icon(
      Icons.arrow_forward_ios,
      color: Colors.grey,
      size: 16,
    );
  }
} 