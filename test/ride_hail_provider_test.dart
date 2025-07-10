import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ride_hail_challenge/providers/ride_hail_provider.dart';

void main() {
  group('RideHailProvider', () {
    late RideHailProvider provider;

    setUp(() {
      provider = RideHailProvider();
    });

    test('initial state is correct', () {
      expect(provider.userLatitude, isNull);
      expect(provider.userLongitude, isNull);
      expect(provider.destination, isNull);
      expect(provider.isSearchingForRide, isFalse);
      expect(provider.isRideActive, isFalse);
      expect(provider.selectedVehicleType, 'Economy');
      expect(provider.selectedVehicleSize, 'Small');
    });

    test('setUserLocation updates coordinates', () {
      provider.setUserLocation(32.1, -117.2);
      expect(provider.userLatitude, 32.1);
      expect(provider.userLongitude, -117.2);
    });

    test('setDestination updates destination and coordinates', () {
      provider.setDestination('Test Place', 1.1, 2.2);
      expect(provider.destination, 'Test Place');
      expect(provider.destinationLatitude, 1.1);
      expect(provider.destinationLongitude, 2.2);
    });

    test('setVehicleType and setVehicleSize update values', () {
      provider.setVehicleType('Luxury');
      provider.setVehicleSize('Large');
      expect(provider.selectedVehicleType, 'Luxury');
      expect(provider.selectedVehicleSize, 'Large');
    });

    test('bookRide sets destination, price, duration, and searching', () {
      provider.setVehicleSize('Medium');
      provider.bookRide();
      expect(provider.destination, 'WMATA Metro Station');
      expect(provider.destinationLatitude, 38.8977);
      expect(provider.destinationLongitude, -77.0365);
      expect(provider.estimatedPrice, 50.00);
      expect(provider.estimatedDuration, 5);
      expect(provider.isSearchingForRide, isTrue);
    });

    test('clearRideData resets relevant fields', () {
      provider.setDestination('Test', 1, 2);
      provider.setEstimatedPrice(99.0);
      provider.setEstimatedDuration(10);
      provider.startSearchingForRide();
      provider.clearRideData();
      expect(provider.destination, isNull);
      expect(provider.destinationLatitude, isNull);
      expect(provider.destinationLongitude, isNull);
      expect(provider.estimatedPrice, isNull);
      expect(provider.estimatedDuration, isNull);
      expect(provider.isSearchingForRide, isFalse);
    });
  });
} 