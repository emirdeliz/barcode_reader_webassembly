import 'package:web_driver_installer/chrome_driver_installer.dart';

const driverVersion = '108.0.5359.71';

Future<void> main() async {
  ChromeDriverInstaller command =
      ChromeDriverInstaller.withVersion(driverVersion);
  await command.start(alwaysInstall: true);
}
