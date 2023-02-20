import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:superiorcurrency/colors/my_colors.dart';
import 'package:superiorcurrency/config/config_screen_util.dart';
import 'package:superiorcurrency/utils/widget_utils.dart';

import '../../utils/my_toast_utils.dart';
import '../../utils/style_utils.dart';

///分享页面
class SharePage extends StatefulWidget {
  const SharePage({Key? key}) : super(key: key);

  @override
  State<SharePage> createState() => _SharePageState();
}

class _SharePageState extends State<SharePage> {

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
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(ConfigScreenUtil.autoWidth90),
              child: WidgetUtils.showImages('assets/images/m_fenxiangye.png',
                  ConfigScreenUtil.autoHeight800, double.infinity),
            ),
            Expanded(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: MyColors.share_bg,
                child: Column(
                  children: [
                    WidgetUtils.commonSizedBox(10, double.infinity),
                    WidgetUtils.onlyTextCenter(
                        '分享到',
                        StyleUtils.getCommonTextStyle(
                            color: MyColors.g8,
                            fontSize: ConfigScreenUtil.autoSize30)),
                    WidgetUtils.commonSizedBox(10, double.infinity),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: (() {
                              Navigator.pushNamed(context, 'SharePage');
                            }),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                WidgetUtils.showImages(
                                    "assets/images/m_share_img.png",
                                    ConfigScreenUtil.autoHeight50,
                                    ConfigScreenUtil.autoHeight50),
                                WidgetUtils.commonSizedBox(
                                    ConfigScreenUtil.autoHeight10, 0),
                                WidgetUtils.onlyTextCenter(
                                    '保存图片',
                                    StyleUtils.getCommonTextStyle(
                                        color: MyColors.ziYellow)),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: (() {
                              Navigator.pop(context);
                              MyToastUtils.showToastBottom('链接已复制到剪切板');
                              Clipboard.setData(ClipboardData(text:'到时候放下载地址'));
                            }),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                WidgetUtils.showImages(
                                    "assets/images/m_share_fenxiang.png",
                                    ConfigScreenUtil.autoHeight50,
                                    ConfigScreenUtil.autoHeight50),
                                WidgetUtils.commonSizedBox(
                                    ConfigScreenUtil.autoHeight10, 0),
                                WidgetUtils.onlyTextCenter(
                                    '复制链接',
                                    StyleUtils.getCommonTextStyle(
                                        color: MyColors.ziYellow)),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: (() {
                              Navigator.pushNamed(context, 'SharePage');
                            }),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                WidgetUtils.showImages(
                                    "assets/images/m_share_more.png",
                                    ConfigScreenUtil.autoHeight50,
                                    ConfigScreenUtil.autoHeight50),
                                WidgetUtils.commonSizedBox(
                                    ConfigScreenUtil.autoHeight10, 0),
                                WidgetUtils.onlyTextCenter(
                                    '更多',
                                    StyleUtils.getCommonTextStyle(
                                        color: MyColors.ziYellow)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    WidgetUtils.commonSizedBox(10, double.infinity),
                    WidgetUtils.myLine(color: MyColors.loginHX, thickness: 0.5),
                    Expanded(
                        child: GestureDetector(
                      onTap: (() {
                        Navigator.pop(context);
                      }),
                      child: WidgetUtils.onlyTextCenter(
                          '取消',
                          StyleUtils.getCommonTextStyle(
                              color: MyColors.g8,
                              fontSize: ConfigScreenUtil.autoSize30)),
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
