import 'package:flutter/material.dart';
import 'package:myapp/enums/colors.enums.dart';
import 'package:numberpicker/numberpicker.dart' as numberpicker;

class NumberPicker extends StatefulWidget {
  final int? initialValue;
  final String? label;
  final void Function(int) onChange;
  final int minValue;
  final int maxValue;
  final int step;
  const NumberPicker(
      {Key? key,
      this.initialValue,
      this.label,
      required this.onChange,
      this.minValue = 1,
      this.maxValue = 1000,
      this.step = 0})
      : super(key: key);

  @override
  State<NumberPicker> createState() => _NumberPickerState();
}

class _NumberPickerState extends State<NumberPicker> {
  int _currentValue = 5;

  @override
  void initState() {
    setState(() {
      _currentValue =
          widget.initialValue != null ? widget.initialValue! : widget.minValue;
    });
    super.initState();
  }

  void onTap(BuildContext context) {
    showModalBottomSheet<void>(
        useRootNavigator: true,
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            void _onChange(int value) {
              setState(() => {_currentValue = value});
              widget.onChange(_currentValue);

            }

            void _onCloseBottomSheet() {
              _onChange(_currentValue);
              Navigator.pop(context);
            }

            return Container(
              height: MediaQuery.of(context).size.height / 2,
              color: Colors.black,
              child: Column(
                children: [
                  Text('Number of repeat $_currentValue'),
                  SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                      onPressed: _onCloseBottomSheet,
                      child: Text('Apply')),
                  numberpicker.NumberPicker(
                    value: _currentValue,
                    itemCount: 5,
                    minValue: widget.minValue,
                    maxValue: widget.maxValue,
                    step: widget.step,
                    onChanged: _onChange,
                  ),
                ],
              ),
            );
          });
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
