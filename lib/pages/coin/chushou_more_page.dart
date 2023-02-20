import 'package:flutter/material.dart';
import 'package:superiorcurrency/colors/my_colors.dart';

import '../../config/config_screen_util.dart';
import '../../config/my_config.dart';
import '../../utils/style_utils.dart';
import '../../utils/widget_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


///出售方式
class ChushouMorePage extends StatefulWidget {
  const ChushouMorePage({Key? key}) : super(key: key);

  @override
  State<ChushouMorePage> createState() => _ChushouMorePageState();
}

class _ChushouMorePageState extends State<ChushouMorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            WidgetUtils.commonSizedBox(10, double.infinity),
            WidgetUtils.getTitleWidget('选择出售方式', true, context, false, ''),
            WidgetUtils.commonSizedBox(10, double.infinity),
            //横线
            Container(width: double.infinity,height: 0.5,color: MyColors.loginHX,),
            Container(
              constraints: BoxConstraints(
                  minHeight: ConfigScreenUtil.autoHeight220),
              width: double.infinity,
              color: MyColors.mm_bg,
              padding: EdgeInsets.only(
                  left: ConfigScreenUtil.autoWidth30,
                  right: ConfigScreenUtil.autoWidth30,
                  top: ConfigScreenUtil.autoHeight20),
              child: Column(
                children: [
                  WidgetUtils.onlyText(
                      '出售数量',
                      StyleUtils.getCommonTextStyle(
                          color: MyColors.g8,
                          fontSize: ConfigScreenUtil.autoSize32)),
                  WidgetUtils.commonSizedBox(10, double.infinity),
                  WidgetUtils.onlyText(
                      '16.00000 USDT',
                      StyleUtils.getCommonTextStyle(
                          color: MyColors.ziYellow,
                          fontSize: ConfigScreenUtil.autoSize42)),
                  WidgetUtils.commonSizedBox(6, double.infinity),
                  //横线
                  WidgetUtils.myLine(color: MyColors.loginHX, thickness: 0.5),
                  WidgetUtils.commonSizedBox(10, double.infinity),
                  WidgetUtils.onlyText(
                      '收款方式',
                      StyleUtils.getCommonTextStyle(
                          color: MyColors.g8,
                          fontSize: ConfigScreenUtil.autoSize32)),
                  WidgetUtils.commonSizedBox(10, double.infinity),
                  Row(
                    children: [
                      WidgetUtils.showImages(
                          'assets/images/cs_yh.png',
                          ConfigScreenUtil.autoHeight40,
                          ConfigScreenUtil.autoHeight40),
                      WidgetUtils.commonSizedBox(0, 5),
                      WidgetUtils.onlyText(
                          '银行卡号（1234567890）',
                          StyleUtils.getCommonTextStyle(
                              color: MyColors.ziYellow,
                              fontSize: ConfigScreenUtil.autoSize32)),
                    ],
                  ),
                  WidgetUtils.commonSizedBox(6, double.infinity),
                  //横线
                  WidgetUtils.myLine(color: MyColors.loginHX, thickness: 0.5),
                  WidgetUtils.commonSizedBox(10, double.infinity),
                  WidgetUtils.onlyText(
                      '原价挂单出售',
                      StyleUtils.getCommonTextStyle(
                          color: MyColors.g8,
                          fontSize: ConfigScreenUtil.autoSize32)),
                  WidgetUtils.commonSizedBox(10, double.infinity),
                  Row(
                    children: [
                      Expanded(
                          child: WidgetUtils.onlyText(
                              '当前参考价',
                              StyleUtils.getCommonTextStyle(
                                  color: MyColors.g8,
                                  fontSize: ConfigScreenUtil.autoSize32))),
                      WidgetUtils.onlyText(
                          '¥6.97/USDT',
                          StyleUtils.getCommonTextStyle(
                              color: MyColors.ziYellow,
                              fontSize: ConfigScreenUtil.autoSize30))
                    ],
                  ),
                  WidgetUtils.commonSizedBox(10, double.infinity),
                  Row(
                    children: [
                      Expanded(
                          child: WidgetUtils.onlyText(
                              '预计获得',
                              StyleUtils.getCommonTextStyle(
                                  color: MyColors.g8,
                                  fontSize: ConfigScreenUtil.autoSize32))),
                      WidgetUtils.onlyText(
                          '¥696.00',
                          StyleUtils.getCommonTextStyle(
                              color: MyColors.ziYellow,
                              fontSize: ConfigScreenUtil.autoSize30))
                    ],
                  ),
                  WidgetUtils.commonSizedBox(10, double.infinity),
                  WidgetUtils.onlyText(
                      '挂单是将您的出售信息发布到平台，当其他用户有相应购买需求时即可完成交易。本平台交易量巨大，通常不会花费您太多时间',
                      StyleUtils.getCommonTextStyle(
                          color: MyColors.g8,
                          fontSize: ConfigScreenUtil.autoSize32)),
                  WidgetUtils.commonSizedBox(20, double.infinity),
                  //发布挂单出售
                  GestureDetector(
                    onTap: (() {
                      // if (MyUtils.checkClick() && sum == 2) {
                      //   Navigator.pushNamed(context, 'ChushouMorePage');
                      // }
                      Navigator.pushNamed(context, 'ChushouMorePage');
                    }),
                    child: Container(
                      height: ScreenUtil().setHeight(96),
                      width: double.infinity,
                      alignment: Alignment.center,
                      //边框设置
                      decoration: const BoxDecoration(
                        //背景
                        color: MyColors.ziYellow,
                        //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                        borderRadius:
                        BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Text(
                        '发布挂单出售',
                        style: StyleUtils.getCommonTextStyle(
                            color: MyColors.loginZiBlack,
                            fontSize: ConfigScreenUtil.autoSize30,
                            fontFamily: MyConfig.mMedium),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
