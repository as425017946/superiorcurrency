import 'package:flutter/material.dart';
import 'package:superiorcurrency/utils/widget_utils.dart';

import '../../colors/my_colors.dart';
import '../../config/config_screen_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginWidget{
  ///自定义圆角背景框左侧
  static Widget circularLeft(BuildContext context, bool isClick) {
    return Container(
      width: double.infinity,
      height: ConfigScreenUtil.autoHeight70,
      alignment: Alignment.center,
      //边框设置
      decoration: BoxDecoration(
        //背景
        color: isClick ? MyColors.ziYellow : MyColors.bg,
        //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          WidgetUtils.showImages(isClick ? 'assets/images/m_phone2.png'  : 'assets/images/m_phone1.png',  ScreenUtil().setHeight(21), ScreenUtil().setHeight(26)),
          WidgetUtils.commonSizedBox(0, 8),
          Text(
            '账户',
            style: TextStyle(fontSize: ConfigScreenUtil.autoSize24, color: isClick ?  MyColors.loginZiBlack : MyColors.ziYellow),
          ),
        ],
      ),
    );
  }
  ///自定义圆角背景框右侧
  static Widget circularRight(BuildContext context, bool isClick) {
    return Container(
      width: double.infinity,
      height: ConfigScreenUtil.autoHeight70,
      alignment: Alignment.center,
      //边框设置
      decoration: BoxDecoration(
        //背景
        color: isClick ? MyColors.ziYellow : MyColors.bg,
        //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
        borderRadius: const BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          WidgetUtils.showImages(isClick ? 'assets/images/m_email2.png'  : 'assets/images/m_email1.png',  ScreenUtil().setHeight(21), ScreenUtil().setHeight(26)),
          WidgetUtils.commonSizedBox(0, 8),
          Text(
            '邮箱',
            style: TextStyle(fontSize: ConfigScreenUtil.autoSize24, color: isClick ?  MyColors.loginZiBlack : MyColors.ziYellow),
          ),
        ],
      ),
    );
  }
}