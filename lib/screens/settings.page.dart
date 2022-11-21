import 'package:flutter/material.dart';
import 'package:myapp/enums/colors.enums.dart';
import 'package:myapp/enums/settings.enum.dart';
import 'package:myapp/utils/svg.utils.dart';
import 'package:myapp/widgets/button.widget.dart';
import 'package:myapp/widgets/switcher.widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Map<Settings, dynamic> settings = {
    Settings.ShowInterruption: true,
    Settings.SlowlyAnimations: true,
    Settings.ShowNotifications: true,
  };

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: BackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: renderArrowLeftIcon(color: PrimaryColor),
          ),
        ),
        title: Text(
          "CHANGE A PROGRAM",
          style: TextStyle(fontSize: 32, height: 1.333),
        ),
        centerTitle: true,
      ),
      // TODO вывести это в Hight Order Widget
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            width: double.infinity,
            height: double.infinity,
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("SHOW INTERRUPTION",
                        style: Theme.of(context).textTheme.bodyText2),
                    Switcher(
                      value: settings[Settings.ShowInterruption],
                      onToggle: (value) {
                        setState(() {
                          settings[Settings.ShowInterruption] = value;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("SLOWLY ANIMATION SPEED"),
                    Switcher(
                      value: settings[Settings.SlowlyAnimations],
                      onToggle: (value) {
                        setState(() {
                          settings[Settings.SlowlyAnimations] = value;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("SHOW NOTIFICATIONS"),
                    Switcher(
                      value: settings[Settings.ShowNotifications],
                      onToggle: (value) {
                        setState(() {
                          settings[Settings.ShowNotifications] = value;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            child: Container(
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Button(
                      text: "RESET SETTINGS", width: size.width - 20, cb: () {})
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
