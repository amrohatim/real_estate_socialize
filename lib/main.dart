import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  runApp(
    const MyApp(),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(400, 850),
      builder: (context, child) => MaterialApp(
        home: Myonboardscreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
