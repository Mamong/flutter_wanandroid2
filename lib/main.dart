import 'dart:async';
import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:monitoring/monitoring.dart';

import 'app.dart';
import 'core/services/injection_container.dart';

void main() async {
  // Has to be late so it doesn't instantiate before the
  // `initializeMonitoringPackage()` call.
  late ErrorReportingService errorReportingService;

  runZonedGuarded<Future<void>>(
        () async {
      WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
      FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
      await initializeMonitoringPackage();
      errorReportingService = ErrorReportingService();
// debugPaintSizeEnabled = true;
      //final remoteValueService = RemoteValueService();
      //await remoteValueService.load();

      FlutterError.onError = errorReportingService.recordFlutterError;
      // * Handle errors from the underlying platform/OS
      PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
        debugPrint(error.toString());
        return true;
      };

      Isolate.current.addErrorListener(
        RawReceivePort((pair) async {
          final List<dynamic> errorAndStacktrace = pair;
          await errorReportingService.recordError(
            errorAndStacktrace.first,
            errorAndStacktrace.last,
          );
        }).sendPort,
      );

      // Hive-specific initialization
      await Hive.initFlutter();
      await init();
      runApp(
        const ProviderScope(
          child:MyApp(),
        ),
      );
      FlutterNativeSplash.remove();
    },
      (error, stack){
          print("$error: $stack");
      }
    //     (error, stack) => errorReportingService.recordError(
    //   error,
    //   stack,
    //   fatal: true,
    // ),
  );
}
