import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:superiorcurrency/colors/my_colors.dart';
import 'package:superiorcurrency/config/config_screen_util.dart';
import 'package:superiorcurrency/config/my_config.dart';
import 'package:superiorcurrency/pages/login/login_widget.dart';
import 'package:superiorcurrency/utils/event_utils.dart';
import 'package:superiorcurrency/utils/my_toast_utils.dart';
import 'package:superiorcurrency/utils/style_utils.dart';
import 'package:superiorcurrency/utils/widget_utils.dart';

///登录页面
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //isClick 账号和邮箱切换使用是否点击默认为true isHide是否隐藏密码
  bool isClick = true, isHide = true;
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _password = TextEditingController();
  //焦点事件
  final FocusNode _focusNodeU = FocusNode();
  final FocusNode _focusNodeP = FocusNode();

  //监听器
  var listen;
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Color(0xFF232323), //状态栏背景颜色
        statusBarIconBrightness: Brightness.dark // dark:一般显示黑色   light：一般显示白色
    ));
    // TODO: implement initState
    super.initState();
    listen = eventBus.on<HeadBack>().listen((event) {
      if (event.index == 1){
        MyToastUtils.showToastBottom('登录点击了注册按钮');
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    listen.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // 解决键盘顶起页面
      appBar: null,
      backgroundColor: MyColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            //头部
            WidgetUtils.commonSizedBox(10, double.infinity),
            WidgetUtils.getTitleWidget('登录', true, context, true, '注册'),
            WidgetUtils.commonSizedBox(10, double.infinity),
            //横线
            WidgetUtils.myLine(color: MyColors.loginHX, thickness: 0.5),
            //手机邮箱
            Container(
              height: ConfigScreenUtil.autoHeight70,
              width: ConfigScreenUtil.autoWidth380,
              margin: EdgeInsets.only(top: ConfigScreenUtil.autoHeight70),
              //边框设置
              decoration: BoxDecoration(
                //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                color: MyColors.ziYellow,
                border: Border.all(width: 1, color: MyColors.ziYellow),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (() {
                        setState(() {
                          isClick = true;
                          isHide = true;
                          _userName.text = "";
                          _password.text = "";
                        });
                      }),
                      child: LoginWidget.circularLeft(context, isClick),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (() {
                        setState(() {
                          isClick = false;
                          isHide = true;
                          _userName.text = "";
                          _password.text = "";
                        });
                      }),
                      child: LoginWidget.circularRight(context, !isClick),
                    ),
                  ),
                ],
              ),
            ),
            //输入信息
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                  left: ConfigScreenUtil.autoWidth30,
                  right: ConfigScreenUtil.autoWidth30,
                  top: ConfigScreenUtil.autoHeight50),
              child: Column(
                children: [
                  //账号或者邮箱登录
                  WidgetUtils.onlyText(
                      isClick ? '账号登录' : '邮箱登录',
                      StyleUtils.getCommonTextStyle(
                          color: MyColors.g8,
                          fontSize: ConfigScreenUtil.autoSize30)),
                  Container(
                    height: 50,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: WidgetUtils.commonTextField(
                        _userName, isClick ? '请输入账号' : '请输入邮箱', false, _focusNodeU),
                  ),
                  WidgetUtils.myLine(color: MyColors.g9),
                  WidgetUtils.commonSizedBox(30, double.infinity),
                  WidgetUtils.onlyText(
                      '密码',
                      StyleUtils.getCommonTextStyle(
                          color: MyColors.g8,
                          fontSize: ConfigScreenUtil.autoSize30)),
                  Container(
                    height: 50,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Expanded(
                            child: WidgetUtils.commonTextField(
                                _password, '请输入密码', isHide, _focusNodeP)),
                        GestureDetector(
                          onTap: (() {
                            setState(() {
                              isHide = !isHide;
                            });
                          }),
                          child: WidgetUtils.showImages(
                              isHide
                                  ? 'assets/images/m_see2.png'
                                  : 'assets/images/m_see1.png',
                              ConfigScreenUtil.autoHeight36,
                              ConfigScreenUtil.autoWidth40),
                        ),
                      ],
                    ),
                  ),
                  WidgetUtils.myLine(color: MyColors.g9),
                  WidgetUtils.commonSizedBox(30, double.infinity),
                  //登录按钮
                  Stack(
                    children: [
                      WidgetUtils.showImages('assets/images/m_login_btn.png',
                          ConfigScreenUtil.autoHeight90, double.infinity),
                      Container(
                        height: ConfigScreenUtil.autoHeight90,
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          '登录',
                          style: StyleUtils.getCommonTextStyle(
                              color: MyColors.loginZiBlack,
                              fontFamily: MyConfig.mMedium,
                              fontSize: ConfigScreenUtil.autoSize30),
                        ),
                      )
                    ],
                  ),
                  WidgetUtils.commonSizedBox(30, double.infinity),
                  //忘记密码
                  WidgetUtils.onlyTextCenter(
                      '忘记密码?',
                      StyleUtils.getCommonTextStyle(
                          color: MyColors.ziYellow,
                          fontFamily: MyConfig.mMedium,
                          fontSize: ConfigScreenUtil.autoSize24))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
