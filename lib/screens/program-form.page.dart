import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/enums/colors.enums.dart';
import 'package:myapp/models/controls.model.dart';
import 'package:myapp/models/program.model.dart';
import 'package:myapp/repositories/program.repository.dart';
import 'package:myapp/utils/svg.utils.dart';
import 'package:myapp/widgets/number-picker.widget.dart';
import 'package:myapp/widgets/time-field.widget.dart';

const duration = Duration(milliseconds: 300);

enum Mode { CREATE, EDIT }

class ProgramFormPage extends StatefulWidget {
  ProgramFormPage({Key? key, required this.mode, this.program})
      : super(key: key);
  final Mode mode;
  final Program? program;
  final programRepository = ProgramRepository();

  @override
  State<ProgramFormPage> createState() => ProgramFormPageState();
}

class ProgramFormPageState extends State<ProgramFormPage> {
  int interval = 0;
  int times = 0;
  @override
  void initState() {
    setState(() {
      interval =
          widget.program?.interval != null ? widget.program!.interval : 0;
      times = widget.program?.times != null ? widget.program!.times : 0;
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final List<TimeFieldOptionModel> cooldownOptions = [
    TimeFieldOptionModel(name: "30s", seconds: 30, suffixText: "s"),
    TimeFieldOptionModel(name: "1m", seconds: 60, suffixText: "m"),
    TimeFieldOptionModel(name: "2m", seconds: 120, suffixText: "m"),
  ];

  void onChangeTimes(int value) {
    print(value);
  }

  void onChangeInterval(int seconds) {
    print(seconds);
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
                // здесь нужно переделать на dropdown или textfield
                TimeField(
                  label: "INTERVAL",
                  options: cooldownOptions,
                  onChange: onChangeInterval,
                  initialValue: widget.program?.interval,
                ),
                SizedBox(
                  width: 24,
                ),
                NumberPicker(
                  label: "TIMES'",
                  onChange: onChangeTimes,
                  minValue: 5,
                  maxValue: 1000,
                  step: 5,
                  initialValue: widget.program?.times,
                )
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
                      "REPEATS",
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
        elevation: 0,
        backgroundColor: SecondaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Icon(Icons.send),
      ),
    );
  }
}
