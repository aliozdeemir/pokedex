import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  Constants._();
  static const String title = "Pokedex";
  static const String imagePath = "images/pokeball.png";
  static TextStyle getTitleTextStyle() {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return TextStyle(
        fontSize: _calculateTextSize(48),
        color: Colors.white,
        fontWeight: FontWeight.bold,
      );
    } else {
      return TextStyle(
        fontSize: _calculateTextSize(40),
        color: Colors.white,
        fontWeight: FontWeight.bold,
      );
    }
  }

  static TextStyle getPokeTextStyle() {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return TextStyle(
        fontSize: _calculateTextSize(18),
        color: Colors.white,
        fontWeight: FontWeight.bold,
      );
    } else {
      return TextStyle(
        fontSize: _calculateTextSize(14),
        color: Colors.white,
        fontWeight: FontWeight.bold,
      );
    }
  }

  static TextStyle getChipTextStyle() {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return TextStyle(
        fontSize: _calculateTextSize(16),
        color: Colors.white,
      );
    } else {
      return TextStyle(
        fontSize: _calculateTextSize(8),
        color: Colors.white,
      );
    }
  }

  static double _calculateTextSize(int size) {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return size.sp;
    } else {
      return size.sp;
    }
  }

  static TextStyle? getPokeInfoTextStyle() {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return TextStyle(
        fontSize: _calculateTextSize(16),
        color: Colors.black,
      );
    } else {
      return TextStyle(
        fontSize: _calculateTextSize(8),
        color: Colors.black,
      );
    }
  }

  static TextStyle? getPokeInfoLabelTextStyle() {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return TextStyle(
        fontSize: _calculateTextSize(20),
        color: Colors.black,
        fontWeight: FontWeight.bold,
      );
    } else {
      return TextStyle(
        fontSize: _calculateTextSize(10),
        color: Colors.black,
        fontWeight: FontWeight.bold,
      );
    }
  }
}
