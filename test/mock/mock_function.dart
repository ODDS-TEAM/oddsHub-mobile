import 'package:mocktail/mocktail.dart';

class MockFunction<T> extends Mock {
  void callback();
  void callbackWithArg(T arg);
}
