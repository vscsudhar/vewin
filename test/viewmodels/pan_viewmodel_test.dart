import 'package:flutter_test/flutter_test.dart';
import 'package:vewin/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('PanViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
