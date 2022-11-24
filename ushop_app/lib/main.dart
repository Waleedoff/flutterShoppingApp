import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ushop_app/logic/controller/theme_controller.dart';
import 'package:ushop_app/routes/routes.dart';
import 'package:ushop_app/utils/my_string.dart';
import 'package:ushop_app/utils/theme.dart';
import 'package:ushop_app/view/screens/welcome_screen.dart';

import 'languages/localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Asroo Shop',
      debugShowCheckedModeBanner: false,
      locale: Locale(ene),
      translations: LocaliztionApp(),
      fallbackLocale: Locale(ene),
      theme: ThemesApp.light,
      darkTheme: ThemesApp.dark,
      themeMode: ThemeController().themeDataGet,
      home: const WelcomeScreen(),
      initialRoute: FirebaseAuth.instance.currentUser != null ||
              GetStorage().read<bool>('auth') == true
          ? AppRoutes.welcome
          : AppRoutes.mainScreen,
      getPages: AppRoutes.routes,
    );
  }
}
