import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import 'app_text.dart';

class MainButton extends StatelessWidget {
  final bool isMain;
  final String title;
  final VoidCallback onTap;
  final double paddingHorizontal;
  final double paddingVertical;
  final Color? color;
  final bool enable;
final Color? textColor;
  const MainButton(

      {
        this.textColor,
        this.enable = false,
      this.color = Colors.transparent,
      this.paddingHorizontal = 24,
      this.paddingVertical = 16,
      this.isMain = false,
      this.title = 'OK',
      required this.onTap,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: AppColors.green2,
      borderRadius: BorderRadius.all(Radius.circular(8)),
      onTap: enable ? () {} : onTap,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: enable ? AppColors.green2 : AppColors.primaryColor,
        ),
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 56,
          decoration: isMain
              ? BoxDecoration(
                  color:AppColors.primaryColor
          ,borderRadius: BorderRadius.all(Radius.circular(8)),
          )
              : BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  border: Border.all(
                    color: AppColors.primaryColor,
                  ),
                  color: color),
          child: AppText(
            title,
            size: 17,
            color: textColor ?? Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
