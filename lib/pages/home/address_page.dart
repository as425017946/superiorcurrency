import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../colors/my_colors.dart';
import '../../config/config_screen_util.dart';
import '../../config/my_config.dart';
import '../../utils/my_utils.dart';
import '../../utils/style_utils.dart';
import '../../utils/widget_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///收款地址
class AddressPage extends StatefulWidget {
  int type; //0 TRC20 1 ERC20 2 从我的添加地址页面进来
  AddressPage({Key? key, required this.type}) : super(key: key);

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  //是否可以点击提交按钮,0默认不可以提交
  int sum = 0;

  //判断点击了那个，默认选择第一个
  bool isClick = true;

  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _remarkController = TextEditingController();

  //焦点事件
  final FocusNode _focusNodeA = FocusNode();
  final FocusNode _focusNodeR = FocusNode();

  //是不是显示箭头
  bool isShow = false;

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
        if (_addressController.text.isNotEmpty &&
            _remarkController.text.isNotEmpty) {
          setState(() {
            sum = 2;
          });
        }
        if (_addressController.text.isNotEmpty &&
            _remarkController.text.isEmpty) {
          setState(() {
            sum = 1;
          });
        }
        if (_addressController.text.isEmpty &&
            _remarkController.text.isNotEmpty) {
          setState(() {
            sum = 1;
          });
        }
        if (_addressController.text.isEmpty && _remarkController.text.isEmpty) {
          setState(() {
            sum = 0;
          });
        }
      }
    });
    _focusNodeR.addListener(() {
      if (_focusNodeR.hasFocus) {
        //获取焦点
      } else {
        //失去焦点
        if (_addressController.text.isNotEmpty &&
            _remarkController.text.isNotEmpty) {
          setState(() {
            sum = 2;
          });
        }
        if (_addressController.text.isNotEmpty &&
            _remarkController.text.isEmpty) {
          setState(() {
            sum = 1;
          });
        }
        if (_addressController.text.isEmpty &&
            _remarkController.text.isNotEmpty) {
          setState(() {
            sum = 1;
          });
        }
        if (_addressController.text.isEmpty && _remarkController.text.isEmpty) {
          setState(() {
            sum = 0;
          });
        }
      }
    });

    setState(() {
      if (widget.type == 2){
        isShow = true;
      }else {
        isShow = false;
      }
    });
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
            WidgetUtils.getTitleWidget('添加地址', true, context, false, ''),
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
                      '币种',
                      StyleUtils.getCommonTextStyle(
                          color: MyColors.g8,
                          fontSize: ConfigScreenUtil.autoSize32)),
                  WidgetUtils.commonSizedBox(20, double.infinity),
                  //选择币种
                  GestureDetector(
                    onTap: (() {
                      // Navigator.pushNamed(context, 'ChooseTypePage');
                      showModalBottomSheet(
                        barrierColor: Colors.black54,
                        context: context,
                        builder: (ctx) {
                          return Container(
                            color: MyColors.bg,
                            height: ConfigScreenUtil.autoHeight300,
                            width: double.infinity,
                            child: Column(
                              children: [
                                Expanded(
                                    child: GestureDetector(
                                  onTap: (() {
                                    setState(() {
                                      widget.type = 0;
                                      Navigator.pop(context);
                                    });
                                  }),
                                  child: WidgetUtils.onlyTextCenter(
                                      'USDT-TRC20',
                                      StyleUtils.getCommonTextStyle(
                                        color: MyColors.ziYellow,
                                        fontSize: ConfigScreenUtil.autoSize32,
                                      )),
                                )),
                                //横线
                                WidgetUtils.myLine(
                                    color: MyColors.loginHX, thickness: 0.5),
                                Expanded(
                                    child: GestureDetector(
                                      onTap: (() {
                                        setState(() {
                                          widget.type = 1;
                                          Navigator.pop(context);
                                        });
                                      }),
                                      child: WidgetUtils.onlyTextCenter(
                                          'USDT-ERC20',
                                          StyleUtils.getCommonTextStyle(
                                            color: MyColors.ziYellow,
                                            fontSize: ConfigScreenUtil.autoSize32,
                                          )),
                                    )),
                                //横线
                                WidgetUtils.myLine(
                                    color: MyColors.loginHX, thickness: 0.5),
                                Expanded(
                                    child: GestureDetector(
                                      onTap: (() {
                                        Navigator.pop(context);
                                      }),
                                      child: WidgetUtils.onlyTextCenter(
                                          '取消',
                                          StyleUtils.getCommonTextStyle(
                                            color: MyColors.ziYellow,
                                            fontSize: ConfigScreenUtil.autoSize32,
                                          )),
                                    )),
                              ],
                            ),
                          );
                        },
                      );
                    }),
                    child: Row(
                      children: [
                        WidgetUtils.showImages(
                            widget.type == 1
                                ? 'assets/images/m_add_erc.png'
                                : 'assets/images/m_add_trc.png',
                            ConfigScreenUtil.autoHeight40,
                            ConfigScreenUtil.autoHeight40),
                        WidgetUtils.commonSizedBox(0, 10),
                        Expanded(
                            child: WidgetUtils.onlyText(
                                widget.type == 1 ? 'USDT-ERC20' : 'USDT-TRC20',
                                StyleUtils.getCommonTextStyle(
                                    color: MyColors.ziYellow,
                                    fontSize: ConfigScreenUtil.autoSize30))),
                        isShow
                            ? WidgetUtils.showImages(
                                'assets/images/m_add_jiantou.png',
                                ScreenUtil().setHeight(32),
                                ScreenUtil().setHeight(32))
                            : const Text(''),
                      ],
                    ),
                  ),
                  WidgetUtils.commonSizedBox(10, double.infinity),
                  //横线
                  WidgetUtils.myLine(color: MyColors.g9),
                  WidgetUtils.commonSizedBox(20, double.infinity),
                  //地址
                  WidgetUtils.onlyText(
                      '地址',
                      StyleUtils.getCommonTextStyle(
                          color: MyColors.g8,
                          fontSize: ConfigScreenUtil.autoSize32)),
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
                            child: WidgetUtils.commonTextField(
                                _addressController,
                                widget.type == 1
                                    ? '请输入USDT-ERC20地址'
                                    : '请输入USDT-TRC20地址',
                                false,
                                _focusNodeA),
                          ),
                        ),
                        WidgetUtils.commonSizedBox(0, 10),
                        GestureDetector(
                          onTap: (() {}),
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
                  //备注
                  WidgetUtils.onlyText(
                      '备注',
                      StyleUtils.getCommonTextStyle(
                          color: MyColors.g8,
                          fontSize: ConfigScreenUtil.autoSize32)),
                  WidgetUtils.commonSizedBox(10, double.infinity),
                  SizedBox(
                    height: ConfigScreenUtil.autoHeight80,
                    width: double.infinity,
                    child: WidgetUtils.commonTextField(
                        _remarkController, '请输入地址备注', false, _focusNodeR),
                  ),
                  //横线
                  WidgetUtils.myLine(color: MyColors.g9),
                  WidgetUtils.commonSizedBox(30, double.infinity),
                  //确认按钮
                  GestureDetector(
                    onTap: (() {
                      if (MyUtils.checkClick() && sum == 2) {}
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
                        color: sum == 2
                            ? MyColors.ziYellow
                            : MyColors.ziYellowEnable,
                        //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Text(
                        '确认',
                        style: StyleUtils.getCommonTextStyle(
                            color: MyColors.loginZiBlack,
                            fontSize: ConfigScreenUtil.autoSize30,
                            fontFamily: MyConfig.mMedium),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Expanded(child: Text('')),
            //没有设置过交易密码的提示
            Container(
              height: ConfigScreenUtil.autoHeight260,
              width: double.infinity,
              color: MyColors.zzbutton_bg,
              padding: EdgeInsets.only(
                  left: ConfigScreenUtil.autoWidth30,
                  right: ConfigScreenUtil.autoWidth30),
              child: Column(
                children: [
                  const Expanded(child: Text('')),
                  WidgetUtils.onlyText(
                      '提示',
                      StyleUtils.getCommonTextStyle(
                          color: MyColors.g8,
                          fontSize: ConfigScreenUtil.autoSize32,
                          fontFamily: MyConfig.mNormal)),
                  const Expanded(child: Text('')),
                  WidgetUtils.onlyText(
                      '您还未设置交易密码',
                      StyleUtils.getCommonTextStyle(
                          color: MyColors.ziYellow,
                          fontSize: ConfigScreenUtil.autoSize32,
                          fontFamily: MyConfig.mMedium)),
                  const Expanded(child: Text('')),
                  //取消和区设置按钮
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: (() {
                            if (MyUtils.checkClick() && sum == 2) {
                              Navigator.pop(context);
                            }
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
                      WidgetUtils.commonSizedBox(
                          0, ConfigScreenUtil.autoWidth40),
                      Expanded(
                        child: GestureDetector(
                          onTap: (() {
                            if (MyUtils.checkClick() && sum == 2) {}
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
                              '去设置',
                              style: StyleUtils.getCommonTextStyle(
                                  color: MyColors.loginZiBlack,
                                  fontSize: ConfigScreenUtil.autoSize30,
                                  fontFamily: MyConfig.mMedium),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Expanded(child: Text('')),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
