import 'package:flutter/material.dart';
import 'package:untitled55/constats/color.dart';

Widget backgroundWidget(BuildContext context) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [ColorRes.white, ColorRes.veryLightBlue, ColorRes.lightBlueB3],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Image.asset("assets/image/bg_image.webp"));
}
