import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';


main() {
  group('Reversed app test', () {
    late FlutterDriver driver;
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });
    tearDownAll(() {
      if (driver != null) driver.close();
    });
    var textField = find.byType('TextField');
    var button = find.text('Reverse');
    var reverse = find.text('olleH');
    test('reversed the String', () async {
      await driver.tap(textField);
      Future.delayed(const Duration(seconds: 2));
      await driver.enterText('Hello');
      Future.delayed(const Duration(seconds: 2));
      await driver.waitForAbsent(reverse);
      await driver.tap(button);
      Future.delayed(const Duration(seconds: 2));
      await driver.waitFor(reverse);
      await driver.waitUntilNoTransientCallbacks();
      assert(reverse != null);
    });
  });
}
