import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapp/enums/colors.enums.dart';

SvgPicture renderLogo([double height = 150]) {
  return SvgPicture.asset(
    "assets/logo.svg",
    height: height,
  );
}

SvgPicture renderNotificationIcon(
    [Color color = WhiteColor, double width = 50]) {
  return SvgPicture.asset(
    "assets/icons/notification.svg",
    color: color,
    width: width,
  );
}

SvgPicture renderSettingsIcon([Color color = WhiteColor, double width = 50]) {
  return SvgPicture.asset(
    "assets/icons/settings.svg",
    color: color,
    width: width,
  );
}

SvgPicture renderArrowRightIcon({Color color = WhiteColor, double width = 50}) {
  return SvgPicture.asset(
    "assets/icons/arrow-right.svg",
    color: color,
    width: width,
  );
}

RotatedBox renderArrowLeftIcon({Color color = WhiteColor, double width = 50}) {
  return RotatedBox(
    quarterTurns: 90,
    child: SvgPicture.asset(
      "assets/icons/arrow-right.svg",
      color: color,
      width: width,
      height: width,
    ),
  );
}
