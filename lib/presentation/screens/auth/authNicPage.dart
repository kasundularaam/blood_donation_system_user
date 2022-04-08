import 'package:blood_donation_system_user/core/constants/strings.dart';
import 'package:blood_donation_system_user/presentation/router/app_router.dart';
import 'package:blood_donation_system_user/presentation/screens/auth/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import '../../../core/themes/app_colors.dart';
import '../../../core/themes/app_text_styles.dart';

class AuthNicPage extends StatefulWidget {
  const AuthNicPage({Key? key}) : super(key: key);

  @override
  State<AuthNicPage> createState() => _AuthNicPageState();
}

class _AuthNicPageState extends State<AuthNicPage> {
  final _formKey = GlobalKey<FormState>();
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
        statusBarColor: AppColors.primaryColor,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
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
                Strings.landingPageImg,
                height: 25.h,
                fit: BoxFit.fitHeight,
              ),
              SizedBox(
                height: 20.h,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(2.w),
                child: TextFormField(
                  controller: nicController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.go,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.lightElv0.withOpacity(0.7),
                    border: InputBorder.none,
                    prefixIcon: const Icon(
                      Icons.card_membership_rounded,
                    ),
                    hintText: 'Ex: 192867543V',
                    labelText: 'NIC',
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Center(
                child: AuthButton(
                  onTap: () => next(),
                  text: "Next",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
