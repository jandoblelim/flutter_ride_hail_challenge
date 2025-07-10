import 'package:flutter/material.dart';

class RideHailProvider extends ChangeNotifier {
  // where the user is
  double? _userLatitude;
  double? _userLongitude;
  
  // where they want to go
  String? _destination;
  double? _destinationLatitude;
  double? _destinationLongitude;
  
  // ride status stuff
  bool _isSearchingForRide = false;
  bool _isRideActive = false;
  String? _currentDriverId;
  String? _currentRideId;
  
  // pricing and timing
  double? _estimatedPrice;
  int? _estimatedDuration;
  String? _selectedVehicleType = 'Economy';
  String? _selectedVehicleSize = 'Small';
  
  // UI state
  int _selectedTabIndex = 0;
  int _selectedBottomNavIndex = 0;
  
  // hardcoded data for now
  final List<String> _serviceTabs = ['Ride', 'Delivery', 'Eats', 'Flights'];
  final List<String> _vehicleTypes = ['Economy', 'Luxury', 'Taxicab'];
  final List<Map<String, dynamic>> _vehicleSizes = [
    {'name': 'Small', 'price': 35.50, 'time': '3 mins'},
    {'name': 'Medium', 'price': 50.00, 'time': '4 mins'},
    {'name': 'Large', 'price': 150.43, 'time': '5 mins'},
  ];
  final List<Map<String, String>> _communityEvents = [
    {'date': 'Sun, May 3', 'event': 'Carmichael Farmer Market'},
    {'date': 'Mon, May 4', 'event': 'Downtown Food Festival'},
    {'date': 'Tue, May 5', 'event': 'Tech Meetup'},
    {'date': 'Wed, May 6', 'event': 'Art Gallery Opening'},
  ];
  
  // Getters
  double? get userLatitude => _userLatitude;
  double? get userLongitude => _userLongitude;
  String? get destination => _destination;
  double? get destinationLatitude => _destinationLatitude;
  double? get destinationLongitude => _destinationLongitude;
  bool get isSearchingForRide => _isSearchingForRide;
  bool get isRideActive => _isRideActive;
  String? get currentDriverId => _currentDriverId;
  String? get currentRideId => _currentRideId;
  double? get estimatedPrice => _estimatedPrice;
  int? get estimatedDuration => _estimatedDuration;
  String? get selectedVehicleType => _selectedVehicleType;
  String? get selectedVehicleSize => _selectedVehicleSize;
  int get selectedTabIndex => _selectedTabIndex;
  int get selectedBottomNavIndex => _selectedBottomNavIndex;
  List<String> get serviceTabs => _serviceTabs;
  List<String> get vehicleTypes => _vehicleTypes;
  List<Map<String, dynamic>> get vehicleSizes => _vehicleSizes;
  List<Map<String, String>> get communityEvents => _communityEvents;
  
  void setUserLocation(double latitude, double longitude) {
    _userLatitude = latitude;
    _userLongitude = longitude;
    notifyListeners();
  }
  
  void setDestination(String destination, double latitude, double longitude) {
    _destination = destination;
    _destinationLatitude = latitude;
    _destinationLongitude = longitude;
    notifyListeners();
  }
  
  void startSearchingForRide() {
    _isSearchingForRide = true;
    notifyListeners();
  }
  
  void stopSearchingForRide() {
    _isSearchingForRide = false;
    notifyListeners();
  }
  
  void startRide(String driverId, String rideId) {
    _isRideActive = true;
    _isSearchingForRide = false;
    _currentDriverId = driverId;
    _currentRideId = rideId;
    notifyListeners();
  }
  
  void endRide() {
    _isRideActive = false;
    _currentDriverId = null;
    _currentRideId = null;
    notifyListeners();
  }
  
  void setEstimatedPrice(double price) {
    _estimatedPrice = price;
    notifyListeners();
  }
  
  void setEstimatedDuration(int duration) {
    _estimatedDuration = duration;
    notifyListeners();
  }
  
  void setVehicleType(String vehicleType) {
    _selectedVehicleType = vehicleType;
    notifyListeners();
  }
  
  void setVehicleSize(String vehicleSize) {
    _selectedVehicleSize = vehicleSize;
    notifyListeners();
  }
  
  void setSelectedTabIndex(int index) {
    _selectedTabIndex = index;
    notifyListeners();
  }
  
  void setSelectedBottomNavIndex(int index) {
    _selectedBottomNavIndex = index;
    notifyListeners();
  }
  
  void bookRide() {
    final selectedSize = _vehicleSizes.firstWhere((size) => size['name'] == _selectedVehicleSize);
    _estimatedPrice = selectedSize['price'];
    _estimatedDuration = 5; // TODO: get real ETA from API
    _destination = 'WMATA Metro Station';
    _destinationLatitude = 38.8977;
    _destinationLongitude = -77.0365;
    _isSearchingForRide = true;
    notifyListeners();
  }
  
  void clearRideData() {
    _destination = null;
    _destinationLatitude = null;
    _destinationLongitude = null;
    _estimatedPrice = null;
    _estimatedDuration = null;
    _isSearchingForRide = false;
    notifyListeners();
  }
  
  Map<String, dynamic>? getSelectedVehicleSize() {
    try {
      return _vehicleSizes.firstWhere((size) => size['name'] == _selectedVehicleSize);
    } catch (e) {
      return null;
    }
  }
  
  double getCurrentPrice() {
    final selectedSize = getSelectedVehicleSize();
    return selectedSize?['price'] ?? 0.0;
  }
} 