import 'package:firebase_core/firebase_core.dart';
import 'package:monitoring/src/firebase_options.dart';

// export 'src/dynamic_link_service.dart';
export 'src/analytics_service.dart';
export 'src/error_reporting_service.dart';
export 'src/explicit_crash.dart';
export 'src/remote_value_service.dart';

Future<void> initializeMonitoringPackage() =>
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
