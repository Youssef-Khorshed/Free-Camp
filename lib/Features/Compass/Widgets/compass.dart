import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Logic/observer.dart';
import '../Logic/provider.dart';

class CompassPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    final compass = ref.watch(compass_cubit);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      compass.startListening();
    });

    WidgetsBinding.instance.addObserver(CompassLifecycleObserver(compass));

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Compass'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/cadrant.png',
                fit: BoxFit.fill,
              ),
            ),
            Center(
              child: AnimatedBuilder(
                animation: compass,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: (compass.heading ?? 0.0) * -1.0,
                    child: Image.asset(
                      'assets/compass.png',
                      width: 200.0,
                      height: 200.0,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
