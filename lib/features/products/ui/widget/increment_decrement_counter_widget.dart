import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class IncrementDecrementCounterWidget extends StatefulWidget {
  const IncrementDecrementCounterWidget({super.key, required this.onChange});
final Function(int) onChange;
  @override
  State<IncrementDecrementCounterWidget> createState() =>
      _IncrementDecrementCounterWidgetState();
}

class _IncrementDecrementCounterWidgetState
    extends State<IncrementDecrementCounterWidget> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 12,
      children: [
        GestureDetector(
          onTap: () {
            if(count <= 1) return;
            count--;
            widget.onChange(count);
            setState(() {});
          },
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppColors.themeColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.remove, color: Colors.white),
          ),
        ),
        Text(
          "$count",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: () {
            if(count >= 30) return;
            count++;
            widget.onChange(count);
            setState(() {});
          },
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppColors.themeColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.add, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
