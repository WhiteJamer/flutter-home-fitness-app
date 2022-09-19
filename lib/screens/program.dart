import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/enums/colors.enums.dart';
import 'package:myapp/screens/stepshow.page.dart';
import 'package:myapp/utils/svg.utils.dart';
import 'package:myapp/widgets/button.widget.dart';

class ProgramPage extends StatefulWidget {
  const ProgramPage({Key? key}) : super(key: key);

  @override
  State<ProgramPage> createState() => ProgramPageState();
}

class ProgramPageState extends State<ProgramPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _renderProgramItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: SecondaryColor, width: 3),
            color: BackgroundColor,
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LottieBuilder.asset(
                      "assets/lottie/pullups.json",
                      height: 80,
                    ),
                    Text("PULL UPS",
                        style: Theme.of(context).textTheme.bodyText2),
                  ],
                ),
                SizedBox(
                  width: 12,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "5",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          ?.copyWith(color: PrimaryColor),
                    ),
                    Text("30S", style: Theme.of(context).textTheme.bodyText2),
                  ],
                ),
              ]),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BackgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: renderArrowLeftIcon(color: PrimaryColor),
          ),
          title: Text(
            "CHANGE A PROGRAM",
            style: TextStyle(fontSize: 32, height: 1.333),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 16,
              ),
              _renderProgramItem(),
              SizedBox(
                height: 12,
              ),
              _renderProgramItem(),
              SizedBox(
                height: 12,
              ),
              _renderProgramItem(),
              SizedBox(
                height: 12,
              ),
              _renderProgramItem(),
              SizedBox(
                height: 12,
              ),
              _renderProgramItem(),
            ],
          ),
        ));
  }
}
