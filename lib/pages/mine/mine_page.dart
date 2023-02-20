import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:superiorcurrency/colors/my_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/config_screen_util.dart';
import '../../config/my_config.dart';
import '../../utils/my_utils.dart';
import '../../utils/style_utils.dart';
import '../../utils/widget_utils.dart';

/// 我的
class MinePage extends StatefulWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
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
            WidgetUtils.commonSizedBox(10, double.infinity),
            WidgetUtils.getTitleWidget('我的', true, context, false, ''),
            WidgetUtils.commonSizedBox(10, double.infinity),
            //横线
            WidgetUtils.myLine(color: MyColors.loginHX, thickness: 0.5),
            //用户信息
            Container(
              height: ConfigScreenUtil.autoHeight140,
              width: double.infinity,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.fromLTRB(
                  ConfigScreenUtil.autoWidth30,
                  ConfigScreenUtil.autoWidth30,
                  ConfigScreenUtil.autoWidth30,
                  ConfigScreenUtil.autoWidth10),
              //边框设置
              decoration: const BoxDecoration(
                  //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  color: MyColors.c2),
              child: Row(
                children: [
                  WidgetUtils.commonSizedBox(0, ConfigScreenUtil.autoWidth30),
                  ClipRRect(
                      child: Image.network(
                        'http://pics5.baidu.com/feed/622762d0f703918f751ba5e950ce8d915beec4c1.jpeg?token=ed435fd18c71cf7ca7a011acb70460f7',
                        width: 50,
                        height: 50,
                      ),
                      borderRadius: BorderRadius.circular(50)),
                  WidgetUtils.commonSizedBox(0, ConfigScreenUtil.autoWidth30),
                  Column(
                    children: [
                      Expanded(child: Text('')),
                      Container(
                        width: 200,
                        alignment: Alignment.centerLeft,
                        child: WidgetUtils.onlyText(
                            '名字', StyleUtils.yellowTextStyle),
                      ),
                      WidgetUtils.commonSizedBox(
                          ConfigScreenUtil.autoHeight10, 0),
                      Container(
                        width: 200,
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            WidgetUtils.onlyTextCenter(
                                'UID: 123456', StyleUtils.getCommonTextStyle(color: MyColors.g8,fontSize: ConfigScreenUtil.autoSize28)),
                            WidgetUtils.commonSizedBox(0, ConfigScreenUtil.autoWidth30),
                            WidgetUtils.showImages(
                                "assets/images/m_mine_fuzhi.png",
                                ConfigScreenUtil.autoHeight20,
                                ConfigScreenUtil.autoHeight20),
                          ],
                        ),
                      ),
                      Expanded(child: Text('')),
                    ],
                  ),
                ],
              ),
            ),
            //安全
            Container(
              height: ConfigScreenUtil.autoHeight180,
              width: double.infinity,
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(ConfigScreenUtil.autoWidth30, ConfigScreenUtil.autoWidth30, ConfigScreenUtil.autoWidth30, ConfigScreenUtil.autoWidth10),
              //边框设置
              decoration: const BoxDecoration(
                //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                  borderRadius:  BorderRadius.all(Radius.circular(15.0)),
                  color: MyColors.c2
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: ((){
                        Navigator.pushNamed(context, 'ShoukuanPage');
                      }),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          WidgetUtils.showImages("assets/images/m_mine_anquan.png", ConfigScreenUtil.autoHeight60, ConfigScreenUtil.autoHeight60),
                          WidgetUtils.commonSizedBox(ConfigScreenUtil.autoHeight10, 0),
                          WidgetUtils.onlyTextCenter('安全中心', StyleUtils.getCommonTextStyle(color: MyColors.ziYellow, fontSize: ConfigScreenUtil.autoSize30)),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 1,
                    height: ConfigScreenUtil.autoHeight130,
                    color: MyColors.g8,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: ((){
                        Navigator.pushNamed(context, 'ZhuanzhangPage');
                      }),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          WidgetUtils.showImages("assets/images/m_mine_shoukuan.png", ConfigScreenUtil.autoHeight60, ConfigScreenUtil.autoHeight60),
                          WidgetUtils.commonSizedBox(ConfigScreenUtil.autoHeight10, 0),
                          WidgetUtils.onlyTextCenter('收款方式', StyleUtils.getCommonTextStyle(color: MyColors.ziYellow, fontSize: ConfigScreenUtil.autoSize30)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //设置
            Container(
              constraints: BoxConstraints(
                  minHeight: ConfigScreenUtil.autoHeight220),
              width: double.infinity,
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(ConfigScreenUtil.autoWidth30, ConfigScreenUtil.autoWidth30, ConfigScreenUtil.autoWidth30, ConfigScreenUtil.autoWidth10),
              padding: EdgeInsets.only(left: 20,right: 20),
              //边框设置
              decoration: const BoxDecoration(
                //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                  borderRadius:  BorderRadius.all(Radius.circular(15.0)),
                  color: MyColors.c2
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: ((){

                    }),
                    child: Container(
                      height: ConfigScreenUtil.autoHeight88,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          WidgetUtils.showImages("assets/images/m_mine_dizhi.png", ConfigScreenUtil.autoHeight40, ConfigScreenUtil.autoHeight40),
                          WidgetUtils.commonSizedBox(0, ConfigScreenUtil.autoHeight10),
                          WidgetUtils.onlyTextCenter('地址簿', StyleUtils.getCommonTextStyle(color: MyColors.ziYellow, fontSize: ConfigScreenUtil.autoSize30)),
                          Expanded(child: Text('')),
                          WidgetUtils.showImages("assets/images/m_mine_jiantou.png", ConfigScreenUtil.autoHeight30, ConfigScreenUtil.autoHeight30),
                        ],
                      ),
                    ),
                  ),
                  //横线
                  Container(
                    width: double.infinity,
                    height: 0.5,
                    color: MyColors.loginHX,
                  ),
                  GestureDetector(
                    onTap: ((){

                    }),
                    child: Container(
                      height: ConfigScreenUtil.autoHeight88,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          WidgetUtils.showImages("assets/images/m_mine_bangzhu.png", ConfigScreenUtil.autoHeight40, ConfigScreenUtil.autoHeight40),
                          WidgetUtils.commonSizedBox(0, ConfigScreenUtil.autoHeight10),
                          WidgetUtils.onlyTextCenter('帮助中心', StyleUtils.getCommonTextStyle(color: MyColors.ziYellow, fontSize: ConfigScreenUtil.autoSize30)),
                          Expanded(child: Text('')),
                          WidgetUtils.showImages("assets/images/m_mine_jiantou.png", ConfigScreenUtil.autoHeight30, ConfigScreenUtil.autoHeight30),
                        ],
                      ),
                    ),
                  ),
                  //横线
                  Container(
                    width: double.infinity,
                    height: 0.5,
                    color: MyColors.loginHX,
                  ),
                  GestureDetector(
                    onTap: ((){

                    }),
                    child: Container(
                      height: ConfigScreenUtil.autoHeight88,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          WidgetUtils.showImages("assets/images/m_mine_guanyu.png", ConfigScreenUtil.autoHeight40, ConfigScreenUtil.autoHeight40),
                          WidgetUtils.commonSizedBox(0, ConfigScreenUtil.autoHeight10),
                          WidgetUtils.onlyTextCenter('关于我们', StyleUtils.getCommonTextStyle(color: MyColors.ziYellow, fontSize: ConfigScreenUtil.autoSize30)),
                          Expanded(child: Text('')),
                          WidgetUtils.showImages("assets/images/m_mine_jiantou.png", ConfigScreenUtil.autoHeight30, ConfigScreenUtil.autoHeight30),
                        ],
                      ),
                    ),
                  ),
                  //横线
                  Container(
                    width: double.infinity,
                    height: 0.5,
                    color: MyColors.loginHX,
                  ),
                  GestureDetector(
                    onTap: ((){

                    }),
                    child: Container(
                      height: ConfigScreenUtil.autoHeight88,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          WidgetUtils.showImages("assets/images/m_mine_fenxiang.png", ConfigScreenUtil.autoHeight40, ConfigScreenUtil.autoHeight40),
                          WidgetUtils.commonSizedBox(0, ConfigScreenUtil.autoHeight10),
                          WidgetUtils.onlyTextCenter('分享优币付', StyleUtils.getCommonTextStyle(color: MyColors.ziYellow, fontSize: ConfigScreenUtil.autoSize30)),
                          Expanded(child: Text('')),
                          WidgetUtils.showImages("assets/images/m_mine_jiantou.png", ConfigScreenUtil.autoHeight30, ConfigScreenUtil.autoHeight30),
                        ],
                      ),
                    ),
                  ),
                  //横线
                  Container(
                    width: double.infinity,
                    height: 0.5,
                    color: MyColors.loginHX,
                  ),
                  GestureDetector(
                    onTap: ((){

                    }),
                    child: Container(
                      height: ConfigScreenUtil.autoHeight88,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          WidgetUtils.showImages("assets/images/m_mine_kefu.png", ConfigScreenUtil.autoHeight40, ConfigScreenUtil.autoHeight40),
                          WidgetUtils.commonSizedBox(0, ConfigScreenUtil.autoHeight10),
                          WidgetUtils.onlyTextCenter('联系客服', StyleUtils.getCommonTextStyle(color: MyColors.ziYellow, fontSize: ConfigScreenUtil.autoSize30)),
                          Expanded(child: Text('')),
                          WidgetUtils.showImages("assets/images/m_mine_jiantou.png", ConfigScreenUtil.autoHeight30, ConfigScreenUtil.autoHeight30),
                        ],
                      ),
                    ),
                  ),
                  //横线
                  Container(
                    width: double.infinity,
                    height: 0.5,
                    color: MyColors.loginHX,
                  ),
                  GestureDetector(
                    onTap: ((){

                    }),
                    child: Container(
                      height: ConfigScreenUtil.autoHeight88,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          WidgetUtils.showImages("assets/images/m_mine_shezhi.png", ConfigScreenUtil.autoHeight40, ConfigScreenUtil.autoHeight40),
                          WidgetUtils.commonSizedBox(0, ConfigScreenUtil.autoHeight10),
                          WidgetUtils.onlyTextCenter('版本号', StyleUtils.getCommonTextStyle(color: MyColors.ziYellow, fontSize: ConfigScreenUtil.autoSize30)),
                          Expanded(child: Text('')),
                          WidgetUtils.showImages("assets/images/m_mine_jiantou.png", ConfigScreenUtil.autoHeight30, ConfigScreenUtil.autoHeight30),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(child: Text('')),
            //购买USDT
            GestureDetector(
              onTap: (() {
                if (MyUtils.checkClick()) {}
              }),
              child: Container(
                height: ScreenUtil().setHeight(96),
                width: double.infinity,
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(ConfigScreenUtil.autoWidth30, ConfigScreenUtil.autoWidth30, ConfigScreenUtil.autoWidth30, ConfigScreenUtil.autoWidth30),
                //边框设置
                decoration: BoxDecoration(
                  //背景
                  color: MyColors.ziYellow,
                  //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                  borderRadius:
                  BorderRadius.all(Radius.circular(10)),
                ),
                child: Text(
                  '退出登录',
                  style: StyleUtils.getCommonTextStyle(
                      color: MyColors.loginZiBlack,
                      fontSize: ConfigScreenUtil.autoSize30,
                      fontFamily: MyConfig.mMedium),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
