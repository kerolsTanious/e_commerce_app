import 'package:e_commerce_app_route/core/api_keys.dart';
import 'package:e_commerce_app_route/core/di.dart';
import 'package:e_commerce_app_route/core/utils/prefs.dart';
import 'package:e_commerce_app_route/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefsHelper.initPrefs();
  setupServiceLocator();
  Stripe.publishableKey = ApiKeys.publishableKey;
  runApp(const MyApp());
}
