import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task/core/constants/app_assets.dart';
import 'package:task/core/constants/app_color.dart';
import 'package:task/core/constants/app_sizes.dart';
import 'package:task/core/constants/app_style.dart';
import 'package:task/screens/main_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<String> selectedPackages = [];

  void togglePackage(String packageName) {
    setState(() {
      if (selectedPackages.contains(packageName)) {
        selectedPackages.remove(packageName);
      } else {
        selectedPackages.add(packageName);
      }
    });
  }

  bool isSelected(String packageName) => selectedPackages.contains(packageName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('أختر الباقات اللى تناسبك', style: AppStyles.text24),
        leading: IconButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MainScreen()),
          ),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: AppSizes.radius20,
          ),
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppSizes.padding8),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: AppSizes.width20),
                  child: Text(
                    'أختار من باقات التمييز بل أسفل اللى تناسب أحتياجاتك',
                    style: AppStyles.text14.copyWith(
                      color: AppColors().grayColor,
                    ),
                  ),
                ),
                SizedBox(height: AppSizes.height10),
                _buildPackageCard(
                  packageName: 'أساسية',
                  height: AppSizes.height100,
                  features: [
                    _buildFeatureRow(AppIcons.time, "صلاحية الأعلان 30 يوم"),
                  ],
                ),
                SizedBox(height: AppSizes.height10),

                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    _buildPackageCard(
                      packageName: 'أكسترا',
                      height: AppSizes.height180,
                      features: [
                        _buildFeatureRow(
                          AppIcons.time,
                          "صلاحية الإعلان 30 يوم",
                        ),
                        SizedBox(height: AppSizes.height8),
                        _buildFeatureRow(
                          AppIcons.plane,
                          "رفع لأعلى القائمة كل 3 أيام",
                        ),
                        SizedBox(height: AppSizes.height8),
                        _buildFeatureWithSubtext(
                          AppIcons.pin,
                          "تثبيت في مقاول صحي",
                          "( خلال الـ48 ساعة القادمة )",
                        ),
                      ],
                      multiplier: AppIcons.seven,
                      multiplierTopPadding: AppSizes.height15,
                    ),
                  ],
                ),
                SizedBox(height: AppSizes.height10),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    _buildPackageCard(
                      packageName: 'بلس',
                      height: AppSizes.height340,
                      features: [
                        _buildFeatureRow(
                          AppIcons.time,
                          "صلاحية الإعلان 30 يوم",
                        ),
                        SizedBox(height: AppSizes.height8),
                        _buildFeatureRow(
                          AppIcons.plane,
                          "رفع لأعلى القائمة كل 3 أيام",
                        ),
                        SizedBox(height: AppSizes.height8),
                        _buildFeatureWithSubtext(
                          AppIcons.pin,
                          "تثبيت في مقاول صحي",
                          "( خلال الـ48 ساعة القادمة )",
                        ),
                        SizedBox(height: AppSizes.height8),
                        _buildFeatureRow(
                          AppIcons.earth,
                          "ظهور فى كل محافظات مصر",
                        ),
                        SizedBox(height: AppSizes.height8),
                        _buildFeatureRow(AppIcons.star, "أعلان مميز"),
                        SizedBox(height: AppSizes.height8),
                        _buildFeatureWithMultiline(AppIcons.pin, [
                          "تثبيت فى مقاول صحى فى",
                          "الجهراء",
                        ]),
                        SizedBox(height: AppSizes.height8),
                        _buildFeatureWithSubtext(
                          AppIcons.pin,
                          "تثبيت في مقاول صحي",
                          "( خلال الـ48 ساعة القادمة )",
                        ),
                      ],
                      multiplier: AppIcons.eighteen,
                      multiplierTopPadding: AppSizes.height90,
                    ),
                  ],
                ),
                SizedBox(height: AppSizes.height10),
                _buildPackageCard(
                  packageName: 'سوبر',
                  height: AppSizes.height340,
                  features: [
                    _buildFeatureRow(AppIcons.time, "صلاحية الإعلان 30 يوم"),
                    SizedBox(height: AppSizes.height8),
                    _buildFeatureRow(
                      AppIcons.plane,
                      "رفع لأعلى القائمة كل 3 أيام",
                    ),
                    SizedBox(height: AppSizes.height8),
                    _buildFeatureWithSubtext(
                      AppIcons.pin,
                      "تثبيت في مقاول صحي",
                      "( خلال الـ48 ساعة القادمة )",
                    ),
                    SizedBox(height: AppSizes.height8),
                    _buildFeatureRow(AppIcons.earth, "ظهور فى كل محافظات مصر"),
                    SizedBox(height: AppSizes.height8),
                    _buildFeatureRow(AppIcons.star, "أعلان مميز"),
                    SizedBox(height: AppSizes.height8),
                    _buildFeatureWithMultiline(AppIcons.pin, [
                      "تثبيت فى مقاول صحى فى",
                      "الجهراء",
                    ]),
                    SizedBox(height: AppSizes.height8),
                    _buildFeatureWithSubtext(
                      AppIcons.pin,
                      "تثبيت في مقاول صحي",
                      "( خلال الـ48 ساعة القادمة )",
                    ),
                  ],
                  multiplier: AppIcons.twentyfour,
                  multiplierTopPadding: AppSizes.height90,
                ),
                SizedBox(height: AppSizes.height30),
                Container(
                  width: AppSizes.width328,
                  height: AppSizes.height80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSizes.radius10),
                    color: AppColors().grayf7Color,
                    border: Border.all(
                      color: AppColors().graye6Color,
                      width: AppSizes.width1,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(AppSizes.padding8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("باقات مخصصة لك", style: AppStyles.text14),
                        Text(
                          "تواصل معنا لأختيار الباقة المناسبة لك",
                          style: AppStyles.text12,
                        ),
                        Text(
                          "فريق المبيعات",
                          style: AppStyles.text16.copyWith(
                            color: AppColors().blueColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: AppSizes.height200),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors().blueColor,
                      minimumSize: Size(AppSizes.width328, AppSizes.height45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSizes.radius32),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "التالى",
                          style: AppStyles.text16.copyWith(
                            color: AppColors().whiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: AppColors().whiteColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPackageCard({
    required String packageName,
    required double height,
    required List<Widget> features,
    String? multiplier,
    double? multiplierTopPadding,
  }) {
    bool selected = isSelected(packageName);

    return Container(
      height: height,
      width: AppSizes.width328,
      decoration: BoxDecoration(
        color: AppColors().transparent,
        borderRadius: BorderRadius.circular(AppSizes.radius8),
        border: Border.all(
          color: AppColors().graye6Color,
          width: AppSizes.width1,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => togglePackage(packageName),
                icon: Icon(
                  selected ? Icons.check_box : Icons.check_box_outline_blank,
                  color: selected ? AppColors().bluef2Color : Colors.grey,
                ),
              ),
              Text(
                packageName,
                style: AppStyles.text16.copyWith(
                  fontWeight: FontWeight.bold,
                  color: selected
                      ? AppColors().bluef2Color
                      : AppColors().blackColor,
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.all(AppSizes.padding8),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Text(
                      '3,000ج.م',
                      style: AppStyles.text16.copyWith(
                        color: AppColors().orangColor,
                        fontWeight: FontWeight.bold,
                        height: AppSizes.height1,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        width: AppSizes.width45,
                        height: AppSizes.height3,
                        color: AppColors().orangColor,
                      ),
                    ),
                    Positioned(
                      right: AppSizes.width50,
                      bottom: 0,
                      child: Container(
                        width: AppSizes.width10,
                        height: AppSizes.height3,
                        color: AppColors().orangColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(color: AppColors().graye6Color, thickness: 1),
          Padding(
            padding: EdgeInsets.all(AppSizes.padding8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: features,
                  ),
                ),
                if (multiplier != null) ...[
                  SizedBox(width: AppSizes.width12),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: multiplierTopPadding ?? 0),
                      SvgPicture.asset(multiplier),
                      SizedBox(height: AppSizes.height4),
                      Text(
                        'ضعف عدد\nالمشاهدات',
                        textAlign: TextAlign.center,
                        style: AppStyles.text14.copyWith(
                          color: AppColors().blackColor,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors().blackColor,
                          decorationStyle: TextDecorationStyle.solid,
                          decorationThickness: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureRow(String iconPath, String text) {
    return Row(
      children: [
        SvgPicture.asset(
          iconPath,
          width: AppSizes.width24,
          height: AppSizes.height24,
        ),
        SizedBox(height: AppSizes.height8),
        Text(
          text,
          style: AppStyles.text14.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget _buildFeatureWithSubtext(
    String iconPath,
    String mainText,
    String subText,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          iconPath,
          width: AppSizes.width24,
          height: AppSizes.height24,
        ),
        SizedBox(height: AppSizes.width8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mainText,
              style: AppStyles.text14.copyWith(fontWeight: FontWeight.w600),
            ),
            Text(
              subText,
              style: AppStyles.text14.copyWith(
                color: AppColors().redColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFeatureWithMultiline(String iconPath, List<String> lines) {
    return Row(
      children: [
        SvgPicture.asset(iconPath),
        SizedBox(height: AppSizes.width10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: lines
              .map(
                (line) => Text(
                  line,
                  style: AppStyles.text14.copyWith(fontWeight: FontWeight.w600),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
