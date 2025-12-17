import 'dart:developer' show log;
import 'dart:math' show pi;

import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  final Widget child;
  final Widget drawer;
  const MyDrawer({super.key, required this.child, required this.drawer});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> with TickerProviderStateMixin {
  late AnimationController xChildAnimCtl;
  late Animation<double> xChildAnim;

  late AnimationController xDrawerAnimCtl;
  late Animation<double> xDrawerAnim;

  @override
  void initState() {
    super.initState();
    xChildAnimCtl = AnimationController(
      vsync: this,
      duration: Duration(seconds: 500),
    );
    xChildAnim = Tween<double>(begin: 0, end: -pi / 2).animate(xChildAnimCtl);

    xDrawerAnimCtl = AnimationController(
      vsync: this,
      duration: Duration(seconds: 500),
    );

    xDrawerAnim = Tween<double>(
      begin: pi / 2.7,
      end: 0,
    ).animate(xDrawerAnimCtl);
  }

  @override
  void dispose() {
    xChildAnimCtl.dispose();
    xDrawerAnimCtl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double maxDrag = screenWidth * 0.85;

    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        xChildAnimCtl.value += details.delta.dx / maxDrag;
        xDrawerAnimCtl.value += details.delta.dx / maxDrag;
      },
      onHorizontalDragEnd: (details) {
        log(xChildAnimCtl.value.toString());
        if (xChildAnimCtl.value < 0.5) {
          xChildAnimCtl.reverse();
          xDrawerAnimCtl.reverse();
        } else {
          xChildAnimCtl.forward();
          xDrawerAnimCtl.forward();
        }
      },
      child: AnimatedBuilder(
        animation: Listenable.merge([xChildAnimCtl, xDrawerAnimCtl]),
        builder: (context, child) {
          return Stack(
            children: [
              Container(color: Color(0xFF1a1b26)),
              Transform(
                alignment: Alignment.centerLeft,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..translateByDouble(
                    xChildAnimCtl.value * maxDrag,
                    0.0,
                    0.0,
                    1.0,
                  )
                  ..rotateY(xChildAnim.value),
                child: widget.child,
              ),
              Transform(
                alignment: Alignment.centerRight,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..translateByDouble(
                    -screenWidth + xDrawerAnimCtl.value * maxDrag,
                    0.0,
                    0.0,
                    1.0,
                  )
                  ..rotateY(xDrawerAnim.value),
                child: widget.drawer,
              ),
            ],
          );
        },
      ),
    );
  }
}
