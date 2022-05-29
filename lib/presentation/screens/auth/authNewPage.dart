import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import '../../../core/components/components.dart';
import '../../../core/themes/app_colors.dart';
import '../../router/app_router.dart';
import 'widgets/bds_date_picker.dart';

class AuthNewPage extends StatefulWidget {
  const AuthNewPage({Key? key}) : super(key: key);

  @override
  State<AuthNewPage> createState() => _AuthAuthNewState();
}

class _AuthAuthNewState extends State<AuthNewPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  next() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(
        context,
        AppRouter.authBloodType,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.lightElv0,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: AppColors.lightElv0,
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            physics: const BouncingScrollPhysics(),
            children: [
              vSpacer(2),
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    size: 22.sp,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              vSpacer(2),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textP("Create Account", 22, bold: true),
                  ],
                ),
              ),
              vSpacer(2),
              Card(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2.w),
                          ),
                          prefixIcon: const Icon(
                            Icons.person_rounded,
                          ),
                          hintText: 'Ex: Martin Garrix',
                          labelText: 'Name',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Name is empty!';
                          }
                          return null;
                        },
                      ),
                      vSpacer(2),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2.w),
                          ),
                          prefixIcon: const Icon(
                            Icons.location_pin,
                          ),
                          hintText: 'Ex: 346 Zappia Drive, Lexington, Kentucky',
                          labelText: 'Address',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Address is empty!';
                          }
                          return null;
                        },
                      ),
                      vSpacer(2),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2.w),
                          ),
                          prefixIcon: const Icon(
                            Icons.email_rounded,
                          ),
                          hintText: 'Ex: martingarrix@bds.com',
                          labelText: 'Email',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email is empty!';
                          }
                          if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                            return 'Invalid Email address!';
                          }
                          return null;
                        },
                      ),
                      vSpacer(2),
                      BdsDatePicker(
                        onDateSelected: (dateTime) => print(dateTime),
                      ),
                      vSpacer(2),
                      TextFormField(
                        controller: passwordController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2.w),
                          ),
                          prefixIcon: const Icon(
                            Icons.password_rounded,
                          ),
                          hintText: '* * * * * *',
                          labelText: 'Password',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password is empty!';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters!';
                          }
                          return null;
                        },
                      ),
                      vSpacer(2),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2.w),
                          ),
                          prefixIcon: const Icon(
                            Icons.password_rounded,
                          ),
                          hintText: '* * * * * *',
                          labelText: 'Confirm password',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Confirm password is empty!';
                          }
                          if (passwordController.text != value) {
                            return 'Passwords does not match!';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              vSpacer(3),
              Center(
                child: buttonFilledP(
                  "Next",
                  () => next(),
                ),
              ),
              vSpacer(3)
            ],
          ),
        ),
      ),
    );
  }
}
