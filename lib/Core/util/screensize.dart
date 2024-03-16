import 'package:flutter/cupertino.dart';

double screen_height({required BuildContext context}) =>
    MediaQuery.of(context).size.height;
double screen_width({required BuildContext context}) =>
    MediaQuery.of(context).size.width;
