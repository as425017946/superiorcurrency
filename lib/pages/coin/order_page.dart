import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:superiorcurrency/pages/coin/order_widget.dart';

import '../../colors/my_colors.dart';
import '../../config/config_screen_util.dart';
import '../../config/my_config.dart';
import '../../utils/style_utils.dart';
import '../../utils/widget_utils.dart';
///订单页面
class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {

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
    return Scaffold(
      resizeToAvoidBottomInset: false, // 解决键盘顶起页面
      backgroundColor: MyColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            WidgetUtils.commonSizedBox(10, double.infinity),
            OrderWidget.getTitleWidget(context),
            WidgetUtils.commonSizedBox(10, double.infinity),
            //横线
            WidgetUtils.myLine(color: MyColors.loginHX, thickness: 0.5),
            WidgetUtils.commonSizedBox(10, 0),
            Row(
              children: [
                WidgetUtils.commonSizedBox(0, 20),
                GestureDetector(
                  onTap: (() {

                  }),
                  child: Text('全部',style: StyleUtils.getCommonTextStyle(
                      color: MyColors.ziYellow,
                      fontFamily: MyConfig.mMedium,
                      fontSize: ConfigScreenUtil.autoSize30),),
                ),
                WidgetUtils.commonSizedBox(0, 20),
                GestureDetector(
                  onTap: (() {

                  }),
                  child: Text('挂单中',style: StyleUtils.getCommonTextStyle(
                      color: MyColors.g8,
                      fontFamily: MyConfig.mMedium,
                      fontSize: ConfigScreenUtil.autoSize30),),
                )
                ,
                WidgetUtils.commonSizedBox(0, 20),
                GestureDetector(
                  onTap: (() {

                  }),
                  child: Text('已售罄',style: StyleUtils.getCommonTextStyle(
                      color: MyColors.g8,
                      fontFamily: MyConfig.mMedium,
                      fontSize: ConfigScreenUtil.autoSize30),),
                )
                ,
                WidgetUtils.commonSizedBox(0, 20),
                GestureDetector(
                  onTap: (() {

                  }),
                  child: Text('已下架',style: StyleUtils.getCommonTextStyle(
                      color: MyColors.g8,
                      fontFamily: MyConfig.mMedium,
                      fontSize: ConfigScreenUtil.autoSize30),),
                )
                ,
              ],
            ),
            WidgetUtils.commonSizedBox(10, 0),
            //横线
            WidgetUtils.myLine(color: MyColors.g8, thickness: 0.5,indent: 20,endIndent: 20),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20),
              child: Column(
                children: [
                  WidgetUtils.commonSizedBox(20, 0),
                  Row(
                    children: [
                      Expanded(child: Text('出售USDT',style: StyleUtils.getCommonTextStyle(
                          color: MyColors.g8,
                          fontFamily: MyConfig.mMedium,
                          fontSize: ConfigScreenUtil.autoSize30),)),
                      Text('已下架→',style: StyleUtils.getCommonTextStyle(
                          color: MyColors.g8,
                          fontFamily: MyConfig.mMedium,
                          fontSize: ConfigScreenUtil.autoSize30),)
                    ],
                  ),
                  WidgetUtils.commonSizedBox(10, 0),
                  Row(
                    children: [
                      Expanded(child: Text('时间',style: StyleUtils.getCommonTextStyle(
                          color: MyColors.g8,
                          fontFamily: MyConfig.mMedium,
                          fontSize: ConfigScreenUtil.autoSize28),)),
                      Text('已成交/挂单数量',style: StyleUtils.getCommonTextStyle(
                          color: MyColors.g8,
                          fontFamily: MyConfig.mMedium,
                          fontSize: ConfigScreenUtil.autoSize28),)
                    ],
                  ),
                  WidgetUtils.commonSizedBox(5, 0),
                  Row(
                    children: [
                      Expanded(child: Text('2023-02-15',style: StyleUtils.getCommonTextStyle(
                          color: MyColors.g8,
                          fontFamily: MyConfig.mMedium,
                          fontSize: ConfigScreenUtil.autoSize28),)),
                      Text('1.000000/10.000000',style: StyleUtils.getCommonTextStyle(
                          color: MyColors.g8,
                          fontFamily: MyConfig.mMedium,
                          fontSize: ConfigScreenUtil.autoSize28),)
                    ],
                  ),
                  //横线
                  WidgetUtils.myLine(color: MyColors.g8, thickness: 0.5),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
