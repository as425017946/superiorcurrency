import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:superiorcurrency/colors/my_colors.dart';
// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:superiorcurrency/pages/navigator/tabnavigator.dart';

import 'routes/routes.dart';

//定义一个全局的存储对象
late SharedPreferences sp;
void main() {
  //状态栏色跟页面背景色一致
  if(Platform.isAndroid){
    SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(statusBarColor: MyColors.bg);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  //强制竖屏
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(const MyApp());
}

MaterialColor myYellow = const MaterialColor(
  0xFFE8D2A7,
  <int, Color>{
    50: Color(0xFFE8D2A7),
    100: Color(0xFFE8D2A7),
    200: Color(0xFFE8D2A7),
    300: Color(0xFFE8D2A7),
    400: Color(0xFFE8D2A7),
    500: Color(0xFFE8D2A7),
    600: Color(0xFFE8D2A7),
    700: Color(0xFFE8D2A7),
    800: Color(0xFFE8D2A7),
    900: Color(0xFFE8D2A7),
  },
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '优币付',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: myYellow,
      ),
      home: const Tab_Navigator(),
      builder: EasyLoading.init(),
      //配置路由  -- map格式
      routes: staticRoutes,
    );
  }
}
