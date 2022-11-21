import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:myapp/enums/colors.enums.dart';

class Switcher extends StatelessWidget {
  final bool value;
  final void Function(bool) onToggle;
  const Switcher({Key? key, required this.onToggle, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      width: 80.0,
      height: 45.0,
      activeColor: Colors.transparent,
      inactiveColor: Colors.transparent,
      switchBorder: Border(
        top: BorderSide(color: WhiteColor, width: 3),
        left: BorderSide(color: WhiteColor, width: 3),
        bottom: BorderSide(color: WhiteColor, width: 3),
        right: BorderSide(color: WhiteColor, width: 3),
      ),
      activeToggleColor: PrimaryColor,
      inactiveToggleColor: WhiteColor,
      toggleSize: 40.0,
      value: value,
      borderRadius: 50.0,
      padding: 2.5,
      onToggle: onToggle,
    );
  }
}
