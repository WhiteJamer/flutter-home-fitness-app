import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapp/enums/colors.enums.dart';
import 'package:myapp/screens/stepshow.page.dart';
import 'package:myapp/utils/svg.utils.dart';
import 'package:myapp/widgets/button.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late Animation<double> _leftDBellPositionAnimation;
  late Animation<double> _rightDBellPositionAnimation;
  late AnimationController _positionAnimController;

  @override
  void initState() {
    super.initState();
    _positionAnimController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1750));
    _leftDBellPositionAnimation = Tween(begin: 5.5, end: 4.0).animate(
        CurvedAnimation(
            parent: _positionAnimController, curve: Curves.easeInOut));
    _rightDBellPositionAnimation = Tween(begin: 4.0, end: 5.5).animate(
        CurvedAnimation(
            parent: _positionAnimController, curve: Curves.easeInOut));
    _positionAnimController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _positionAnimController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void _startAFitness() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => StepShowPage(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: BackgroundColor,
      body: AnimatedBuilder(
        animation: _positionAnimController,
        builder: (context, child) => Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height / 5.5,
              left: MediaQuery.of(context).size.width / 5,
              child: renderLogo(),
            ),
            Positioned(
                top: MediaQuery.of(context).size.height /
                    _leftDBellPositionAnimation.value,
                left: MediaQuery.of(context).size.width / 5 - 15,
                child: Transform.rotate(
                  angle: pi / 5,
                  child: SvgPicture.asset("assets/dumbbell.svg"),
                )),
            Positioned(
                top: MediaQuery.of(context).size.height /
                    _rightDBellPositionAnimation.value,
                right: MediaQuery.of(context).size.width / 5 - 15,
                child: Transform.rotate(
                  angle: -pi / 5,
                  child: SvgPicture.asset("assets/dumbbell.svg"),
                )),
            Positioned(
              top: 55, // TODO Do Adaptive position for devices
              right: 14,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Button(
                    icon: renderNotificationIcon(),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Button(
                    icon: renderSettingsIcon(),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Button(text: "START A FITNESS", cb: _startAFitness),
                SizedBox(
                  height: 30,
                ),
                Button(text: "CHANGE PROGRAM", cb: _startAFitness),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
