import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task/core/constants/app_assets.dart';
import 'package:task/core/constants/app_color.dart';
import 'package:task/core/constants/app_sizes.dart';

import '../constants/app_style.dart';

class CustomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: AppSizes.height65,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors().graye6Color,
            blurRadius: AppSizes.radius4,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(index: 0, icon: AppIcons.home, label: 'الرئيسية'),
              _buildNavItem(index: 1, icon: AppIcons.chat, label: 'المحادثة'),
              _buildNavItem(
                index: 2,
                icon: AppIcons.add_box,
                label: 'إضف إعلان',
              ),
              _buildNavItem(index: 3, icon: AppIcons.ad, label: 'إعلاناتي'),
              _buildNavItem(index: 4, icon: AppIcons.profile, label: 'حسابي'),
            ],
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            right: (screenWidth / 5) * widget.currentIndex,
            bottom: AppSizes.width8,
            child: SizedBox(
              width: screenWidth / 5,
              child: Center(
                child: Container(
                  width: AppSizes.width40,
                  height: AppSizes.height2,
                  decoration: BoxDecoration(
                    color: AppColors().niveColor,
                    borderRadius: BorderRadius.circular(AppSizes.radius4),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required String icon,
    required String label,
  }) {
    final isActive = widget.currentIndex == index;

    final color = index == 2
        ? AppColors().blueColor
        : isActive
        ? AppColors().niveColor
        : AppColors().gray8fColor;

    return Expanded(
      child: InkWell(
        onTap: () => widget.onTap(index),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: AppSizes.height5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                icon,
                color: color,
                width: AppSizes.width24,
                height: AppSizes.height24,
              ),
              SizedBox(height: AppSizes.height4),
              Text(
                label,
                style: AppStyles.text12.copyWith(
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
