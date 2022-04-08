import 'package:blood_donation_system_user/presentation/screens/auth/widgets/auth_button.dart';
import 'package:blood_donation_system_user/presentation/screens/auth/widgets/bds_date_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import '../../../core/themes/app_colors.dart';
import '../../../core/themes/app_text_styles.dart';
import '../../router/app_router.dart';

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
        statusBarColor: AppColors.primaryColor,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    size: 22.sp,
                    color: AppColors.lightElv0,
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Create Account",
                      style: AppTextStyles.h1Light,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 2.w),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.w),
                    color: AppColors.lightElv0.withOpacity(0.7),
                  ),
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
                          },
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2.w),
                            ),
                            prefixIcon: const Icon(
                              Icons.location_pin,
                            ),
                            hintText:
                                'Ex: 346 Zappia Drive, Lexington, Kentucky',
                            labelText: 'Address',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Address is empty!';
                            }
                          },
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
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
                          },
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        BdsDatePicker(
                          onDateSelected: (dateTime) => print(dateTime),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
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
                          },
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
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
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Center(
                child: AuthButton(
                  text: "Next",
                  onTap: () => next(),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
            ],
          )),
    );
  }
}
