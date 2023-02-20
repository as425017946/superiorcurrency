import 'package:flutter/material.dart';

import '../../colors/my_colors.dart';
import '../../config/config_screen_util.dart';
import '../../utils/style_utils.dart';
import '../../utils/widget_utils.dart';

///USDT页面
class USDTPage extends StatefulWidget {
  const USDTPage({Key? key}) : super(key: key);

  @override
  State<USDTPage> createState() => _USDTPageState();
}

class _USDTPageState extends State<USDTPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            WidgetUtils.commonSizedBox(10, double.infinity),
            WidgetUtils.getTitleWidget('USDT', true, context, false, ''),
            WidgetUtils.commonSizedBox(10, double.infinity),
            //横线
            Container(
              width: double.infinity,
              height: 0.5,
              color: MyColors.loginHX,
            ),
            Container(
              width: double.infinity,
              height: ConfigScreenUtil.autoHeight390,
              padding: EdgeInsets.only(
                  left: ConfigScreenUtil.autoWidth30,
                  right: ConfigScreenUtil.autoWidth30,
                  top: ConfigScreenUtil.autoHeight20),
              color: MyColors.mm_bg,
              child: Column(
                children: [
                  WidgetUtils.onlyText(
                      '总额',
                      StyleUtils.getCommonTextStyle(
                          color: MyColors.g8,
                          fontSize: ConfigScreenUtil.autoSize32)),
                  WidgetUtils.commonSizedBox(15, double.infinity),
                  WidgetUtils.onlyText(
                      '20.000000',
                      StyleUtils.getCommonTextStyle(
                          color: MyColors.ziYellow,
                          fontSize: ConfigScreenUtil.autoSize60)),
                  WidgetUtils.commonSizedBox(10, double.infinity),
                  Row(
                    children: [
                      WidgetUtils.showImages(
                          'assets/images/m_usdt_dengyu.png',
                          ConfigScreenUtil.autoHeight25,
                          ConfigScreenUtil.autoHeight25),
                      WidgetUtils.showImages(
                          'assets/images/m_usdt_qian.png',
                          ConfigScreenUtil.autoHeight33,
                          ConfigScreenUtil.autoHeight25),
                      WidgetUtils.onlyText(
                          '100',
                          StyleUtils.getCommonTextStyle(
                              color: MyColors.ziYellow,
                              fontSize: ConfigScreenUtil.autoSize36)),
                    ],
                  ),
                  WidgetUtils.commonSizedBox(15, double.infinity),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: ConfigScreenUtil.autoHeight116,
                          width: double.infinity,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(ConfigScreenUtil.autoWidth20),
                          //边框设置
                          decoration: const BoxDecoration(
                              //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                              color: MyColors.gm_bg),
                          child: Column(
                            children: [
                              WidgetUtils.onlyText(
                                  '可用余额',
                                  StyleUtils.getCommonTextStyle(
                                      color: MyColors.g8,
                                      fontSize: ConfigScreenUtil.autoSize26)),
                              const Expanded(child: Text('')),
                              WidgetUtils.onlyText(
                                  '20.000000',
                                  StyleUtils.getCommonTextStyle(
                                      color: MyColors.ziYellow,
                                      fontSize: ConfigScreenUtil.autoSize30)),
                            ],
                          ),
                        ),
                      ),
                      WidgetUtils.commonSizedBox(0, 20),
                      Expanded(
                        child: Container(
                          height: ConfigScreenUtil.autoHeight116,
                          width: double.infinity,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(ConfigScreenUtil.autoWidth20),
                          //边框设置
                          decoration: const BoxDecoration(
                              //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                              color: MyColors.gm_bg),
                          child: Column(
                            children: [
                              WidgetUtils.onlyText(
                                  '暂不可用余额 >',
                                  StyleUtils.getCommonTextStyle(
                                      color: MyColors.g8,
                                      fontSize: ConfigScreenUtil.autoSize26)),
                              const Expanded(child: Text('')),
                              WidgetUtils.onlyText(
                                  '20.000000',
                                  StyleUtils.getCommonTextStyle(
                                      color: MyColors.ziYellow,
                                      fontSize: ConfigScreenUtil.autoSize30)),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
                child: Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: WidgetUtils.onlyText(
                            '财务记录',
                            StyleUtils.getCommonTextStyle(
                                color: MyColors.ziYellow,
                                fontSize: ConfigScreenUtil.autoSize40)),
                      ),
                      WidgetUtils.showImages(
                          'assets/images/m_usdt_all.png',
                          ConfigScreenUtil.autoHeight39,
                          ConfigScreenUtil.autoHeight39),
                      WidgetUtils.onlyText(
                          '全部',
                          StyleUtils.getCommonTextStyle(
                              color: MyColors.ziYellow,
                              fontSize: ConfigScreenUtil.autoSize36)),
                    ],
                  ),


                ],
              ),
            )),
            Container(
              width: double.infinity,
              height: ConfigScreenUtil.autoHeight260,
              padding: EdgeInsets.only(
                  left: ConfigScreenUtil.autoWidth30,
                  right: ConfigScreenUtil.autoWidth30,
                  top: ConfigScreenUtil.autoHeight20),
              color: MyColors.mm_bg,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: ConfigScreenUtil.autoHeight100,
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(ConfigScreenUtil.autoWidth20),
                      //边框设置
                      decoration: const BoxDecoration(
                          //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          color: MyColors.usdt_yellow),
                      child: Text(
                        '收款',
                        style: StyleUtils.getCommonTextStyle(
                            color: Colors.white,
                            fontSize: ConfigScreenUtil.autoSize30),
                      ),
                    ),
                  ),
                  WidgetUtils.commonSizedBox(0, 15),
                  Expanded(
                    child: Container(
                      height: ConfigScreenUtil.autoHeight100,
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(ConfigScreenUtil.autoWidth20),
                      //边框设置
                      decoration: const BoxDecoration(
                          //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          color: MyColors.usdt_red),
                      child: Text(
                        '转账',
                        style: StyleUtils.getCommonTextStyle(
                            color: Colors.white,
                            fontSize: ConfigScreenUtil.autoSize30),
                      ),
                    ),
                  ),
                  WidgetUtils.commonSizedBox(0, 20),
                  Expanded(
                    child: Container(
                      height: ConfigScreenUtil.autoHeight100,
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(ConfigScreenUtil.autoWidth20),
                      //边框设置
                      decoration: const BoxDecoration(
                          //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          color: MyColors.usdt_blue),
                      child: Text(
                        '去交易',
                        style: StyleUtils.getCommonTextStyle(
                            color: Colors.white,
                            fontSize: ConfigScreenUtil.autoSize30),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
