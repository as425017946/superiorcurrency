import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:superiorcurrency/colors/my_colors.dart';
import 'package:superiorcurrency/config/config_screen_util.dart';
import 'package:superiorcurrency/utils/event_utils.dart';
import 'package:superiorcurrency/utils/style_utils.dart';
import 'package:superiorcurrency/utils/widget_utils.dart';

import 'address_page.dart';
///地址簿
class AddAddressPage extends StatefulWidget {
  const AddAddressPage({Key? key}) : super(key: key);

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  var eListen;
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Color(0xFF232323), //状态栏背景颜色
        statusBarIconBrightness: Brightness.dark // dark:一般显示黑色   light：一般显示白色
    ));
    // TODO: implement initState
    super.initState();
    eListen = eventBus.on<HeadBack>().listen((event) {
      if(event.index == 2){
        //跳转到添加地址页面
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddressPage(type: 2),
        ));
      }
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    eListen.cancel();
  }
  //是否有添加过的地址
  bool isHave = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bg,
      body: SafeArea(
        child: isHave ? SingleChildScrollView(
          child: Column(
            children: [
              WidgetUtils.commonSizedBox(10, double.infinity),
              WidgetUtils.getTitleWidget('地址簿', true, context, true, '添加'),
              WidgetUtils.commonSizedBox(10, double.infinity),
              //横线
              WidgetUtils.myLine(color: MyColors.loginHX, thickness: 0.5),

            ],
          ),
        ) : Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: Column(
            children: [
              WidgetUtils.commonSizedBox(10, double.infinity),
              WidgetUtils.getTitleWidget('地址簿', true, context, true, '添加'),
              WidgetUtils.commonSizedBox(10, double.infinity),
              //横线
              WidgetUtils.myLine(color: MyColors.loginHX, thickness: 0.5),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      WidgetUtils.showImages('assets/images/m_add_no.png', ConfigScreenUtil.autoHeight50, ConfigScreenUtil.autoHeight50),
                      WidgetUtils.commonSizedBox(20, double.infinity),
                      Text('暂无常用地址',style: StyleUtils.getCommonTextStyle(color: MyColors.g9, fontSize: ConfigScreenUtil.autoSize24),),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
