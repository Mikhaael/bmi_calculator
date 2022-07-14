import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:bmi_calculator/screens/result_page.dart';

bottomButton({required VoidCallback onTap, required String buttonTitle}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomContainerColor,
        margin: const EdgeInsets.only(top: 20.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Center(
          child: Text(
            buttonTitle,
            style: kLabelTextStyle.copyWith(
                fontWeight: FontWeight.bold, fontSize: 25.0),
          ),
        ),
      ),
    );
