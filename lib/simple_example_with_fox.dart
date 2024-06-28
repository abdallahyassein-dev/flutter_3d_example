import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';
import 'dart:developer';

class SimpleExampleWithFox extends StatefulWidget {
  const SimpleExampleWithFox({
    super.key,
  });

  @override
  State<SimpleExampleWithFox> createState() => _SimpleExampleWithFoxState();
}

class _SimpleExampleWithFoxState extends State<SimpleExampleWithFox> {
  O3DController controller = O3DController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("3D Object Example"),
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      // ),
      body: Center(
        child: Stack(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: O3D.asset(
                src: 'assets/Wraith_Animated.glb',
                controller: controller,
                backgroundColor: Colors.grey[850]!, //Colors.green[100]!,
                autoRotate: true,
                disableZoom: false,
              ),
            ),
            Positioned(
              bottom: 10,
              child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  IconButton(
                      onPressed: () => controller.cameraOrbit(20, 10, 1.5),
                      icon: const Icon(
                        Icons.camera_indoor_rounded,
                        size: 50,
                      )),
                  IconButton(
                      onPressed: () => controller.cameraTarget(0, 10, 3),
                      icon: const Icon(
                        Icons.change_circle_outlined,
                        size: 50,
                      )),
                  IconButton(
                      onPressed: () {
                        controller.animationName = "Run";
                        controller.play();
                      },
                      icon: const Icon(
                        Icons.run_circle,
                        size: 50,
                      )),
                  IconButton(
                      onPressed: () {
                        controller.animationName = "Walk";
                        controller.play();
                      },
                      icon: const Icon(
                        Icons.directions_walk_outlined,
                        size: 50,
                      )),
                  IconButton(
                      onPressed: () {
                        controller.animationName = "Survey";
                        controller.play();
                      },
                      icon: const Icon(
                        Icons.animation_outlined,
                        size: 50,
                      )),
                  IconButton(
                      onPressed: () {
                        controller
                            .availableAnimations()
                            .then((value) => log(value.toString()));
                        controller.play();
                      },
                      icon: const Icon(
                        Icons.print,
                        size: 50,
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
