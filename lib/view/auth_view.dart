import 'package:flutter/material.dart';

import '../utils/colors.dart';
import 'widget/widgets.dart';

class AuthView extends StatefulWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  var isLive = true;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    TextTheme textTheme = Theme.of(context).textTheme;

    const animationDuration = Duration(milliseconds: 500);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Logo(height: height),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isLive = !isLive;
                  });
                },
                child: AnimatedToggleButton(
                    animationDuration: animationDuration, isEnabled: isLive),
              ),
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
                      style: textTheme.headline2?.copyWith(color: kBlackColor),
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
    );
  }
}
