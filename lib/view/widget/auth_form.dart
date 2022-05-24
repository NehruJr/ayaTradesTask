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
            textTheme: textTheme,
          ),
          SizedBox(
            height: height * 0.02,
          ),
          CustomTextFormField(
            hintText: 'Password',
            controller: _passwordController,
            validate: (value) {
              Validator().password(value);
            },
            obscureText: true,
            sufIcon:  Image.asset('assets/images/ant-design_eye-invisible-outlined.png'),
            textTheme: textTheme,
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
              height: height * 0.06,
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
    required this.sufIcon, required this.textTheme,
  }) : super(key: key);

  final String hintText;
  final TextEditingController controller;
  final Function validate;
  final bool obscureText;
  final Widget sufIcon;
  final TextTheme textTheme;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        color: kGreyColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle:textTheme.bodyText1?.copyWith(color: const Color(0xff969696)),
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
