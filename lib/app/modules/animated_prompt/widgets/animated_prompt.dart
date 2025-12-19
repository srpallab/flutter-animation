import 'package:flutter/material.dart';

class AnimatedPrompt extends StatefulWidget {
  final String title;
  final String subTitle;
  final Widget child;
  const AnimatedPrompt({
    super.key,
    required this.title,
    required this.subTitle,
    required this.child,
  });

  @override
  State<AnimatedPrompt> createState() => _AnimatedPromptState();
}

class _AnimatedPromptState extends State<AnimatedPrompt>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _iconScaleAnimation;
  late Animation<double> _containerScaleAnimation;
  late Animation<Offset> _yDisplacementAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _iconScaleAnimation = Tween<double>(
      begin: 10,
      end: 5,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _yDisplacementAnimation = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(0, -0.23),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _containerScaleAnimation = Tween<double>(
      begin: 2.0,
      end: 0.4,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller
      ..reset()
      ..forward();
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(51),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 100,
            minHeight: 100,
            maxWidth: MediaQuery.of(context).size.width * 0.8,
            maxHeight: MediaQuery.of(context).size.height * 0.8,
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: .center,
                  mainAxisSize: .min,
                  children: [
                    SizedBox(height: 160),
                    Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      widget.subTitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned.fill(
                child: SlideTransition(
                  position: _yDisplacementAnimation,
                  child: ScaleTransition(
                    scale: _containerScaleAnimation,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                      child: ScaleTransition(
                        scale: _iconScaleAnimation,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: widget.child,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
