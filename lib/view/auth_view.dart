import 'package:flutter/material.dart';

import '../utils/colors.dart';
import 'widget/widgets.dart';

class AuthView extends StatefulWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  State<AuthView> createState() => _AuthViewState();
}

const double liveAlign = -1;
const double paperAlign = 1;
const Color selectedColor = Colors.white;
const Color normalColor = kGreenColor;

class _AuthViewState extends State<AuthView> {
  var isLive = true;
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

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Logo(height: height),
                _buildToggleButton(height, width, textTheme),
                SizedBox(
                  height: height * 0.04,
                ),
                isLive
                    ? Text(
                        'Ready to start trading with real money?',
                        style: textTheme.headline2,
                      )
                    : Text(
                        'Practise with paper trading',
                        style:
                            textTheme.headline2?.copyWith(color: kBlackColor),
                      ),
                SizedBox(
                  height: height * 0.04,
                ),
                Text(
                  'Log in',
                  style: textTheme.headline1,
                ),
                Row(
                  children: [
                    Text(
                      'Don’t have an account? ',
                      style: textTheme.bodyText1?.copyWith(color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('Sign Up.', style: textTheme.bodyText1),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                AuthForm(isLive: isLive),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _buildToggleButton(
      double height, double width, TextTheme textTheme) {
    return Container(
      height: height * 0.07,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: kLightGreyColor,
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            alignment: Alignment(xAlign, 0),
            duration: const Duration(milliseconds: 400),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
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
          GestureDetector(
            onTap: () {
              setState(() {
                isLive = true;
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
                isLive = false;
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
    );
  }
}
