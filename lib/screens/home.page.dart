import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapp/enums/colors.enums.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 55, // TODO Do Adaptive position for devices
            right: 14,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  splashRadius: 24,
                  onPressed: () {},
                  iconSize: 24,
                  icon: SvgPicture.asset(
                    "assets/icons/notification.svg",
                  ),
                ),
                IconButton(
                  splashRadius: 24,
                  onPressed: () {},
                  iconSize: 24,
                  icon: SvgPicture.asset(
                    "assets/icons/settings.svg",
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 14, left: 14, right: 14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SvgLogo
                SvgPicture.asset(
                  "assets/logo.svg",
                  height: 150,
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("START A FITNESS"),
                      SvgPicture.asset(
                        "assets/icons/arrow-right.svg",
                        color: PrimaryColor,
                        height: 22,
                      ),
                      // Arrow Right Icon SVG
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("CHANGE A PROGRAM"),
                      SvgPicture.asset(
                        "assets/icons/pencil.svg",
                        color: PrimaryColor,
                        height: 22,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
