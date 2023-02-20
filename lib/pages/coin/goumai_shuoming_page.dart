import 'package:flutter/material.dart';

import '../../colors/my_colors.dart';
import '../../config/config_screen_util.dart';
import '../../config/my_config.dart';
import '../../utils/style_utils.dart';
import '../../utils/widget_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
///购买数字货币限制
class GOumaiShuomingPage extends StatefulWidget {
  const GOumaiShuomingPage({Key? key}) : super(key: key);

  @override
  State<GOumaiShuomingPage> createState() => _GOumaiShuomingPageState();
}

class _GOumaiShuomingPageState extends State<GOumaiShuomingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            WidgetUtils.commonSizedBox(10, double.infinity),
            WidgetUtils.getTitleWidget('购买数字货币限制', true, context, false, ''),
            WidgetUtils.commonSizedBox(10, double.infinity),
            //横线
            Container(width: double.infinity,height: 0.5,color: MyColors.loginHX,),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: ConfigScreenUtil.autoHeight160,
                  alignment: Alignment.center,
                  color: MyColors.mm_bg,
                  child: Row(
                    children: [
                      WidgetUtils.commonSizedBox(0, ConfigScreenUtil.autoWidth30),
                      WidgetUtils.showImages(
                          'assets/images/m_gm_tishi.png',
                          ConfigScreenUtil.autoHeight100,
                          ConfigScreenUtil.autoHeight100),
                      WidgetUtils.commonSizedBox(0, 5),
                      WidgetUtils.onlyText(
                          '注：您购买的数字货币将被限制24小时。\n在冻结期间，您无法进行一下业务：',
                          StyleUtils.getCommonTextStyle(
                              color: MyColors.themeRed2,
                              fontSize: ConfigScreenUtil.autoSize30)),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(ConfigScreenUtil.autoWidth30),
                  child: Column(
                    children: [
                      WidgetUtils.commonSizedBox(10, double.infinity),
                      WidgetUtils.onlyText(
                          '-转账至优币付其他用户地址',
                          StyleUtils.getCommonTextStyle(
                              color: MyColors.ziYellow,
                              fontSize: ConfigScreenUtil.autoSize30,
                              fontFamily: MyConfig.mMedium)),
                      WidgetUtils.commonSizedBox(10, double.infinity),
                      WidgetUtils.onlyText(
                          '-转账至优币付以外的钱包地址',
                          StyleUtils.getCommonTextStyle(
                              color: MyColors.ziYellow,
                              fontSize: ConfigScreenUtil.autoSize30,
                              fontFamily: MyConfig.mMedium)),
                      WidgetUtils.commonSizedBox(10, double.infinity),
                      WidgetUtils.onlyText(
                          '用于OTC出售',
                          StyleUtils.getCommonTextStyle(
                              color: MyColors.ziYellow,
                              fontSize: ConfigScreenUtil.autoSize30,
                              fontFamily: MyConfig.mMedium)),
                      WidgetUtils.commonSizedBox(10, double.infinity),
                      WidgetUtils.onlyText(
                          '-划转至BIB',
                          StyleUtils.getCommonTextStyle(
                              color: MyColors.ziYellow,
                              fontSize: ConfigScreenUtil.autoSize30,
                              fontFamily: MyConfig.mMedium)),
                      WidgetUtils.commonSizedBox(20, double.infinity),
                      //横线
                      Container(width: double.infinity,height: 0.5,color: MyColors.loginHX,),
                      WidgetUtils.commonSizedBox(10, double.infinity),
                      WidgetUtils.onlyText(
                          '注：在以上场景，您的可用余额将自动扣除限制部分。完整余额请以首页资产为准。',
                          StyleUtils.getCommonTextStyle(
                              color: MyColors.g8,
                              fontSize: ConfigScreenUtil.autoSize28,
                              fontFamily: MyConfig.mMedium)),
                      WidgetUtils.commonSizedBox(20, double.infinity),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
