import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 资产
class MeansPage extends StatefulWidget {
  const MeansPage({Key? key}) : super(key: key);

  @override
  State<MeansPage> createState() => _MeansPageState();
}

class _MeansPageState extends State<MeansPage> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Color(0xFF232323), //状态栏背景颜色
        statusBarIconBrightness: Brightness.dark // dark:一般显示黑色   light：一般显示白色
    ));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
