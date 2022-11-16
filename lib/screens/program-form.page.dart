import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/enums/colors.enums.dart';
import 'package:myapp/models/program.model.dart';
import 'package:myapp/utils/svg.utils.dart';

const duration = Duration(milliseconds: 300);

enum Mode { CREATE, EDIT }

class ProgramFormPage extends StatefulWidget {
  const ProgramFormPage({Key? key, required this.mode, this.program})
      : super(key: key);
  final Mode mode;
  final Program? program;

  @override
  State<ProgramFormPage> createState() => ProgramFormPageState();
}

class ProgramFormPageState extends State<ProgramFormPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: SecondaryColor,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: renderArrowLeftIcon(color: WhiteColor),
          ),
        ),
        title: Text(
          "PUSH UPS",
          style: TextStyle(fontSize: 32, height: 1.333),
        ),
        centerTitle: true,
      ),
      // TODO вывести это в компонент
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  child: LottieBuilder.asset(
                    "assets/lottie/pushups.json",
                    height: 240,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_circle_right_sharp,
                    ),
                    color: PrimaryColor,
                    iconSize: 44,
                    splashRadius: 22,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      style:
                          TextStyle(color: WhiteColor, fontSize: 12, height: 1),
                      "TIMES",
                    ),
                    Text(
                      "15",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
                ),
                SizedBox(
                  width: 24,
                ),
                Column(
                  children: [
                    Text(
                      style:
                          TextStyle(color: WhiteColor, fontSize: 12, height: 1),
                      "COOLDOWN",
                    ),
                    Text(
                      "30s",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      style:
                          TextStyle(color: WhiteColor, fontSize: 12, height: 1),
                      "REPETITIONS",
                    ),
                    Text(
                      "5",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.send),
        elevation: 0,
        backgroundColor: SecondaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
