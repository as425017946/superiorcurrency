import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../colors/my_colors.dart';
import '../../config/config_screen_util.dart';
import '../../config/my_config.dart';
import '../../utils/event_utils.dart';
import '../../utils/my_utils.dart';
import '../../utils/style_utils.dart';
import '../../utils/widget_utils.dart';

///买卖币组件
class CoinWidget{
  static Widget getTitleWidget(BuildContext context, bool isClick) {
    return Row(
      children: [
        GestureDetector(
          onTap: (() {
            MyUtils.hideKeyboard(context);
            Navigator.pop(context);
          }),
          child: Row(
            children: [
              WidgetUtils.commonSizedBox(0, ConfigScreenUtil.autoWidth35),
              WidgetUtils.showImages('assets/images/m_mm_t.png',
                  ConfigScreenUtil.autoHeight40, ConfigScreenUtil.autoHeight40),
              WidgetUtils.onlyText(
                  'USDT',
                  StyleUtils.getCommonTextStyle(
                      color: MyColors.g8,
                      fontSize: ConfigScreenUtil.autoSize30)),
              WidgetUtils.commonSizedBox(0, 5),
              WidgetUtils.showImages('assets/images/m_mm_you2.png',
                  ConfigScreenUtil.autoHeight20, ConfigScreenUtil.autoHeight20),
            ],
          ),
        ),
        const Expanded(child: Text('')),
        Container(
          //边框设置
          decoration: BoxDecoration(
            //背景
            color: MyColors.ziYellow,
            //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(width: 1, color: MyColors.ziYellow),
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: (() {
                  eventBus.fire(BiBack(isBack: true, index: 0));
                }),
                child: circularLeft(context, isClick),
              ),
              WidgetUtils.commonSizedBox(0, 15),
              GestureDetector(
                onTap: (() {
                  eventBus.fire(BiBack(isBack: true, index: 1));
                }),
                child: circularRight(context, !isClick),
              ),
            ],
          ),
        ),
        const Expanded(child: Text('')),
        GestureDetector(
          onTap: (() {
            eventBus.fire(OrderBack(index: 0));
          }),
          child: Text(
            "订单",
            style: StyleUtils.getCommonTextStyle(
                color: MyColors.ziYellow,
                fontFamily: MyConfig.mMedium,
                fontSize: ConfigScreenUtil.autoSize30),
          ),
        ),
        WidgetUtils.commonSizedBox(0, ConfigScreenUtil.autoWidth20),
        WidgetUtils.showImages('assets/images/m_mm_dian.png', ConfigScreenUtil.autoHeight10, ConfigScreenUtil.autoWidth40),
        WidgetUtils.commonSizedBox(0, ConfigScreenUtil.autoWidth20),

      ],
    );
  }


  ///自定义圆角背景框左侧
  static Widget circularLeft(BuildContext context, bool isClick) {
    return Container(
      width: ConfigScreenUtil.autoHeight140,
      height: ConfigScreenUtil.autoHeight60,
      alignment: Alignment.center,
      //边框设置
      decoration: BoxDecoration(
        //背景
        color: isClick ? MyColors.ziYellow : MyColors.bg,
        //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
      ),
      child: Text(
        '购买',
        style: TextStyle(fontSize: ConfigScreenUtil.autoSize32, color: isClick ?  MyColors.loginZiBlack : MyColors.ziYellow, fontFamily: MyConfig.mMedium),
      ),
    );
  }
  ///自定义圆角背景框右侧
  static Widget circularRight(BuildContext context, bool isClick) {
    return Container(
      width: ConfigScreenUtil.autoHeight140,
      height: ConfigScreenUtil.autoHeight60,
      alignment: Alignment.center,
      //边框设置
      decoration: BoxDecoration(
        //背景
        color: isClick ? MyColors.ziYellow : MyColors.bg,
        //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
        borderRadius: const BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
      ),
      child: Text(
        '出售',
        style: TextStyle(fontSize: ConfigScreenUtil.autoSize32, color: isClick ?  MyColors.loginZiBlack : MyColors.ziYellow, fontFamily: MyConfig.mMedium),
      ),
    );
  }

  static Widget commonContainer(bool isClick, String title, int height, int width) {
    return Container(
      height: ScreenUtil().setHeight(height),
      width: ScreenUtil().setWidth(width),
      alignment: Alignment.center,
      //边框设置
      decoration: BoxDecoration(
        //背景
        color: MyColors.mm_bg,
        //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(width: 1, color: isClick ? MyColors.ziYellow : MyColors.g8),
      ),
      child: Text(
        title,
        style: StyleUtils.getCommonTextStyle(
            color: isClick ? MyColors.ziYellow : MyColors.g8,
            fontSize: ConfigScreenUtil.autoSize30),
      ),
    );
  }
}