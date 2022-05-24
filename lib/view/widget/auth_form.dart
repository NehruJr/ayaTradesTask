import 'package:aya_trades_task/utils/form_validator.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class AuthForm extends StatelessWidget {
  AuthForm({Key? key, required this.isLive}) : super(key: key);

  final bool isLive;

  static final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextTheme textTheme = Theme.of(context).textTheme;

    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFormField(
            hintText: 'Username or Email',
            controller: _emailController,
            validate: (value) {
              Validator().email(value);
            },
            obscureText: false,
            sufIcon: const SizedBox(),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          CustomTextFormField(
            hintText: 'password',
            controller: _passwordController,
            validate: (value) {
              Validator().password(value);
            },
            obscureText: true,
            sufIcon: const Icon(Icons.remove_red_eye_outlined),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          isLive
              ? TextButton(
                  onPressed: () {},
                  child: Text('Forgot your username/password?',
                      style: textTheme.bodyText1))
              : TextButton(
                  onPressed: () {},
                  child: Text('Forgot password?', style: textTheme.bodyText1)),
          SizedBox(
            height: height * 0.03,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: width * 0.3,
              height: height * 0.05,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: const Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ))),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                  child: Text(
                    'Login',
                    style: textTheme.headline3,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.validate,
    required this.obscureText,
    required this.sufIcon,
  }) : super(key: key);

  final String hintText;
  final TextEditingController controller;
  final Function validate;
  final bool obscureText;
  final Widget sufIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kGreyColor,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: sufIcon,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding:
              const EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
        ),
        obscureText: obscureText,
        validator: (value) {
          return validate(value);
        },
        controller: controller,
      ),
    );
  }
}
