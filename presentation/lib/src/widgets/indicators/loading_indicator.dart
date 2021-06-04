import 'dart:math';

import 'package:flutter/material.dart';

class LoadingIndicator extends StatefulWidget {
  const LoadingIndicator({
    Key? key,
    this.circlesCount = 3,
    this.circlesSpacing = 8.0,
  }) : super(key: key);

  final int circlesCount;
  final double circlesSpacing;

  @override
  _LoadingIndicatorState createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();

    // TODO: se puede hacer mas personalizable

    _controller = AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animations = List.generate(
      widget.circlesCount,
      (i) => _controller.drive(_DelayTween(begin: 0.5, delay: i * 0.3)),
    );
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        _animations.length,
        (i) => _Circle(animation: _animations[i]),
      ),
    );
  }
}

class _Circle extends StatelessWidget {
  const _Circle({Key? key, required this.animation}) : super(key: key);

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
      builder: (_, child) => Opacity(opacity: animation.value, child: child),
    );
  }
}

class _DelayTween extends Tween<double> {
  _DelayTween({double begin = 0.0, double end = 1.0, required this.delay})
      : super(begin: begin, end: end);

  final double delay;

  @override
  double lerp(double t) => super.lerp((sin((t - delay) * 2 * pi) + 1) / 2);

  @override
  double evaluate(Animation<double> animation) => lerp(animation.value);
}
