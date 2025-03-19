import 'package:e_commerce_app_route/core/utils/prefs.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/views/profile_screen/widgets/update_profile_screen_body.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    nameController =
        TextEditingController(text: PrefsHelper.getString(key: PrefsKeys.name));
    phoneController = TextEditingController(
        text: PrefsHelper.getString(key: PrefsKeys.mobileNumber));
    emailController = TextEditingController(
        text: PrefsHelper.getString(key: PrefsKeys.email));
    passwordController = TextEditingController(
        text: PrefsHelper.getString(key: PrefsKeys.password));
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProfileScreenBody(
      formKey: formKey,
      nameController: nameController,
      emailController: emailController,
      passwordController: passwordController,
      phoneController: phoneController,
    );
  }
}
