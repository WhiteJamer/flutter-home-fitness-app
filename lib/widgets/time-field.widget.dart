import 'package:flutter/material.dart';
import 'package:myapp/enums/colors.enums.dart';
import 'package:myapp/models/controls.model.dart';

const List<TimeFieldOptionModel> defaultOptions = [];

class TimeField extends StatefulWidget {
  const TimeField(
      {Key? key,
      this.initialValue,
      this.label,
      this.options = defaultOptions,
      this.disabled = false,
      required this.onChange})
      : super(key: key);

  final int? initialValue;
  final String? label;
  final List<TimeFieldOptionModel>? options;
  final bool disabled;
  final void Function(int seconds) onChange;

  @override
  State<TimeField> createState() => _TimeFieldState();
}

class _TimeFieldState extends State<TimeField> {
  int _currentValue = 0;

  @override
  void initState() {
    setState(() {
      _currentValue = widget.initialValue ?? 0;
    });
    super.initState();
  }

  void _onChange(int value) {
    widget.onChange(value);
    setState(() {
      _currentValue = value;
    });
    Navigator.pop(context);
  }

  void onTap(BuildContext context) {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                height: 200,
                color: Colors.black,
                child: Column(
                  children: [
                    const Text('Select Interval'),
                    SizedBox(
                      height: 25,
                    ),
                    widget.options != null
                        ? Wrap(
                            spacing: 15,
                            children: widget.options!.map((opt) {
                              return ElevatedButton(
                                child: Text(opt.name),
                                onPressed: () => _onChange(opt.seconds),
                              );
                            }).toList())
                        : SizedBox(),
                  ],
                ),
              );
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.label != null && widget.label!.isNotEmpty
            ? Text(
                style: TextStyle(color: WhiteColor, fontSize: 12, height: 1),
                widget.label!,
              )
            : SizedBox(),
        IntrinsicWidth(
          child: GestureDetector(
            onTap: () => onTap(context),
            child: Text(
              _currentValue.toString(),
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
        ),
      ],
    );
  }
}
