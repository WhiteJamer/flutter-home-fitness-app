import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myapp/enums/colors.enums.dart';

class AnimatedStepper extends StatefulWidget {
  const AnimatedStepper({Key? key}) : super(key: key);

  @override
  State<AnimatedStepper> createState() => _AnimatedStepperState();
}

class _AnimatedStepperState extends State<AnimatedStepper>
    with TickerProviderStateMixin {
  late AnimationController _twinkAnimController;

  late AnimationController _slideAnimController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _twinkAnimController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _slideAnimController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0.0, -1.0),
      end: Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _slideAnimController,
      curve: Curves.easeOut,
    ));

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _slideAnimController,
      curve: Curves.easeOut,
    ));

    Timer(
      Duration(milliseconds: 300),
      () => _slideAnimController.forward().whenComplete(() {
        _twinkAnimController.forward();
        _twinkAnimController.repeat(reverse: true);
      }),
    );
    _twinkAnimController.forward();
  }

  @override
  void dispose() {
    _twinkAnimController.dispose();
    _slideAnimController.dispose();
    super.dispose();
  }

  Stack _renderElipse() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 22,
          width: 22,
          decoration: BoxDecoration(
            color: SecondaryColor,
            borderRadius: BorderRadius.all(Radius.elliptical(50, 50)),
          ),
        ),
        Container(
          height: 38,
          width: 38,
          decoration: BoxDecoration(
            border: Border.all(color: SecondaryColor, width: 3.0),
            borderRadius: BorderRadius.all(Radius.elliptical(50, 50)),
          ),
        ),
      ],
    );
  }

  Stack _renderTwinkElipse() {
    return Stack(
      alignment: Alignment.center,
      children: [
        FadeTransition(
          opacity: _twinkAnimController,
          child: Container(
            height: 22,
            width: 22,
            decoration: BoxDecoration(
              color: SecondaryColor,
              borderRadius: BorderRadius.all(Radius.elliptical(50, 50)),
            ),
          ),
        ),
        Container(
          height: 38,
          width: 38,
          decoration: BoxDecoration(
            border: Border.all(color: SecondaryColor, width: 3.0),
            borderRadius: BorderRadius.all(Radius.elliptical(50, 50)),
          ),
        ),
      ],
    );
  }

  Container _renderTail() {
    return Container(
      height: 6,
      width: 15,
      color: SecondaryColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _opacityAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: _opacityAnimation.value,
          child: SlideTransition(
            position: _slideAnimation,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _renderElipse(),
                _renderTail(),
                _renderElipse(),
                _renderTail(),
                _renderElipse(),
                _renderTail(),
                _renderElipse(),
                _renderTail(),
                _renderTwinkElipse(),
              ],
            ),
          ),
        );
      },
    );
  }
}
