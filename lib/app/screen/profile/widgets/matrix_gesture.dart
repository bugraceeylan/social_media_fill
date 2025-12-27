
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:matrix_gesture_detector/matrix_gesture_detector.dart';

typedef PointMoveCallBack = void Function(Offset offset);

class MatrixGesture extends StatefulWidget {
  const MatrixGesture({
    super.key,
    required this.onDragStart,
    required this.onDragEnd,
    required this.child,
    required this.onDragUpdate,
  });

  final VoidCallback onDragStart;
  final PointMoveCallBack onDragEnd;
  final Widget child;
  final PointMoveCallBack onDragUpdate;

  @override
  _MatrixGestureState createState() => _MatrixGestureState();
}

class _MatrixGestureState extends State<MatrixGesture> {
  final ValueNotifier<Matrix4> matrixNotifier =
      ValueNotifier(Matrix4.identity());
  late Offset offset;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerMove: (event) {
        offset = event.position;
        widget.onDragUpdate(offset);
      },
      child: MatrixGestureDetector(
        onMatrixUpdate: (m, tm, sm, rm) {
          matrixNotifier.value = m;
        },
        onScaleStart: () {
          widget.onDragStart();
        },
        onScaleEnd: () {
          widget.onDragEnd(offset);
        },
        child: AnimatedBuilder(
          animation: matrixNotifier,
          builder: (context, child) {
            return Transform(
              transform: matrixNotifier.value,
              child: FittedBox(
                fit: BoxFit.contain,
                child: widget.child,
              ),
            );
          },
        ),
      ),
    );
  }
}
