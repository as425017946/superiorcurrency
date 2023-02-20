import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:superiorcurrency/config/my_config.dart';
import 'package:superiorcurrency/utils/my_utils.dart';

import '../../colors/my_colors.dart';
import '../../config/config_screen_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/style_utils.dart';
import '../../utils/widget_utils.dart';

/// 转账页面
class ZhuanzhangPage extends StatefulWidget {
  const ZhuanzhangPage({Key? key}) : super(key: key);

  @override
  State<ZhuanzhangPage> createState() => _ZhuanzhangPageState();
}

class _ZhuanzhangPageState extends State<ZhuanzhangPage> {
  //判断点击了那个，默认选择第一个
  bool isClick = true ;
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _moneyController = TextEditingController();
  //是否可以点击提交按钮,0默认不可以提交
  int sum = 0;
  //焦点事件
  final FocusNode _focusNodeA = FocusNode();
  final FocusNode _focusNodeM = FocusNode();

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Color(0xFF232323), //状态栏背景颜色
        statusBarIconBrightness: Brightness.dark // dark:一般显示黑色   light：一般显示白色
    ));
    // TODO: implement initState
    super.initState();
//对应的TextField失去或者获取焦点都会回调此监听
    _focusNodeA.addListener(() {
      if (_focusNodeA.hasFocus) {
        //获取焦点
      } else {
        //失去焦点
        if (_addressController.text.isNotEmpty && _moneyController.text.isNotEmpty){
          setState(() {
            sum = 2;
          });
        }
        if (_addressController.text.isNotEmpty && _moneyController.text.isEmpty){
          setState(() {
            sum = 1;
          });
        }
        if (_addressController.text.isEmpty && _moneyController.text.isNotEmpty){
          setState(() {
            sum = 1;
          });
        }
        if (_addressController.text.isEmpty && _moneyController.text.isEmpty){
          setState(() {
            sum = 0;
          });
        }
      }
    });
    _focusNodeM.addListener(() {
      if (_focusNodeM.hasFocus) {
        //获取焦点
      } else {
        //失去焦点
        if (_addressController.text.isNotEmpty && _moneyController.text.isNotEmpty){
          setState(() {
            sum = 2;
          });
        }
        if (_addressController.text.isNotEmpty && _moneyController.text.isEmpty){
          setState(() {
            sum = 1;
          });
        }
        if (_addressController.text.isEmpty && _moneyController.text.isNotEmpty){
          setState(() {
            sum = 1;
          });
        }
        if (_addressController.text.isEmpty && _moneyController.text.isEmpty){
          setState(() {
            sum = 0;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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
            WidgetUtils.getTitleWidget('USDT转账', true, context, false, ''),
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
                        child: WidgetUtils.commonContainer(
                            isClick, 'TRC20', 48, 124),
                      ),
                      WidgetUtils.commonSizedBox(0, 15),
                      GestureDetector(
                        onTap: (() {
                          setState(() {
                            isClick = !isClick;
                          });
                        }),
                        child: WidgetUtils.commonContainer(
                            !isClick, 'ERC20', 48, 124),
                      ),
                    ],
                  ),
                  WidgetUtils.commonSizedBox(20, double.infinity),
                  //收款地址
                  WidgetUtils.onlyText(
                      '收款地址',
                      StyleUtils.getCommonTextStyle(
                          color: MyColors.g8,
                          fontSize: ConfigScreenUtil.autoSize32)),
                  WidgetUtils.commonSizedBox(10, double.infinity),
                  SizedBox(
                    height: ConfigScreenUtil.autoHeight80,
                    width: double.infinity,
                    child: Row(
                      children: [
                        WidgetUtils.showImages(
                            'assets/images/m_zz_fj.png',
                            ConfigScreenUtil.autoHeight50,
                            ConfigScreenUtil.autoHeight50),
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            width: double.infinity,
                            height: ConfigScreenUtil.autoHeight80,
                            child: WidgetUtils.commonTextField(
                                _addressController, '输入或长按粘贴地址', false, _focusNodeA),
                          ),
                        ),
                        GestureDetector(
                          onTap: ((){
                            //跳转到地址簿
                            Navigator.pushNamed(context, 'AddAddressPage');
                          }),
                          child:  WidgetUtils.showImages(
                              'assets/images/m_zz_dz.png',
                              ConfigScreenUtil.autoHeight50,
                              ConfigScreenUtil.autoHeight50),
                        ),
                        WidgetUtils.commonSizedBox(0, 10),
                        GestureDetector(
                          onTap: ((){

                          }),
                          child: WidgetUtils.showImages(
                              'assets/images/m_zz_saoyisao.png',
                              ConfigScreenUtil.autoHeight50,
                              ConfigScreenUtil.autoHeight50),
                        ),
                      ],
                    ),
                  ),
                  //横线
                  WidgetUtils.myLine(color: MyColors.g9),
                  WidgetUtils.commonSizedBox(30, double.infinity),
                  //转账金额
                  WidgetUtils.onlyText(
                      '转账金额',
                      StyleUtils.getCommonTextStyle(
                          color: MyColors.g8,
                          fontSize: ConfigScreenUtil.autoSize32)),
                  WidgetUtils.commonSizedBox(10, double.infinity),
                  SizedBox(
                    height: ConfigScreenUtil.autoHeight80,
                    width: double.infinity,
                    child: Row(
                      children: [
                        WidgetUtils.showImages(
                            'assets/images/m_zz_t.png',
                            ConfigScreenUtil.autoHeight40,
                            ConfigScreenUtil.autoHeight40),
                        WidgetUtils.commonSizedBox(0, 5),
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            width: double.infinity,
                            height: ConfigScreenUtil.autoHeight80,
                            child: WidgetUtils.commonTextFieldNumber(
                                controller: _moneyController,
                                hintText: '限额 10~40000USDT',
                            focusNode: _focusNodeM),
                          ),
                        ),
                        GestureDetector(
                          onTap: (() {}),
                          child: Text(
                            '全部',
                            style: StyleUtils.getCommonTextStyle(
                                color: MyColors.ziYellow,
                                fontSize: ConfigScreenUtil.autoSize30),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //横线
                  WidgetUtils.myLine(color: MyColors.g9),
                  WidgetUtils.onlyText(
                      '可转账金额：20.000000 USDT',
                      StyleUtils.getCommonTextStyle(
                          color: MyColors.g8,
                          fontSize: ConfigScreenUtil.autoSize26)),
                  //手续费
                  WidgetUtils.commonSizedBox(30, double.infinity),
                  WidgetUtils.onlyText(
                      '手续费',
                      StyleUtils.getCommonTextStyle(
                          color: MyColors.g8,
                          fontSize: ConfigScreenUtil.autoSize30)),
                  WidgetUtils.commonSizedBox(10, double.infinity),
                  SizedBox(
                    height: ConfigScreenUtil.autoHeight80,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            width: double.infinity,
                            height: ConfigScreenUtil.autoHeight80,
                            child: Text(
                              '100',
                              style: StyleUtils.getCommonTextStyle(
                                  color: MyColors.ziYellow,
                                  fontSize: ConfigScreenUtil.autoSize30),
                            ),
                          ),
                        ),
                        Text('USDT',
                            style: StyleUtils.getCommonTextStyle(
                                color: MyColors.g8,
                                fontSize: ConfigScreenUtil.autoSize30)),
                      ],
                    ),
                  ),
                  //横线
                  WidgetUtils.myLine(color: MyColors.g9),
                ],
              ),
            ),
            const Expanded(child: Text('')),
            //转账按钮
            Container(
              height: ConfigScreenUtil.autoHeight260,
              width: double.infinity,
              color: MyColors.zzbutton_bg,
              padding: EdgeInsets.only(
                  left: ConfigScreenUtil.autoWidth30,
                  right: ConfigScreenUtil.autoWidth30),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                          '实际到账',
                          style: StyleUtils.getCommonTextStyle(
                              color: MyColors.g8,
                              fontSize: ConfigScreenUtil.autoSize26,
                              fontFamily: MyConfig.mNormal),
                        )),
                        Text('-',
                            style: StyleUtils.getCommonTextStyle(
                                color: MyColors.g8,
                                fontSize: ConfigScreenUtil.autoSize26)),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (() {
                      if (MyUtils.checkClick() && sum == 2){

                      }
                    }),
                    child: Container(
                      height: ScreenUtil().setHeight(96),
                      width: double.infinity,
                      alignment: Alignment.center,
                      margin:
                          EdgeInsets.only(bottom: ScreenUtil().setHeight(53)),
                      //边框设置
                      decoration: BoxDecoration(
                        //背景
                        color: sum == 2 ? MyColors.ziYellow : MyColors.ziYellowEnable,
                        //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                        borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Text(
                        '转账',
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
