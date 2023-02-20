import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:superiorcurrency/colors/my_colors.dart';
import 'package:superiorcurrency/config/config_screen_util.dart';
import 'package:superiorcurrency/pages/coin/coin_widget.dart';
import 'package:superiorcurrency/utils/style_utils.dart';

import '../../config/my_config.dart';
import '../../utils/event_utils.dart';
import '../../utils/log_util.dart';
import '../../utils/my_utils.dart';
import '../../utils/widget_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 买卖币
class CoinPage extends StatefulWidget {
  const CoinPage({Key? key}) : super(key: key);

  @override
  State<CoinPage> createState() => _CoinPageState();
}

class _CoinPageState extends State<CoinPage> {
  bool isClick = false;
  final TextEditingController _controller = TextEditingController();
  FocusNode focusNode = FocusNode();

  //是否可以点击提交按钮,0默认不可以提交  sum2是购买页面购买按钮使用
  int sum = 0, sum2 = 0;

  //切换购买数量还是按金额购买
  bool isNumber = true;
  var listen,listen2;

  //金额选择
  List<bool> list_b = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  void clearList() {
    for (int i = 0; i < 13; i++) {
      list_b[i] = false;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        //获取焦点
      } else {
        //失去焦点
      }
    });
    listen = eventBus.on<BiBack>().listen((event) {
      LogE('返回值***${event.isBack} === ${event.index}');
      if (event.isBack) {
        if (event.index == 0) {
          setState(() {
            isClick = true;
          });
        } else {
          setState(() {
            isClick = false;
          });
        }
      }
    });
    listen2 = eventBus.on<OrderBack>().listen((event) {
      if (event.index == 0) {
        Navigator.pushNamed(context, 'OrderPage');
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    listen.cancel();
    listen2.cancel();
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //     statusBarColor: Color(0xFF2D2C2A), //状态栏背景颜色
    //     statusBarIconBrightness: Brightness.dark // dark:一般显示黑色   light：一般显示白色
    //     ));
    return Scaffold(
      resizeToAvoidBottomInset: false, // 解决键盘顶起页面
      backgroundColor: MyColors.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //头部
              Container(
                color: MyColors.mm_bg,
                child: Column(
                  children: [
                    WidgetUtils.commonSizedBox(10, double.infinity),
                    CoinWidget.getTitleWidget(context, isClick),
                    WidgetUtils.commonSizedBox(10, double.infinity),
                  ],
                ),
              ),
              isClick
                  ? Column(
                      //购买页面
                      children: [
                        Container(
                          height: 1,
                          width: double.infinity,
                          color: MyColors.hx,
                        ),
                        //购买数量
                        Container(
                          constraints: BoxConstraints(
                              minHeight: ConfigScreenUtil.autoHeight220),
                          width: double.infinity,
                          color: MyColors.mm_bg,
                          margin: EdgeInsets.only(
                              top: ConfigScreenUtil.autoHeight20),
                          padding: EdgeInsets.fromLTRB(
                              ConfigScreenUtil.autoWidth30,
                              ConfigScreenUtil.autoWidth10,
                              ConfigScreenUtil.autoWidth30,
                              ConfigScreenUtil.autoWidth10),
                          child: Column(
                            children: [
                              WidgetUtils.commonSizedBox(8, 0),
                              Row(
                                children: [
                                  WidgetUtils.showImages(
                                      'assets/images/m_mm_shutiao.png',
                                      ConfigScreenUtil.autoHeight30,
                                      ConfigScreenUtil.autoWidth6),
                                  WidgetUtils.commonSizedBox(0, 8),
                                  WidgetUtils.onlyText(
                                      '购买数量',
                                      StyleUtils.getCommonTextStyle(
                                          color: MyColors.ziYellow,
                                          fontFamily: MyConfig.mMedium,
                                          fontSize:
                                              ConfigScreenUtil.autoSize30)),
                                  const Expanded(child: Text('')),
                                  GestureDetector(
                                    onTap: (() {
                                      setState(() {
                                        isNumber = !isNumber;
                                      });
                                    }),
                                    child: Row(
                                      children: [
                                        WidgetUtils.showImages(
                                            'assets/images/m_mm_qiehuan.png',
                                            ConfigScreenUtil.autoHeight20,
                                            ConfigScreenUtil.autoWidth20),
                                        WidgetUtils.commonSizedBox(0, 8),
                                        WidgetUtils.onlyText(
                                            isNumber ? '按数量购买' : '按金额购买',
                                            StyleUtils.getCommonTextStyle(
                                                color: MyColors.ziYellow,
                                                fontFamily: MyConfig.mNormal,
                                                fontSize: ConfigScreenUtil
                                                    .autoSize28))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              WidgetUtils.commonSizedBox(20, 0),
                              WidgetUtils.onlyText(
                                  isNumber ? '快捷金额' : '任意数量',
                                  StyleUtils.getCommonTextStyle(
                                      color: MyColors.g8,
                                      fontFamily: MyConfig.mMedium,
                                      fontSize: ConfigScreenUtil.autoSize30)),
                              WidgetUtils.commonSizedBox(10, 0),
                              isNumber
                                  ? Column(
                                      children: [
                                        //第一排金额
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: (() {
                                                setState(() {
                                                  clearList();
                                                  list_b[0] = !list_b[0];
                                                });
                                              }),
                                              child: CoinWidget.commonContainer(
                                                  list_b[0], '￥100', 60, 120),
                                            ),
                                            const Expanded(child: Text('')),
                                            GestureDetector(
                                              onTap: (() {
                                                setState(() {
                                                  clearList();
                                                  list_b[1] = !list_b[1];
                                                });
                                              }),
                                              child: CoinWidget.commonContainer(
                                                  list_b[1], '￥200', 60, 120),
                                            ),
                                            const Expanded(child: Text('')),
                                            GestureDetector(
                                              onTap: (() {
                                                setState(() {
                                                  clearList();
                                                  list_b[2] = !list_b[2];
                                                });
                                              }),
                                              child: CoinWidget.commonContainer(
                                                  list_b[2], '￥300', 60, 120),
                                            ),
                                            const Expanded(child: Text('')),
                                            GestureDetector(
                                              onTap: (() {
                                                setState(() {
                                                  clearList();
                                                  list_b[3] = !list_b[3];
                                                });
                                              }),
                                              child: CoinWidget.commonContainer(
                                                  list_b[3], '￥500', 60, 120),
                                            ),
                                            const Expanded(child: Text('')),
                                            GestureDetector(
                                              onTap: (() {
                                                setState(() {
                                                  clearList();
                                                  list_b[4] = !list_b[4];
                                                });
                                              }),
                                              child: CoinWidget.commonContainer(
                                                  list_b[4], '￥1000', 60, 120),
                                            ),
                                          ],
                                        ),
                                        WidgetUtils.commonSizedBox(
                                            10, double.infinity),
                                        //第二排金额
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: (() {
                                                setState(() {
                                                  clearList();
                                                  list_b[5] = !list_b[5];
                                                });
                                              }),
                                              child: CoinWidget.commonContainer(
                                                  list_b[5], '￥1500', 60, 120),
                                            ),
                                            const Expanded(child: Text('')),
                                            GestureDetector(
                                              onTap: (() {
                                                setState(() {
                                                  clearList();
                                                  list_b[6] = !list_b[6];
                                                });
                                              }),
                                              child: CoinWidget.commonContainer(
                                                  list_b[6], '￥2000', 60, 120),
                                            ),
                                            const Expanded(child: Text('')),
                                            GestureDetector(
                                              onTap: (() {
                                                setState(() {
                                                  clearList();
                                                  list_b[7] = !list_b[7];
                                                });
                                              }),
                                              child: CoinWidget.commonContainer(
                                                  list_b[7], '￥3000', 60, 120),
                                            ),
                                            const Expanded(child: Text('')),
                                            GestureDetector(
                                              onTap: (() {
                                                setState(() {
                                                  clearList();
                                                  list_b[8] = !list_b[8];
                                                });
                                              }),
                                              child: CoinWidget.commonContainer(
                                                  list_b[8], '￥5000', 60, 120),
                                            ),
                                            const Expanded(child: Text('')),
                                            GestureDetector(
                                              onTap: (() {
                                                setState(() {
                                                  clearList();
                                                  list_b[9] = !list_b[9];
                                                });
                                              }),
                                              child: CoinWidget.commonContainer(
                                                  list_b[9], '￥8000', 60, 120),
                                            ),
                                          ],
                                        ),
                                        WidgetUtils.commonSizedBox(
                                            10, double.infinity),
                                        // 第三排金额
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: (() {
                                                setState(() {
                                                  clearList();
                                                  list_b[10] = !list_b[10];
                                                });
                                              }),
                                              child: CoinWidget.commonContainer(
                                                  list_b[10],
                                                  '￥10000',
                                                  60,
                                                  120),
                                            ),
                                            const Expanded(child: Text('')),
                                            GestureDetector(
                                              onTap: (() {
                                                setState(() {
                                                  clearList();
                                                  list_b[11] = !list_b[11];
                                                });
                                              }),
                                              child: CoinWidget.commonContainer(
                                                  list_b[11],
                                                  '￥15000',
                                                  60,
                                                  120),
                                            ),
                                            const Expanded(child: Text('')),
                                            GestureDetector(
                                              onTap: (() {
                                                setState(() {
                                                  clearList();
                                                  list_b[12] = !list_b[12];
                                                });
                                              }),
                                              child: CoinWidget.commonContainer(
                                                  list_b[12],
                                                  '￥20000',
                                                  60,
                                                  120),
                                            ),
                                            const Expanded(child: Text('')),
                                            SizedBox(
                                              height:
                                                  ScreenUtil().setHeight(60),
                                              width: ScreenUtil().setWidth(120),
                                            ),
                                            const Expanded(child: Text('')),
                                            SizedBox(
                                              height:
                                                  ScreenUtil().setHeight(60),
                                              width: ScreenUtil().setWidth(120),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  : WidgetUtils.commonSizedBox(0, 0),
                              isNumber
                                  ? WidgetUtils.commonSizedBox(20, 0)
                                  : WidgetUtils.commonSizedBox(0, 0),
                              isNumber
                                  ? WidgetUtils.onlyText(
                                      '任意金额',
                                      StyleUtils.getCommonTextStyle(
                                          color: MyColors.g8,
                                          fontFamily: MyConfig.mMedium,
                                          fontSize:
                                              ConfigScreenUtil.autoSize30))
                                  : WidgetUtils.commonSizedBox(0, 0),
                              WidgetUtils.commonSizedBox(10, 0),
                              Row(
                                children: [
                                  WidgetUtils.showImages(
                                      'assets/images/m_mm_tt.png',
                                      ConfigScreenUtil.autoHeight36,
                                      ConfigScreenUtil.autoHeight36),
                                  WidgetUtils.commonSizedBox(0, 15),
                                  Expanded(
                                      child: WidgetUtils.commonTextField(
                                          _controller,
                                          isNumber
                                              ? "限额100.00 ~ 20000.00"
                                              : "限额 16~15000 USDT",
                                          false,
                                          focusNode)),
                                ],
                              ),
                              //横线
                              WidgetUtils.myLine(color: MyColors.g9),
                            ],
                          ),
                        ),
                        //付款方式
                        Container(
                          height: ConfigScreenUtil.autoHeight220,
                          width: double.infinity,
                          color: MyColors.mm_bg,
                          margin: EdgeInsets.only(
                              top: ConfigScreenUtil.autoHeight20),
                          padding: EdgeInsets.fromLTRB(
                              ConfigScreenUtil.autoWidth30,
                              ConfigScreenUtil.autoWidth10,
                              ConfigScreenUtil.autoWidth30,
                              ConfigScreenUtil.autoWidth10),
                          child: Column(
                            children: [
                              WidgetUtils.commonSizedBox(8, 0),
                              Row(
                                children: [
                                  WidgetUtils.showImages(
                                      'assets/images/m_mm_shutiao.png',
                                      ConfigScreenUtil.autoHeight30,
                                      ConfigScreenUtil.autoWidth6),
                                  WidgetUtils.commonSizedBox(0, 8),
                                  WidgetUtils.onlyText(
                                      '选择付款方式',
                                      StyleUtils.getCommonTextStyle(
                                          color: MyColors.ziYellow,
                                          fontFamily: MyConfig.mMedium,
                                          fontSize:
                                          ConfigScreenUtil.autoSize30)),
                                  const Expanded(child: Text('')),
                                ],
                              ),
                              WidgetUtils.commonSizedBox(10, 0),
                              Row(
                                children: [
                                  Stack(
                                    children: [
                                      WidgetUtils.showImages(
                                          'assets/images/m_mm_xz_no.png',
                                          ConfigScreenUtil.autoHeight100,
                                          ConfigScreenUtil.autoWidth210),
                                      SizedBox(
                                        width: ConfigScreenUtil.autoWidth210,
                                        height: ConfigScreenUtil.autoHeight100,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            WidgetUtils.showImages(
                                                'assets/images/m_mm_yhk2.png',
                                                ConfigScreenUtil.autoHeight50,
                                                ConfigScreenUtil.autoWidth50),
                                            WidgetUtils.commonSizedBox(0, 5),
                                            WidgetUtils.onlyText('银行卡', StyleUtils.getCommonTextStyle(color: MyColors.mm_xz,fontSize: ConfigScreenUtil.autoSize30))
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  const Expanded(child: Text('')),
                                  Stack(
                                    children: [
                                      WidgetUtils.showImages(
                                          'assets/images/m_mm_xz_no.png',
                                          ConfigScreenUtil.autoHeight100,
                                          ConfigScreenUtil.autoWidth210),
                                      SizedBox(
                                        width: ConfigScreenUtil.autoWidth210,
                                        height: ConfigScreenUtil.autoHeight100,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            WidgetUtils.showImages(
                                                'assets/images/m_mm_wx2.png',
                                                ConfigScreenUtil.autoHeight50,
                                                ConfigScreenUtil.autoWidth50),
                                            WidgetUtils.commonSizedBox(0, 5),
                                            WidgetUtils.onlyText('微信', StyleUtils.getCommonTextStyle(color: MyColors.mm_xz,fontSize: ConfigScreenUtil.autoSize30))
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  const Expanded(child: Text('')),
                                  Stack(
                                    children: [
                                      WidgetUtils.showImages(
                                          'assets/images/m_mm_xz_no.png',
                                          ConfigScreenUtil.autoHeight100,
                                          ConfigScreenUtil.autoWidth210),
                                      SizedBox(
                                        width: ConfigScreenUtil.autoWidth210,
                                        height: ConfigScreenUtil.autoHeight100,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            WidgetUtils.showImages(
                                                'assets/images/m_mm_zfb2.png',
                                                ConfigScreenUtil.autoHeight50,
                                                ConfigScreenUtil.autoWidth50),
                                            WidgetUtils.commonSizedBox(0, 5),
                                            WidgetUtils.onlyText('支付宝', StyleUtils.getCommonTextStyle(color: MyColors.mm_xz,fontSize: ConfigScreenUtil.autoSize30))
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        //购买推荐
                        Container(
                          constraints: BoxConstraints(
                              minHeight: ConfigScreenUtil.autoHeight140),
                          width: double.infinity,
                          color: MyColors.mm_bg,
                          margin: EdgeInsets.only(
                              top: ConfigScreenUtil.autoHeight20),
                          padding: EdgeInsets.fromLTRB(
                              ConfigScreenUtil.autoWidth30,
                              ConfigScreenUtil.autoWidth10,
                              ConfigScreenUtil.autoWidth30,
                              ConfigScreenUtil.autoWidth10),
                          child: Column(
                            children: [
                              WidgetUtils.commonSizedBox(8, 0),
                              Row(
                                children: [
                                  WidgetUtils.showImages(
                                      'assets/images/m_mm_shutiao.png',
                                      ConfigScreenUtil.autoHeight30,
                                      ConfigScreenUtil.autoWidth6),
                                  WidgetUtils.commonSizedBox(0, 8),
                                  WidgetUtils.onlyText(
                                      '购买整单',
                                      StyleUtils.getCommonTextStyle(
                                          color: MyColors.ziYellow,
                                          fontFamily: MyConfig.mMedium,
                                          fontSize:
                                          ConfigScreenUtil.autoSize30)),
                                  WidgetUtils.commonSizedBox(0, 8),
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      WidgetUtils.showImages(
                                          'assets/images/m_mm_danjia.png',
                                          ConfigScreenUtil.autoHeight40,
                                          ConfigScreenUtil.autoWidth170),
                                      WidgetUtils.onlyTextCenter(
                                          '单价¥3.16',
                                          StyleUtils.getCommonTextStyle(
                                              color: Colors.white,
                                              fontFamily: MyConfig.mMedium,
                                              fontSize:
                                              ConfigScreenUtil.autoSize24))
                                    ],
                                  ),
                                  const Expanded(child: Text('')),
                                  GestureDetector(
                                    onTap: (() {
                                      setState(() {
                                        isNumber = !isNumber;
                                      });
                                    }),
                                    child: Row(
                                      children: [
                                        WidgetUtils.onlyText(
                                            '5s',
                                            StyleUtils.getCommonTextStyle(
                                                color: MyColors.g8,
                                                fontFamily: MyConfig.mNormal,
                                                fontSize: ConfigScreenUtil
                                                    .autoSize30)),
                                        WidgetUtils.commonSizedBox(0, 8),
                                        WidgetUtils.showImages(
                                            'assets/images/m_mm_sx.png',
                                            ConfigScreenUtil.autoHeight30,
                                            ConfigScreenUtil.autoWidth30),
                                       
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              WidgetUtils.commonSizedBox(20, 0),
                              Row(
                                children: [
                                  WidgetUtils.onlyText(
                                      '20.000000 USDT',
                                      StyleUtils.getCommonTextStyle(
                                          color: MyColors.ziYellow,
                                          fontFamily: MyConfig.mMedium,
                                          fontSize: ConfigScreenUtil.autoSize30)),
                                  const Expanded(child: Text('')),
                                  WidgetUtils.onlyText(
                                      '￥200.00',
                                      StyleUtils.getCommonTextStyle(
                                          color: MyColors.g8,
                                          fontFamily: MyConfig.mMedium,
                                          fontSize: ConfigScreenUtil.autoSize30)),
                                  WidgetUtils.commonSizedBox(0, 5),
                                  WidgetUtils.showImages('assets/images/m_mm_xia.png', ScreenUtil().setHeight(24), ScreenUtil().setWidth(13)),
                                  WidgetUtils.commonSizedBox(0, 5),
                                  WidgetUtils.onlyText(
                                      '0.00',
                                      StyleUtils.getCommonTextStyle(
                                          color: MyColors.ziYellow,
                                          fontFamily: MyConfig.mMedium,
                                          fontSize: ConfigScreenUtil.autoSize30)),
                                  WidgetUtils.commonSizedBox(0, 5),
                                  GestureDetector(
                                    onTap: ((){

                                    }),
                                    child: WidgetUtils.onlyText(
                                        '购买',
                                        StyleUtils.getCommonTextStyle(
                                            color: MyColors.ziYellow,
                                            fontFamily: MyConfig.mMedium,
                                            fontSize: ConfigScreenUtil.autoSize30)),
                                  ),
                                ],
                              ),
                              WidgetUtils.commonSizedBox(10, 0),
                              Row(
                                children: [
                                  WidgetUtils.onlyText(
                                      '20.000000 USDT',
                                      StyleUtils.getCommonTextStyle(
                                          color: MyColors.ziYellow,
                                          fontFamily: MyConfig.mMedium,
                                          fontSize: ConfigScreenUtil.autoSize30)),
                                  const Expanded(child: Text('')),
                                  WidgetUtils.onlyText(
                                      '￥200.00',
                                      StyleUtils.getCommonTextStyle(
                                          color: MyColors.g8,
                                          fontFamily: MyConfig.mMedium,
                                          fontSize: ConfigScreenUtil.autoSize30)),
                                  WidgetUtils.commonSizedBox(0, 5),
                                  WidgetUtils.showImages('assets/images/m_mm_xia.png', ScreenUtil().setHeight(24), ScreenUtil().setWidth(13)),
                                  WidgetUtils.commonSizedBox(0, 5),
                                  WidgetUtils.onlyText(
                                      '0.00',
                                      StyleUtils.getCommonTextStyle(
                                          color: MyColors.ziYellow,
                                          fontFamily: MyConfig.mMedium,
                                          fontSize: ConfigScreenUtil.autoSize30)),
                                  WidgetUtils.commonSizedBox(0, 5),
                                  GestureDetector(
                                    onTap: ((){

                                    }),
                                    child: WidgetUtils.onlyText(
                                        '购买',
                                        StyleUtils.getCommonTextStyle(
                                            color: MyColors.ziYellow,
                                            fontFamily: MyConfig.mMedium,
                                            fontSize: ConfigScreenUtil.autoSize30)),
                                  ),
                                ],
                              ),
                              WidgetUtils.commonSizedBox(10, 0),
                            ],
                          ),
                        ),
                        //购买USDT
                        //参考价格
                        Container(
                          height: ConfigScreenUtil.autoHeight280,
                          width: double.infinity,
                          color: MyColors.mm_bg,
                          margin: EdgeInsets.only(
                              top: ConfigScreenUtil.autoHeight20),
                          padding: EdgeInsets.fromLTRB(
                              ConfigScreenUtil.autoWidth30,
                              ConfigScreenUtil.autoWidth10,
                              ConfigScreenUtil.autoWidth30,
                              ConfigScreenUtil.autoWidth10),
                          child: Column(
                            children: [
                              WidgetUtils.commonSizedBox(8, 0),
                              Row(
                                children: [
                                  WidgetUtils.onlyText(
                                      '参考单价',
                                      StyleUtils.getCommonTextStyle(
                                          color: MyColors.ziYellow,
                                          fontFamily: MyConfig.mMedium,
                                          fontSize:
                                          ConfigScreenUtil.autoSize30)),
                                  const Expanded(child: Text('')),
                                  WidgetUtils.onlyText(
                                      '￥6.79/USDT',
                                      StyleUtils.getCommonTextStyle(
                                          color: MyColors.g8,
                                          fontFamily: MyConfig.mNormal,
                                          fontSize:
                                          ConfigScreenUtil.autoSize30)),
                                ],
                              ),
                              WidgetUtils.commonSizedBox(10, 0),
                              Row(
                                children: [
                                  WidgetUtils.onlyText(
                                      '预计获得',
                                      StyleUtils.getCommonTextStyle(
                                          color: MyColors.ziYellow,
                                          fontFamily: MyConfig.mMedium,
                                          fontSize:
                                          ConfigScreenUtil.autoSize30)),
                                  const Expanded(child: Text('')),
                                  WidgetUtils.onlyText(
                                      '28.000222 USDT',
                                      StyleUtils.getCommonTextStyle(
                                          color: MyColors.ziYellow,
                                          fontFamily: MyConfig.mNormal,
                                          fontSize:
                                          ConfigScreenUtil.autoSize30)),
                                ],
                              ),
                              const Expanded(child: Text('')),
                              //购买USDT
                              GestureDetector(
                                onTap: (() {
                                  // if (MyUtils.checkClick() && sum2 == 2) {}
                                  Navigator.pushNamed(context, 'GoumaiPage');
                                }),
                                child: Container(
                                  height: ScreenUtil().setHeight(96),
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  //边框设置
                                  decoration: BoxDecoration(
                                    //背景
                                    color: sum2 == 2
                                        ? MyColors.ziYellow
                                        : MyColors.ziYellowEnable,
                                    //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: Text(
                                    '购买USDT',
                                    style: StyleUtils.getCommonTextStyle(
                                        color: MyColors.loginZiBlack,
                                        fontSize: ConfigScreenUtil.autoSize30,
                                        fontFamily: MyConfig.mMedium),
                                  ),
                                ),
                              ),
                              const Expanded(child: Text('')),
                            ],
                          ),
                        ),
                        WidgetUtils.commonSizedBox(50, 0),
                      ],
                    )
                  : Column(
                      //出售页面
                      children: [
                        Container(
                          height: 1,
                          width: double.infinity,
                          color: MyColors.hx,
                        ),
                        //可出售数量
                        Container(
                          height: ConfigScreenUtil.autoHeight220,
                          width: double.infinity,
                          color: MyColors.mm_bg,
                          margin: EdgeInsets.only(
                              top: ConfigScreenUtil.autoHeight20),
                          padding: EdgeInsets.fromLTRB(
                              ConfigScreenUtil.autoWidth30,
                              ConfigScreenUtil.autoWidth10,
                              ConfigScreenUtil.autoWidth30,
                              ConfigScreenUtil.autoWidth10),
                          child: Column(
                            children: [
                              WidgetUtils.commonSizedBox(8, 0),
                              Row(
                                children: [
                                  WidgetUtils.showImages(
                                      'assets/images/m_mm_shutiao.png',
                                      ConfigScreenUtil.autoHeight30,
                                      ConfigScreenUtil.autoWidth6),
                                  WidgetUtils.commonSizedBox(0, 8),
                                  WidgetUtils.onlyText(
                                      '数量',
                                      StyleUtils.getCommonTextStyle(
                                          color: MyColors.ziYellow,
                                          fontFamily: MyConfig.mMedium,
                                          fontSize:
                                              ConfigScreenUtil.autoSize30)),
                                  const Expanded(child: Text('')),
                                  WidgetUtils.onlyText(
                                      '可用余额',
                                      StyleUtils.getCommonTextStyle(
                                          color: MyColors.ziYellow,
                                          fontFamily: MyConfig.mNormal,
                                          fontSize:
                                              ConfigScreenUtil.autoSize28)),
                                  WidgetUtils.commonSizedBox(0, 8),
                                  WidgetUtils.onlyText(
                                      '2.000000 USDT',
                                      StyleUtils.getCommonTextStyle(
                                          color: MyColors.ziYellow,
                                          fontFamily: MyConfig.mNormal,
                                          fontSize:
                                              ConfigScreenUtil.autoSize28)),
                                ],
                              ),
                              WidgetUtils.commonSizedBox(30, 0),
                              Row(
                                children: [
                                  WidgetUtils.showImages(
                                      'assets/images/m_mm_tt.png',
                                      ConfigScreenUtil.autoHeight36,
                                      ConfigScreenUtil.autoHeight36),
                                  WidgetUtils.commonSizedBox(0, 15),
                                  Expanded(
                                      child: WidgetUtils.commonTextField(
                                          _controller,
                                          "限额 16~15000 USDT",
                                          false,
                                          focusNode)),
                                  GestureDetector(
                                    onTap: (() {}),
                                    child: WidgetUtils.onlyText(
                                        '全部',
                                        StyleUtils.getCommonTextStyle(
                                            color: MyColors.ziYellow,
                                            fontFamily: MyConfig.mMedium,
                                            fontSize:
                                                ConfigScreenUtil.autoSize30)),
                                  ),
                                ],
                              ),
                              //横线
                              WidgetUtils.myLine(color: MyColors.g9),
                            ],
                          ),
                        ),
                        //选择收款方式
                        Container(
                          height: ConfigScreenUtil.autoHeight220,
                          width: double.infinity,
                          color: MyColors.mm_bg,
                          margin: EdgeInsets.only(
                              top: ConfigScreenUtil.autoHeight20),
                          padding: EdgeInsets.fromLTRB(
                              ConfigScreenUtil.autoWidth30,
                              ConfigScreenUtil.autoWidth10,
                              ConfigScreenUtil.autoWidth30,
                              ConfigScreenUtil.autoWidth10),
                          child: Column(
                            children: [
                              WidgetUtils.commonSizedBox(8, 0),
                              Row(
                                children: [
                                  WidgetUtils.showImages(
                                      'assets/images/m_mm_shutiao.png',
                                      ConfigScreenUtil.autoHeight30,
                                      ConfigScreenUtil.autoWidth6),
                                  WidgetUtils.commonSizedBox(0, 8),
                                  WidgetUtils.onlyText(
                                      '选择收款方式',
                                      StyleUtils.getCommonTextStyle(
                                          color: MyColors.ziYellow,
                                          fontFamily: MyConfig.mMedium,
                                          fontSize:
                                              ConfigScreenUtil.autoSize30)),
                                  const Expanded(child: Text('')),
                                ],
                              ),
                              WidgetUtils.commonSizedBox(20, 0),
                              GestureDetector(
                                onTap: (() {}),
                                child: Container(
                                  width: double.infinity,
                                  height: ConfigScreenUtil.autoHeight90,
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  //边框设置
                                  decoration: BoxDecoration(
                                    //背景
                                    color: MyColors.mm_bg,
                                    //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    border: Border.all(
                                        width: 1, color: MyColors.mm_xz),
                                  ),
                                  child: Row(
                                    children: [
                                      WidgetUtils.onlyText(
                                          '您没有收款方式，点击添加',
                                          StyleUtils.getCommonTextStyle(
                                              color: MyColors.mm_xz,
                                              fontSize:
                                                  ConfigScreenUtil.autoSize30)),
                                      const Expanded(child: Text('')),
                                      WidgetUtils.showImages(
                                          'assets/images/m_mm_you2.png',
                                          ConfigScreenUtil.autoHeight20,
                                          ConfigScreenUtil.autoHeight20),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        //参考价格
                        Container(
                          height: ConfigScreenUtil.autoHeight280,
                          width: double.infinity,
                          color: MyColors.mm_bg,
                          margin: EdgeInsets.only(
                              top: ConfigScreenUtil.autoHeight20),
                          padding: EdgeInsets.fromLTRB(
                              ConfigScreenUtil.autoWidth30,
                              ConfigScreenUtil.autoWidth10,
                              ConfigScreenUtil.autoWidth30,
                              ConfigScreenUtil.autoWidth10),
                          child: Column(
                            children: [
                              WidgetUtils.commonSizedBox(8, 0),
                              Row(
                                children: [
                                  WidgetUtils.onlyText(
                                      '参考价格',
                                      StyleUtils.getCommonTextStyle(
                                          color: MyColors.ziYellow,
                                          fontFamily: MyConfig.mMedium,
                                          fontSize:
                                              ConfigScreenUtil.autoSize30)),
                                  const Expanded(child: Text('')),
                                  WidgetUtils.onlyText(
                                      '￥6.79/USDT',
                                      StyleUtils.getCommonTextStyle(
                                          color: MyColors.g8,
                                          fontFamily: MyConfig.mNormal,
                                          fontSize:
                                              ConfigScreenUtil.autoSize30)),
                                ],
                              ),
                              WidgetUtils.commonSizedBox(10, 0),
                              Row(
                                children: [
                                  WidgetUtils.onlyText(
                                      '预计获得',
                                      StyleUtils.getCommonTextStyle(
                                          color: MyColors.ziYellow,
                                          fontFamily: MyConfig.mMedium,
                                          fontSize:
                                              ConfigScreenUtil.autoSize30)),
                                  const Expanded(child: Text('')),
                                  WidgetUtils.onlyText(
                                      '￥6.79',
                                      StyleUtils.getCommonTextStyle(
                                          color: MyColors.ziYellow,
                                          fontFamily: MyConfig.mNormal,
                                          fontSize:
                                              ConfigScreenUtil.autoSize30)),
                                ],
                              ),
                              const Expanded(child: Text('')),
                              //出售USDT
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
                                  decoration: BoxDecoration(
                                    //背景
                                    color: sum == 2
                                        ? MyColors.ziYellow
                                        : MyColors.ziYellowEnable,
                                    //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: Text(
                                    '出售USDT',
                                    style: StyleUtils.getCommonTextStyle(
                                        color: MyColors.loginZiBlack,
                                        fontSize: ConfigScreenUtil.autoSize30,
                                        fontFamily: MyConfig.mMedium),
                                  ),
                                ),
                              ),
                              const Expanded(child: Text('')),
                            ],
                          ),
                        )
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
