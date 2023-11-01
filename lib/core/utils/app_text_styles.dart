import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_finance/core/utils/app_colors.dart';

class AppTextStyles{
  AppTextStyles._();

  static final TextStyle _style =
  GoogleFonts.roboto().copyWith(fontSize: 14, color: AppColors.black);

  static TextStyle style400 = _style.copyWith(fontWeight: FontWeight.w400);

  static TextStyle style500 = _style.copyWith(fontWeight: FontWeight.w500);

  static TextStyle style600 = _style.copyWith(fontWeight: FontWeight.w600,fontSize: 16);

  static TextStyle style700 = _style.copyWith(fontWeight: FontWeight.w700,fontSize: 24);

  static TextStyle btnTS = _style.copyWith(fontSize: 17, color: AppColors.white ,fontWeight: FontWeight.w700);

}