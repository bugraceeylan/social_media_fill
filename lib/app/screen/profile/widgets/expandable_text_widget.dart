import 'package:fill_store_bb/app/constant/color.dart';
import 'package:fill_store_bb/app/constant/textStyle.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String fullText;
  final int maxTextLength;

  const ExpandableTextWidget({
    super.key,
    required this.fullText,
    this.maxTextLength = 20,
  });

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: RichText(
        text: TextSpan(
          style: Tstyle.subStyle(
            textSize: 15,
            fontW: FontWeight.w600,
          ),
          children: [
            TextSpan(
              text: isExpanded
                  ? widget.fullText
                  : widget.fullText.length > widget.maxTextLength
                      ? "${widget.fullText.substring(0, widget.maxTextLength)}..."
                      : widget.fullText,
            ),
            if (widget.fullText.length > widget.maxTextLength)
              TextSpan(
                text: isExpanded ? " daha az" : " daha fazla",
                style: const TextStyle(color: cTextGrey),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
              ),
          ],
        ),
      ),
    );
  }
}
