import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/enums/colors.enums.dart';
import 'package:myapp/screens/congrats.page.dart';
import 'package:myapp/utils/svg.utils.dart';
import 'package:myapp/widgets/button.widget.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({Key? key}) : super(key: key);

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage>
    with TickerProviderStateMixin {
  late AnimationController _separatorAnimController;
  late AnimationController _countOpacityAnimationController;
  late Animation _separatorAnimation;

  late AnimationController _textAnimController;
  late Animation<Offset> _slideToTopAnimation;
  late Animation<Offset> _slideToBottomAnimation;
  late Animation<double> _opacityAnimation;

  late Animation<double> _countOpacityAnimation;

  @override
  void initState() {
    super.initState();
    _separatorAnimController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _separatorAnimation = Tween(begin: 0.0, end: 80.0).animate(CurvedAnimation(
        parent: _separatorAnimController, curve: Curves.easeIn));

    _textAnimController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));
    _slideToTopAnimation = Tween<Offset>(
      begin: Offset(0.0, 1.0),
      end: Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _textAnimController,
      curve: Curves.easeOut,
    ));
    _slideToBottomAnimation = Tween<Offset>(
      begin: Offset(0.0, -1.0),
      end: Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _textAnimController,
      curve: Curves.easeOut,
    ));
    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _textAnimController,
      curve: Curves.easeOut,
    ));

    _countOpacityAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );
    _countOpacityAnimation = Tween<double>(
      begin: 1.0,
      end: 1.05,
    ).animate(CurvedAnimation(
      parent: _countOpacityAnimationController,
      curve: Curves.easeInOut,
    ));

    _separatorAnimController.forward();
    Timer(
        Duration(milliseconds: 300),
        () => _textAnimController.forward().whenComplete(
            () => _countOpacityAnimationController.repeat(reverse: true)));
  }

  @override
  void dispose() {
    _separatorAnimController.dispose();
    _textAnimController.dispose();
    _countOpacityAnimationController.dispose();
    super.dispose();
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

  void _routeToCongratsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CongratsPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: BackgroundColor,
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 120,
                ),
                AnimatedBuilder(
                    animation: _slideToTopAnimation,
                    builder: (context, child) {
                      return Opacity(
                        opacity: _opacityAnimation.value,
                        child: SlideTransition(
                          position: _slideToTopAnimation,
                          child: Text(
                            "PUSH UPS",
                            // style: Theme.of(context).textTheme.titleMedium,
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ),
                      );
                    }),
                _renderSeparator(),
                AnimatedBuilder(
                    animation: _slideToTopAnimation,
                    builder: (context, child) {
                      return Opacity(
                        opacity: _opacityAnimation.value,
                        child: SlideTransition(
                          position: _slideToBottomAnimation,
                          child: ScaleTransition(
                            scale: _countOpacityAnimation,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "15",
                                  style: TextStyle(
                                      color: SecondaryColor,
                                      fontSize: Theme.of(context)
                                          .textTheme
                                          .headline1
                                          ?.fontSize),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  "TIMES",
                                  style: Theme.of(context).textTheme.headline1,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                Lottie.asset("assets/lottie/pushups.json",
                    frameRate: FrameRate(120)),
              ],
            ),
            Positioned(
              bottom: 35,
              left: MediaQuery.of(context).size.width / 2 - 27,
              child: Button(
                icon: renderArrowRightIcon(),
                cb: _routeToCongratsPage,
              ),
            ),
            Positioned(
              bottom: 8,
              left: MediaQuery.of(context).size.width / 2 - 45,
              child: Text(
                "TAP IF YOU COMPLETED",
                style: TextStyle(fontSize: 12),
              ),
            )
          ],
        ),
      ),
    );
  }
}
