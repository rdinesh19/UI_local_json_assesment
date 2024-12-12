import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled55/constats/color.dart';

import 'my_app.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'Navigation/navigation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase SDK

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor:Color(0xFFB3E5FC),
    statusBarBrightness:Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    statusBarColor:ColorRes.white,  ));
  runApp(ProviderScope(
    child: ModularApp(
    
        module: Navigation(),
        child: const MyApp()),
  ),
  );
}
