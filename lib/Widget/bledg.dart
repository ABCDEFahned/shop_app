import 'package:flutter/material.dart';

class soltan extends StatelessWidget {
  const soltan({
    super.key,
    required this.child,
    required this.value,
    this.color,
  });
  final Widget child;
  final String value;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return
        // Expanded(
        Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: color != null ? color : Theme.of(context).primaryColor),
          constraints: BoxConstraints(minWidth: 16, minHeight: 5),
          child: Text(
            value,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10),
          ),
        )
      ],
    );

    // )
    //   ],
    // ),
    //);
  }
}
