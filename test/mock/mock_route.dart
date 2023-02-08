import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';

class MockRoute extends Fake implements Route {
  static void setUp() => registerFallbackValue(MockRoute());
}
