import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class AnimatedToggleButton extends StatefulWidget {
  const AnimatedToggleButton({Key? key}) : super(key: key);

  @override
  _AnimatedToggleButtonState createState() => _AnimatedToggleButtonState();
}

const double liveAlign = -1;
const double paperAlign = 1;
const Color selectedColor = Colors.white;
const Color normalColor = kGreenColor;

class _AnimatedToggleButtonState extends State<AnimatedToggleButton> {
  late double xAlign;
  late Color liveColor;
  late Color paperColor;

  @override
  void initState() {
    super.initState();
    xAlign = liveAlign;
    liveColor = selectedColor;
    paperColor = normalColor;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextTheme textTheme = Theme.of(context).textTheme;

    return Center(
      child: Container(
        height: height * 0.07,
        width: width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: kLightGreyColor,
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Stack(
          children: [
            AnimatedAlign(
              alignment: Alignment(xAlign, 0),
              duration: const Duration(milliseconds: 400),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 6.0,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Container(
                    width: width * 0.4,
                    decoration: const BoxDecoration(
                      color: kGreenColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  xAlign = liveAlign;
                  liveColor = selectedColor;
                  paperColor = normalColor;
                });
              },
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: width * 0.4,
                  color: Colors.transparent,
                  alignment: Alignment.center,
                  child: Text(
                    'Live',
                    style: textTheme.headline2!.copyWith(color: liveColor),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  xAlign = paperAlign;
                  paperColor = selectedColor;

                  liveColor = normalColor;
                });
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: width * 0.4,
                  color: Colors.transparent,
                  alignment: Alignment.center,
                  child: Text(
                    'Paper Trading',
                    style: textTheme.headline2!.copyWith(color: paperColor),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
