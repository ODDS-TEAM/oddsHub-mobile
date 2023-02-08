import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';

import 'mock_route.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {
  static void setUp() {
    registerFallbackValue(MockRoute());
  }
}
