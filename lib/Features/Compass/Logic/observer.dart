import 'package:flutter/cupertino.dart';
import 'package:flutter_application_camp/Features/Compass/Logic/provider.dart';

class CompassLifecycleObserver extends WidgetsBindingObserver {
  final Compass compass;

  CompassLifecycleObserver(this.compass);

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      compass.startListening();
    }
  }
}
