import 'package:api_explorer/app.dart';
import 'package:api_explorer/controllers/settings_controller.dart';
import 'package:api_explorer/services/settings_service.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  await Hive.initFlutter().then(
    (value) async {
      await Hive.openBox('settings');
      await Hive.openBox('user');
    },
  );
  final settingsController = SettingsController(
    SettingsService(),
  );
  settingsController.loadSettings();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MyApp(
      settingsController: settingsController,
    ),
  );

  doWhenWindowReady(() {
    const initialSize = Size(1280, 720);
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}
