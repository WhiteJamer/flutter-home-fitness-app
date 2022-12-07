import 'package:flutter/material.dart';
import 'package:myapp/enums/colors.enums.dart';
import 'package:myapp/models/controls.model.dart';

const List<TimeFieldOptionModel> defaultOptions = [];

class TimeField extends StatelessWidget {
  const TimeField(
      {Key? key,
      this.label,
      this.options = defaultOptions,
      this.disabled = false})
      : super(key: key);

  final String? label;
  final List<TimeFieldOptionModel>? options;
  final bool disabled;

  void onTap(BuildContext context) {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 200,
            color: Colors.black,
            child: Column(
              children: [
                const Text('Select Interval'),
                SizedBox(
                  height: 25,
                ),
                options != null
                    ? Wrap(
                        spacing: 15,
                        children: options!.map((opt) {
                          return ElevatedButton(
                            child: Text(opt.name),
                            onPressed: () => Navigator.pop(context),
                          );
                        }).toList())
                    : SizedBox(),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        label != null && label!.isNotEmpty
            ? Text(
                style: TextStyle(color: WhiteColor, fontSize: 12, height: 1),
                label!,
              )
            : SizedBox(),
        IntrinsicWidth(
          child: GestureDetector(
            onTap: () => onTap(context),
            child: Text(
              "1m",
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
        ),
      ],
    );
  }
}
