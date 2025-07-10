import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/ride_hail_provider.dart';
import '../components/header_widget.dart';
import '../components/service_tabs_widget.dart';
import '../components/promo_banner_widget.dart';
import '../components/community_events_widget.dart';
import '../components/bottom_navigation_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    _initializeUserLocation();
  }

  void _initializeUserLocation() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<RideHailProvider>(context, listen: false);
      provider.setUserLocation(40.7128, -74.0060);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            const HeaderWidget(),
            const ServiceTabsWidget(),
            const PromoBannerWidget(),
            const Expanded(child: CommunityEventsWidget()),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}