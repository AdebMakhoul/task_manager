import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatefulWidget {
  final String title;
  final Function onClick;
  final Color buttonColor;
  final Color fontColor;
  final double? width;

  CustomButton({super.key,
    required this.title,
    required this.onClick,
    required this.buttonColor,
    required this.fontColor,
    this.width,
  });

  @override
  _CoustomButtonState createState() => _CoustomButtonState();
}

class _CoustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        width: widget.width,
        height: 0.06 * 1.sw,
        child: TextButton(
            style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all<Color>(widget.buttonColor),
                backgroundColor:
                    MaterialStateProperty.all<Color>(widget.buttonColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                        side: BorderSide(color: widget.buttonColor)))),
            onPressed: () {
              widget.onClick();
            },
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                widget.title.toUpperCase(),
                style: TextStyle(
                    color: widget.fontColor, fontWeight: FontWeight.bold),
                maxLines: 1,
              ),
            )),
      ),
    );
  }
}
