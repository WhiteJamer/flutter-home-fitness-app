import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myapp/enums/colors.enums.dart';
import 'package:myapp/screens/home.page.dart';
import 'package:myapp/widgets/animatedstepper.widget.dart';

class StepShowPage extends StatefulWidget {
  const StepShowPage({Key? key}) : super(key: key);

  @override
  State<StepShowPage> createState() => _StepShowPageState();
}

class _StepShowPageState extends State<StepShowPage>
    with TickerProviderStateMixin {
  late AnimationController _separatorAnimController;
  late AnimationController _titleAnimController;
  late AnimationController _twinkAnimController;
  bool _isRenderStepper = false;

  late Animation _separatorAnimation;
  late Animation<Offset> _titleAnimation;
  late Animation<double> _titleOpacityAnimation;

  @override
  void initState() {
    super.initState();
    _twinkAnimController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _separatorAnimController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _titleAnimController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    _separatorAnimation = Tween(begin: 0.0, end: 180.0).animate(CurvedAnimation(
        parent: _separatorAnimController, curve: Curves.easeIn));
    _separatorAnimController.forward();
    Timer(
      Duration(milliseconds: 300),
      () => _titleAnimController.forward().whenComplete(() {
        Timer(
          Duration(seconds: 2),
          () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          ),
        );
      }),
    );

    _titleAnimation = Tween<Offset>(
      begin: Offset(0.0, 1.0),
      end: Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _titleAnimController,
      curve: Curves.easeOut,
    ));
    _titleOpacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _titleAnimController,
      curve: Curves.easeOut,
    ));
  }

  @override
  void dispose() {
    _twinkAnimController.dispose();
    _separatorAnimController.dispose();
    _titleAnimController.dispose();
    super.dispose();
  }

  AnimatedStepper _renderStepper() {
    return AnimatedStepper();
  }

  Padding _renderSeparator() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 22),
      child: AnimatedBuilder(
        animation: _separatorAnimation,
        builder: (context, child) {
          return Container(
            height: 3,
            width: _separatorAnimation.value,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: SecondaryColor,
            ),
          );
        },
      ),
    );
  }

  AnimatedBuilder _renderTitle() {
    return AnimatedBuilder(
      animation: _titleOpacityAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: _titleOpacityAnimation.value,
          child: SlideTransition(
            position: _titleAnimation,
            child: Text(
              "PUSH UPS",
              style: TextStyle(height: 1),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: BackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _renderStepper(),
            _renderSeparator(),
            _renderTitle(),
          ],
        ),
      ),
    );
  }
}
