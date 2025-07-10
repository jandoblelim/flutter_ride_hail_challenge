import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/ride_hail_provider.dart';
import '../components/location_bar_widget.dart';
import '../components/location_section_widget.dart';
import '../components/vehicle_types_widget.dart';
import '../components/vehicle_sizes_widget.dart';
import '../components/book_button_widget.dart';

class RideSelectionScreen extends StatefulWidget {
  const RideSelectionScreen({super.key});

  @override
  State<RideSelectionScreen> createState() => _RideSelectionScreenState();
}

class _RideSelectionScreenState extends State<RideSelectionScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Select Ride',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const LocationBarWidget(),
          const LocationSectionWidget(),
          const VehicleTypesWidget(),
          const Expanded(child: VehicleSizesWidget()),
          const BookButtonWidget(),
        ],
      ),
    );
  }
} 