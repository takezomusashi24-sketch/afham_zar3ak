import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const AfhamZar3akApp());
}

class AfhamZar3akApp extends StatelessWidget {
  const AfhamZar3akApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'افهم زرعك',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2E7D32),
          primary: const Color(0xFF2E7D32),
          secondary: const Color(0xFF66BB6A),
          surface: const Color(0xFFF1F8E9),
        ),
        useMaterial3: true,
        fontFamily: 'Cairo',
      ),
      home: const HomeScreen(),
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
    );
  }
}
