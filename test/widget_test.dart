import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_ride_hail_challenge/main.dart';

void main() {
  testWidgets('Ride hailing app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Hi, Michael'), findsOneWidget);
    expect(find.text('Where would you like to go?'), findsOneWidget);
    expect(find.text('Ride'), findsOneWidget);
    expect(find.text('Community Events'), findsOneWidget);
  });
}
