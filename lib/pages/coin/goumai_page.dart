import 'package:flutter/material.dart';
import 'package:superiorcurrency/colors/my_colors.dart';
import 'package:superiorcurrency/config/config_screen_util.dart';
import 'package:superiorcurrency/utils/style_utils.dart';
import 'package:superiorcurrency/utils/widget_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/my_config.dart';

///确认购买
class GoumaiPage extends StatefulWidget {
  const GoumaiPage({Key? key}) : super(key: key);

  @override
  State<GoumaiPage> createState() => _GoumaiPageState();
}

class _GoumaiPageState extends State<GoumaiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(child: Text('')),
            Container(
              color: MyColors.mm_bg,
              constraints: BoxConstraints(
                  minHeight: ConfigScreenUtil.autoHeight800),
              width: double.infinity,
              padding: EdgeInsets.only(
                  left: ConfigScreenUtil.autoWidth30,
                  right: ConfigScreenUtil.autoWidth30,
                  top: ConfigScreenUtil.autoHeight20),
              child: Column(
                children: [
                  WidgetUtils.onlyTextCenter(
                      '确认购买',
                      StyleUtils.getCommonTextStyle(
                          color: MyColors.g8,
                          fontSize: ConfigScreenUtil.autoSize32)),
                  WidgetUtils.onlyText(
                      '成交金额',
                      StyleUtils.getCommonTextStyle(
                          color: MyColors.g8,
                          fontSize: ConfigScreenUtil.autoSize30)),
                  WidgetUtils.onlyText(
                      '￥300.00',
                      StyleUtils.getCommonTextStyle(
                          color: MyColors.ziYellow,
                          fontSize: ConfigScreenUtil.autoSize60)),
                  WidgetUtils.commonSizedBox(10, double.infinity),
                  //横线
                  Container(
                    width: double.infinity,
                    height: 0.5,
                    color: MyColors.loginHX,
                  ),
                  WidgetUtils.commonSizedBox(15, double.infinity),
                  WidgetUtils.onlyText(
                      '付款方式',
                      StyleUtils.getCommonTextStyle(
                          color: MyColors.g8,
                          fontSize: ConfigScreenUtil.autoSize30)),
                  WidgetUtils.commonSizedBox(5, double.infinity),
                  Row(
                    children: [
                      WidgetUtils.showImages(
                          'assets/images/cs_yh.png',
                          ConfigScreenUtil.autoHeight40,
                          ConfigScreenUtil.autoHeight40),
                      WidgetUtils.commonSizedBox(0, 5),
                      WidgetUtils.onlyText(
                          '银行卡',
                          StyleUtils.getCommonTextStyle(
                              color: MyColors.ziYellow,
                              fontSize: ConfigScreenUtil.autoSize32)),
                    ],
                  ),
                  WidgetUtils.commonSizedBox(20, double.infinity),
                  WidgetUtils.onlyText(
                      '单价',
                      StyleUtils.getCommonTextStyle(
                          color: MyColors.g8,
                          fontSize: ConfigScreenUtil.autoSize30)),
                  WidgetUtils.commonSizedBox(5, double.infinity),
                  WidgetUtils.onlyText(
                      '￥6.97/USDT',
                      StyleUtils.getCommonTextStyle(
                          color: MyColors.ziYellow,
                          fontSize: ConfigScreenUtil.autoSize30)),
                  WidgetUtils.commonSizedBox(20, double.infinity),
                  WidgetUtils.onlyText(
                      '数量',
                      StyleUtils.getCommonTextStyle(
                          color: MyColors.g8,
                          fontSize: ConfigScreenUtil.autoSize30)),
                  WidgetUtils.commonSizedBox(5, double.infinity),
                  WidgetUtils.onlyText(
                      '43.45121 USDT',
                      StyleUtils.getCommonTextStyle(
                          color: MyColors.ziYellow,
                          fontSize: ConfigScreenUtil.autoSize30)),
                  WidgetUtils.commonSizedBox(30, double.infinity),
                  Container(
                    height: ConfigScreenUtil.autoHeight254,
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(ConfigScreenUtil.autoWidth20),
                    //边框设置
                    decoration: const BoxDecoration(
                        //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        color: MyColors.gm_bg),
                    child: Column(
                      children: [
                        WidgetUtils.onlyText(
                            'T+1安全保护',
                            StyleUtils.getCommonTextStyle(
                                color: MyColors.g8,
                                fontSize: ConfigScreenUtil.autoSize30)),
                        const Expanded(child: Text('')),
                        WidgetUtils.onlyText(
                            '为了保护您的资金安全，优币付将对您买入的资产限制24小时；但不影响购买后立刻去优币付合作平台进行虚拟币充值。',
                            StyleUtils.getCommonTextStyle(
                                color: MyColors.g8,
                                fontSize: ConfigScreenUtil.autoSize28)),
                        const Expanded(child: Text('')),
                        GestureDetector(
                          onTap: (() {
                            Navigator.pushNamed(context, 'GoumaiShuomingPage');
                          }),
                          child: WidgetUtils.onlyText(
                              '查看详情',
                              StyleUtils.getCommonTextStyle(
                                  color: MyColors.themeRed2,
                                  fontSize: ConfigScreenUtil.autoSize28)),
                        ),
                      ],
                    ),
                  ),

                  WidgetUtils.commonSizedBox(20, 0),
                  //取消和确认按钮
                  Row(
                    children: [
                      //取消
                      Expanded(
                        child: GestureDetector(
                          onTap: (() {
                            Navigator.pop(context);
                          }),
                          child: Container(
                            height: ScreenUtil().setHeight(96),
                            width: double.infinity,
                            alignment: Alignment.center,
                            //边框设置
                            decoration: const BoxDecoration(
                              //背景
                              color: MyColors.cancel_bg,
                              //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Text(
                              '取消',
                              style: StyleUtils.getCommonTextStyle(
                                  color: MyColors.loginZiBlack,
                                  fontSize: ConfigScreenUtil.autoSize30,
                                  fontFamily: MyConfig.mMedium),
                            ),
                          ),
                        ),
                      ),
                      WidgetUtils.commonSizedBox(0, 20),
                      //确认
                      Expanded(
                          child: GestureDetector(
                        onTap: (() {}),
                        child: Container(
                          height: ScreenUtil().setHeight(96),
                          width: double.infinity,
                          alignment: Alignment.center,
                          //边框设置
                          decoration: const BoxDecoration(
                            //背景
                            color: MyColors.ziYellow,
                            //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Text(
                            '确认购买',
                            style: StyleUtils.getCommonTextStyle(
                                color: MyColors.loginZiBlack,
                                fontSize: ConfigScreenUtil.autoSize30,
                                fontFamily: MyConfig.mMedium),
                          ),
                        ),
                      )),
                    ],
                  ),
                  WidgetUtils.commonSizedBox(20, 0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
