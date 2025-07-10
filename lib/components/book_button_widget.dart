import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/ride_hail_provider.dart';

class BookButtonWidget extends StatelessWidget {
  const BookButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RideHailProvider>(
      builder: (context, provider, child) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: _buildContainerDecoration(),
          child: Column(
            children: [
              _buildPriceSummary(provider),
              const SizedBox(height: 15),
              _buildBookButton(context, provider),
            ],
          ),
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

  Widget _buildPriceSummary(RideHailProvider provider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Total Price:',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        Text(
          '\$${provider.getCurrentPrice().toStringAsFixed(2)}',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildBookButton(BuildContext context, RideHailProvider provider) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: () => _handleBooking(context, provider),
        style: _buildButtonStyle(),
        child: const Text(
          'Book this Car',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  ButtonStyle _buildButtonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 3,
    );
  }

  void _handleBooking(BuildContext context, RideHailProvider provider) {
    provider.bookRide();
    _showBookingConfirmation(context, provider);
  }

  void _showBookingConfirmation(BuildContext context, RideHailProvider provider) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Booking ${provider.selectedVehicleSize} ${provider.selectedVehicleType} for \$${provider.getCurrentPrice().toStringAsFixed(2)}'),
        backgroundColor: Colors.green,
      ),
    );
  }
} 