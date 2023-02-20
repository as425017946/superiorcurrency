import 'package:flutter/material.dart';

import '../../colors/my_colors.dart';
import '../../config/config_screen_util.dart';
import '../../config/my_config.dart';
import '../../utils/event_utils.dart';
import '../../utils/my_utils.dart';
import '../../utils/style_utils.dart';
import '../../utils/widget_utils.dart';

class OrderWidget{

  static Widget getTitleWidget(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: (() {
            MyUtils.hideKeyboard(context);
            Navigator.pop(context);
          }),
          child: Row(
            children: [
              WidgetUtils.commonSizedBox(0, ConfigScreenUtil.autoWidth50),
              WidgetUtils.showImages('assets/images/m_back.png',
                  ConfigScreenUtil.autoHeight39, ConfigScreenUtil.autoWidth21)
            ],
          ),
        ),
        Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (() {

                  }),
                  child: Text('交易订单',style: StyleUtils.getCommonTextStyle(
                      color: MyColors.ziYellow,
                      fontFamily: MyConfig.mMedium,
                      fontSize: ConfigScreenUtil.autoSize30),),
                ),
                WidgetUtils.commonSizedBox(0, 20),
                GestureDetector(
                  onTap: (() {

                  }),
                  child: Text('出售挂单',style: StyleUtils.getCommonTextStyle(
                      color: MyColors.g8,
                      fontFamily: MyConfig.mMedium,
                      fontSize: ConfigScreenUtil.autoSize30),),
                )
                ,
              ],
            )),
        GestureDetector(
          onTap: (() {

          }),
          child: Text(
            '',
            style: StyleUtils.getCommonTextStyle(
                color: MyColors.ziYellow,
                fontFamily: MyConfig.mMedium,
                fontSize: ConfigScreenUtil.autoSize30),
          ),
        ),
        WidgetUtils.commonSizedBox(0, ConfigScreenUtil.autoWidth45),
      ],
    );
  }
}
