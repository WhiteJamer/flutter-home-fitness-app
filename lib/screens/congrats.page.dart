import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/enums/colors.enums.dart';
import 'package:myapp/screens/stepshow.page.dart';

class CongratsPage extends StatefulWidget {
  const CongratsPage({Key? key}) : super(key: key);

  @override
  State<CongratsPage> createState() => _CongratsPageState();
}

class _CongratsPageState extends State<CongratsPage>
    with TickerProviderStateMixin {
  late AnimationController _textAnimController;
  late Animation<Offset> _slideToTopAnimation;
  int variant = 0;

  @override
  void initState() {
    super.initState();

    _textAnimController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _slideToTopAnimation = Tween<Offset>(
      begin: Offset(0.0, 0.8),
      end: Offset(0.0, 1),
    ).animate(CurvedAnimation(
      parent: _textAnimController,
      curve: Curves.easeInOutCirc,
    ));
    _textAnimController.repeat(
      reverse: true,
    );
    Timer(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => StepShowPage(),
        ),
      );
    });
    final random = Random();

    setState(() {
      variant = random.nextInt(3);
    });
  }

  @override
  void dispose() {
    _textAnimController.dispose();
    super.dispose();
  }

  AnimatedBuilder _renderTitle() {
    AnimatedBuilder _renderText(String text) {
      return AnimatedBuilder(
          animation: _textAnimController,
          builder: (context, child) {
            return SlideTransition(
              position: _slideToTopAnimation,
              child: Text(
                text,
                style: Theme.of(context).textTheme.headline1,
              ),
            );
          });
    }

    switch (variant) {
      case 0:
        return _renderText("GREAT!");
      case 1:
        return _renderText("GOOD JOB!");
      case 2:
        return _renderText("AWESOME!");
      default:
        return _renderText("AWESOME!");
    }
  }

  Container _renderCheckMark() {
    Container _renderLottie(String path) {
      return Container(
          height: 350,
          width: double.infinity,
          clipBehavior: Clip.none,
          constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width,
              maxHeight: MediaQuery.of(context).size.height / 2),
          child: Center(
              child: Lottie.asset(path,
                  frameRate: FrameRate(120),
                  repeat: false,
                  fit: BoxFit.cover)));
    }

    print(variant);
    switch (variant) {
      case 0:
        return _renderLottie("assets/lottie/checkmark.json");
      case 1:
        return _renderLottie("assets/lottie/like.json");
      case 2:
        return _renderLottie("assets/lottie/5stars.json");
      default:
        return _renderLottie("assets/lottie/checkmark.json");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: BackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _renderTitle(),
            SizedBox(
              height: 60,
            ),
            _renderCheckMark(),
          ],
        ),
      ),
    );
  }
}
