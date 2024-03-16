import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReadMoreText extends StatefulWidget {
  final String text;
  final int trimLines;

  ReadMoreText({required this.text, required this.trimLines});

  @override
  _ReadMoreTextState createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          maxLines: isExpanded ? widget.trimLines : 2,
          overflow: TextOverflow.ellipsis,
          style: textTheme.titleMedium,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: InkWell(
            child: Text(
              !isExpanded ? 'Read more' : 'Readless',
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
          ),
        ),
      ],
    );
  }
}
