import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import '../../../core/components/components.dart';
import '../../../core/constants/strings.dart';
import '../../../core/themes/app_colors.dart';
import '../../../core/themes/app_text_styles.dart';
import '../../router/app_router.dart';

class AuthNicPage extends StatefulWidget {
  const AuthNicPage({Key? key}) : super(key: key);

  @override
  State<AuthNicPage> createState() => _AuthNicPageState();
}

class _AuthNicPageState extends State<AuthNicPage> {
  TextEditingController nicController = TextEditingController();
  String? get validationErrors {
    if (nicController.text.isEmpty) {
      return 'Please enter your NIC Number!';
    }
    if (!RegExp(r'^(?:19|20)?\d{2}[0-9]{10}|[0-9]{9}[x|X|v|V]$')
        .hasMatch(nicController.text)) {
      return 'Invalid NIC Number!';
    }
    return null;
  }

  next() {
    if (validationErrors != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: $validationErrors")));
    } else {
      Navigator.pushNamed(context, AppRouter.authNewPage);
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
            children: [
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: Text(
                  Strings.appTitle,
                  style: AppTextStyles.h1Light,
                ),
              ),
              Image.asset(
                Strings.landingImg,
                fit: BoxFit.fitHeight,
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: inputText(nicController, label: "NIC"),
              ),
              SizedBox(
                height: 3.h,
              ),
              Center(
                child: buttonFilledP(
                  "Next",
                  () => next(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
