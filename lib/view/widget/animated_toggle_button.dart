import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class AnimatedToggleButton extends StatelessWidget {
  const AnimatedToggleButton({
    Key? key,
    required this.animationDuration,
    required this.isEnabled,
  }) : super(key: key);

  final Duration animationDuration;
  final bool isEnabled;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      height: height * 0.06,
      width: width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: kGreyColor,
        border: Border.all(color: Colors.white, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
      ),
      child: AnimatedAlign(
        duration: animationDuration,
        alignment: isEnabled ? Alignment.centerLeft : Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              BuildToggleChoiceContainer(
                width: width,
                height: height,
                isEnabled: isEnabled,
                textTheme: textTheme,
                choiceText: 'Live',
              ),
              BuildToggleChoiceContainer(
                width: width,
                height: height,
                isEnabled: !isEnabled,
                textTheme: textTheme,
                choiceText: 'Paper Trading',
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BuildToggleChoiceContainer extends StatelessWidget {
  const BuildToggleChoiceContainer({
    Key? key,
    required this.width,
    required this.height,
    required this.isEnabled,
    required this.textTheme,
    required this.choiceText,
  }) : super(key: key);

  final double width;
  final double height;
  final bool isEnabled;
  final TextTheme textTheme;
  final String choiceText;

  @override
  Widget build(BuildContext context) {
    const animationDuration = Duration(milliseconds: 500);

    return AnimatedContainer(
      duration: animationDuration,
      curve: Curves.linear,
      width: width * 0.4,
      height: height * 0.05,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: isEnabled ? kDarkGreenColor : kGreyColor),
      child: Center(
          child: Text(
        choiceText,
        style: textTheme.headline2
            ?.copyWith(color: isEnabled ? Colors.white : kDarkGreenColor),
      )),
    );
  }
}
