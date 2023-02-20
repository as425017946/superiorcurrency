import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:superiorcurrency/pages/home/home_widget.dart';
import 'package:superiorcurrency/utils/style_utils.dart';

import '../../colors/my_colors.dart';
import '../../config/config_screen_util.dart';
import '../../utils/event_utils.dart';
import '../../utils/widget_utils.dart';

/// 首页
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map> imgList = [
    {"url": "https://static.runoob.com/images/demo/demo2.jpg"},
    {"url": "http://image.nbd.com.cn/uploads/articles/images/673466/500352700_banner.jpg"},
    {"url": "https://upload-images.jianshu.io/upload_images/5809200-a99419bb94924e6d.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240"},
  ];

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
      appBar: null,
      backgroundColor: MyColors.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //头部
              Container(
                height: ConfigScreenUtil.autoHeight90,
                width: double.infinity,
                alignment: Alignment.center,
                child: Row(
                  children: [
                    WidgetUtils.commonSizedBox(0, ConfigScreenUtil.autoWidth30),
                    HomeWidget.topContainer(context),
                    const Expanded(child: Text("")),
                    GestureDetector(
                      onTap: (() {
                        Navigator.pushNamed(context, 'MinePage');
                      }),
                      child: WidgetUtils.showImages(
                          "assets/images/m_saoyisao.png",
                          ConfigScreenUtil.autoWidth50,
                          ConfigScreenUtil.autoHeight50),
                    ),
                    WidgetUtils.commonSizedBox(0, ConfigScreenUtil.autoWidth20),
                    GestureDetector(
                      onDoubleTap: (() {
                        Navigator.pushNamed(context, 'USDTPage');
                      }),
                      child: WidgetUtils.showImages(
                          "assets/images/m_messages.png",
                          ConfigScreenUtil.autoWidth50,
                          ConfigScreenUtil.autoHeight50),
                    ),
                    WidgetUtils.commonSizedBox(0, ConfigScreenUtil.autoWidth40),
                  ],
                ),
              ),
              WidgetUtils.myLine(color: MyColors.hx),
              //轮播图
              HomeWidget.showLunBo(imgList),
              //通知消息
              Container(
                height: ConfigScreenUtil.autoHeight50,
                width: double.infinity,
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(ConfigScreenUtil.autoWidth30, ConfigScreenUtil.autoWidth10, ConfigScreenUtil.autoWidth30, ConfigScreenUtil.autoWidth10),
                child: Row(
                  children: [
                    WidgetUtils.showImages("assets/images/m_laba.png", ConfigScreenUtil.autoHeight30, ConfigScreenUtil.autoHeight30),
                    WidgetUtils.commonSizedBox(0, ConfigScreenUtil.autoWidth15),
                    WidgetUtils.onlyText('易币付身份认证重要更新', StyleUtils.whiteTextStyle),
                    const Expanded(child: Text("")),
                    WidgetUtils.showImages("assets/images/m_more.png", ConfigScreenUtil.autoHeight30, ConfigScreenUtil.autoHeight30),
                  ],
                ),
              ),
              //收付款
              Container(
                height: ConfigScreenUtil.autoHeight140,
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
                            WidgetUtils.showImages("assets/images/m_shoukuan.png", ConfigScreenUtil.autoHeight40, ConfigScreenUtil.autoHeight40),
                            WidgetUtils.commonSizedBox(ConfigScreenUtil.autoHeight10, 0),
                            WidgetUtils.onlyTextCenter('收款', StyleUtils.yellowTextStyle),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: ((){
                          Navigator.pushNamed(context, 'ZhuanzhangPage');
                        }),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            WidgetUtils.showImages("assets/images/m_zhuanzhang.png", ConfigScreenUtil.autoHeight40, ConfigScreenUtil.autoHeight40),
                            WidgetUtils.commonSizedBox(ConfigScreenUtil.autoHeight10, 0),
                            WidgetUtils.onlyTextCenter('转账', StyleUtils.yellowTextStyle),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: ((){
                          Navigator.pushNamed(context, 'SharePage');
                        }),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            WidgetUtils.showImages("assets/images/m_fenxiang.png", ConfigScreenUtil.autoHeight40, ConfigScreenUtil.autoHeight40),
                            WidgetUtils.commonSizedBox(ConfigScreenUtil.autoHeight10, 0),
                            WidgetUtils.onlyTextCenter('分享', StyleUtils.yellowTextStyle),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: ((){

                        }),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            WidgetUtils.showImages("assets/images/m_kefu.png", ConfigScreenUtil.autoHeight40, ConfigScreenUtil.autoHeight40),
                            WidgetUtils.commonSizedBox(ConfigScreenUtil.autoHeight10, 0),
                            WidgetUtils.onlyTextCenter('客服', StyleUtils.yellowTextStyle),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //买卖货币
              Container(
                height: ConfigScreenUtil.autoHeight254,
                width: double.infinity,
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(ConfigScreenUtil.autoWidth30, ConfigScreenUtil.autoWidth30, ConfigScreenUtil.autoWidth30, ConfigScreenUtil.autoWidth10),
                //边框设置
                decoration: const BoxDecoration(
                  //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                  borderRadius:  BorderRadius.all(Radius.circular(15.0)),
                  color: MyColors.c2,
                  image: DecorationImage(image: AssetImage("assets/images/m_maimai.png"),fit: BoxFit.fill),
                ),
                child: Column(
                  children: [
                    Container(
                      height: ConfigScreenUtil.autoHeight110,
                      width: double.infinity,
                      margin: EdgeInsets.fromLTRB(ConfigScreenUtil.autoWidth20, 0, ConfigScreenUtil.autoWidth30, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          WidgetUtils.showImagesFill("assets/images/m_tt.png", ConfigScreenUtil.autoWidth60, ConfigScreenUtil.autoWidth80),
                          WidgetUtils.commonSizedBox(0, 10),
                          WidgetUtils.onlyText('快捷卖币', StyleUtils.getCommonTextStyle(color: MyColors.ziYellow,fontSize: ConfigScreenUtil.autoSize32,fontWeight: FontWeight.bold)),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: double.infinity,
                                  alignment: Alignment.centerRight,
                                  child: Text("全网唯一平台担保赔付", textAlign: TextAlign.right, style: TextStyle(
                                    color: MyColors.ziYellow,
                                    fontSize: ConfigScreenUtil.autoSize24,
                                  ),),
                                ),
                                Container(
                                  width: double.infinity,
                                  alignment: Alignment.centerRight,
                                  child: Text("免实名认证买卖币 全网最高卖U价", textAlign: TextAlign.right,style: TextStyle(
                                      color: Colors.white,
                                      fontSize: ConfigScreenUtil.autoSize20
                                  ),),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: ConfigScreenUtil.autoHeight144,
                      width: double.infinity,
                      margin: EdgeInsets.fromLTRB(ConfigScreenUtil.autoWidth20, 0, ConfigScreenUtil.autoWidth30, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          WidgetUtils.commonSizedBox(0, 10),
                          WidgetUtils.showImages("assets/images/m_mm.png", ConfigScreenUtil.autoWidth50, ConfigScreenUtil.autoWidth50),
                          WidgetUtils.commonSizedBox(0, 5),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                WidgetUtils.onlyText('普通出售', StyleUtils.getCommonTextStyle(color: MyColors.ziYellow,fontSize: ConfigScreenUtil.autoSize32,fontWeight: FontWeight.bold)),
                                WidgetUtils.onlyText('海量买家，24小时便捷出售', StyleUtils.getCommonTextStyle(color: MyColors.g8,fontSize: ConfigScreenUtil.autoSize18)),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: ((){
                              eventBus.fire(BottomBack(index: 1));
                            }),
                            child: SizedBox(
                              width: ConfigScreenUtil.autoHeight188,
                              height: ConfigScreenUtil.autoHeight88,
                              child: Stack(
                                children: [
                                  WidgetUtils.showImagesFill("assets/images/m_mai.png", ConfigScreenUtil.autoHeight88,  ConfigScreenUtil.autoHeight188),
                                  Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        width: double.infinity,
                                        height: ConfigScreenUtil.autoHeight40,
                                        child: Text(
                                          '￥6.66',
                                          style: StyleUtils.whiteTextStyle,
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        width: double.infinity,
                                        height: ConfigScreenUtil.autoHeight44,
                                        child: Text(
                                          '卖币 GO >',
                                          style: StyleUtils.getCommonTextStyle(color: MyColors.ziBlack,fontSize: ConfigScreenUtil.autoSize24,fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
