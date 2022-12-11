import 'package:flutter/material.dart';
import 'package:myapp/enums/colors.enums.dart';

class Button extends StatefulWidget {
  const Button({Key? key, void Function, this.text, this.icon, this.cb, this.width, this.disabled = false})
      : super(key: key);
  final String? text;
  final Widget? icon;
  final double? width;
  final bool disabled;
  final void Function()? cb;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool isPressed = false;

  @override
  void initState() {
    setState(() {
      isPressed = false;
    });
    super.initState();
  }

  void _onTapUp([dynamic data]) {
    setState(() {
      isPressed = true;
    });
  }

  void _onTapCancel([dynamic data]) {
    setState(() {
      isPressed = false;
    });
  }

  Widget _renderText() {
    return widget.text != null ? Text(widget.text!) : Container();
  }

  Widget _renderIcon() {
    return widget.icon != null ? widget.icon! : Container();
  }

  @override
  Widget build(BuildContext context) {
    
    final double height = widget.text == null && widget.icon != null ? 50 : 100;
    return GestureDetector(
      onTap: widget.cb,
      onTapDown: _onTapUp,
      onTapCancel: _onTapCancel,
      onTapUp: _onTapCancel,
      child: SizedBox(
        height: height + (height * 0.1),
        child: Column(
          mainAxisAlignment:
              !isPressed ? MainAxisAlignment.start : MainAxisAlignment.end,
          children: [
            Container(
              height: height,
              width: widget.width,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: widget.disabled == false ? SecondaryColor : BackgroundColor,
                boxShadow: !isPressed
                    ? [
                        BoxShadow(
                          color: widget.disabled == false ?  PrimaryButtonBorderColor : BackgroundColor,
                          spreadRadius: 0.5,
                          // offset to act as bottom border color
                          offset: Offset(0, (height * 0.1)),
                        ),
                      ]
                    : [],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _renderText(),
                  _renderIcon(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
