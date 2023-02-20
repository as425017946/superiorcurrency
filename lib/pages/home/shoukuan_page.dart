import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:superiorcurrency/colors/my_colors.dart';
import 'package:superiorcurrency/config/my_config.dart';
import 'package:superiorcurrency/http/my_http_config.dart';
import 'package:superiorcurrency/utils/my_toast_utils.dart';

import '../../config/config_screen_util.dart';
import '../../utils/style_utils.dart';
import '../../utils/widget_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///收款页面
class ShoukuanPage extends StatefulWidget {
  const ShoukuanPage({Key? key}) : super(key: key);

  @override
  State<ShoukuanPage> createState() => _ShoukuanPageState();
}

class _ShoukuanPageState extends State<ShoukuanPage> {
  //判断点击了那个，默认选择第一个
  bool isClick = true;
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
      backgroundColor: MyColors.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              WidgetUtils.commonSizedBox(10, double.infinity),
              WidgetUtils.getTitleWidget('USDT收款', true, context, false, ''),
              WidgetUtils.commonSizedBox(10, double.infinity),
              //横线
              WidgetUtils.myLine(color: MyColors.loginHX, thickness: 0.5),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(
                    left: ConfigScreenUtil.autoWidth30,
                    right: ConfigScreenUtil.autoWidth30,
                    top: ConfigScreenUtil.autoHeight20),
                child: Column(
                  children: [
                    WidgetUtils.onlyText(
                        '链名称',
                        StyleUtils.getCommonTextStyle(
                            color: MyColors.g8,
                            fontSize: ConfigScreenUtil.autoSize32)),
                    WidgetUtils.commonSizedBox(20, double.infinity),
                    //2个按钮
                    Row(
                      children: [
                        GestureDetector(
                          onTap: (() {
                            setState(() {
                              isClick = !isClick;
                            });
                          }),
                          child: WidgetUtils.commonContainer(isClick, 'TRC20', 48, 124),
                        ),
                        WidgetUtils.commonSizedBox(0, 15),
                        GestureDetector(
                          onTap: (() {
                            setState(() {
                              isClick = !isClick;
                            });
                          }),
                          child: WidgetUtils.commonContainer(!isClick, 'ERC20', 48, 124),
                        ),
                      ],
                    ),
                    WidgetUtils.commonSizedBox(20, double.infinity),
                    WidgetUtils.onlyText(
                        '收款地址',
                        StyleUtils.getCommonTextStyle(
                            color: MyColors.g8,
                            fontSize: ConfigScreenUtil.autoSize32)),
                    WidgetUtils.commonSizedBox(10, double.infinity),
                    //复制功能
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                              'ERC20ERC20ERC20ERC20ERC20',
                              style: StyleUtils.getCommonTextStyle(
                                  color: MyColors.ziYellow,
                                  fontSize: ConfigScreenUtil.autoSize30,
                                  fontFamily: MyConfig.mMedium),
                            )),
                        GestureDetector(
                          onTap: (() {
                            setState(() {
                              MyToastUtils.showToastBottom('链接已复制到剪切板');
                              Clipboard.setData(ClipboardData(text:'ERC20ERC20ERC20ERC20ERC20'));
                            });
                          }),
                          child: WidgetUtils.showImages(
                              'assets/images/m_fuzhi.png',
                              ScreenUtil().setHeight(33),
                              ScreenUtil().setHeight(38)),
                        ),
                      ],
                    ),
                    WidgetUtils.commonSizedBox(60, double.infinity),
                    //二维码
                    WidgetUtils.showImages('assets/images/m_erweima.png', ScreenUtil().setHeight(342), ScreenUtil().setHeight(342)),
                    WidgetUtils.commonSizedBox(60, double.infinity),
                    //保存到相册和 分享地址
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: (() {
                            setState(() {

                            });
                          }),
                          child: WidgetUtils.commonContainer(false, '保存至相册', 72, 240),
                        ),
                        WidgetUtils.commonSizedBox(0, 30),
                        GestureDetector(
                          onTap: (() {
                            setState(() {

                            });
                          }),
                          child: WidgetUtils.commonContainer(false, '分享地址', 72, 240),
                        ),
                      ],
                    ),
                    WidgetUtils.commonSizedBox(77, double.infinity),
                    WidgetUtils.onlyText(
                        '该地址仅支持 USDT-TRC20 收款',
                        StyleUtils.getCommonTextStyle(
                            color: MyColors.g8,
                            fontSize: ConfigScreenUtil.autoSize24)),
                    WidgetUtils.onlyText(
                        '请勿用于其他币种，否则资产将不可找回',
                        StyleUtils.getCommonTextStyle(
                            color: MyColors.g8,
                            fontSize: ConfigScreenUtil.autoSize24)),
                    WidgetUtils.myLine(color: MyColors.g8),
                    WidgetUtils.onlyText(
                        '从优币付钱包之外地址转入的资金，需要在完成交易的120分钟后，才能将资产转账给优币付其他用户或提到钱包以外的地址最小收款金额:0.0001USDT小于最小金额的收款将不会上账且无法退回1次网络确认后可到账，1次网络确认后可转账。您的充值地址不会经常改变，可截图保存并重复充值。',
                        StyleUtils.getCommonTextStyle(
                            color: MyColors.g8,
                            fontSize: ConfigScreenUtil.autoSize24)),
                    WidgetUtils.commonSizedBox(100, double.infinity),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
