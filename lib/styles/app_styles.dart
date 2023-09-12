import 'package:flutter/material.dart';

class AppStyles {
  // Fonts
  static const String primaryFont = 'Roboto';

  // Colors
  static const Color primaryGreenColor = Color(0xFF2ECC71);
  static const Color primaryBlackColor = Color(0xFF000000);

  // Text Styles
  static const TextStyle receiptLabelTextStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    color: AppStyles.primaryBlackColor,
  );

  static const TextStyle totalCookingTimeTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppStyles.primaryGreenColor,
  );
}
