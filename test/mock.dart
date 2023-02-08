import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';

class FakeRoute extends Fake implements Route {
  static void setUp() => registerFallbackValue(FakeRoute());
}

class MockNavigatorObserver extends Mock implements NavigatorObserver {
  static void setUp() {
    registerFallbackValue(FakeRoute());
  }
}
