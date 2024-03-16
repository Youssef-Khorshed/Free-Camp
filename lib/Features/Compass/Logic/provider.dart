import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sensors/sensors.dart';

final compass_cubit = ChangeNotifierProvider<Compass>((ref) => Compass());

class Compass extends ChangeNotifier {
  double _heading = 0.0;
  StreamSubscription? _compassSubscription;

  double get heading => _heading;

  void startListening() {
    _compassSubscription = gyroscopeEvents.listen((event) {
      _heading = event.z;
      notifyListeners();
    });
  }

  void stopListening() {
    _compassSubscription?.cancel();
    gyroscopeEvents.drain();
    notifyListeners();
  }
}
