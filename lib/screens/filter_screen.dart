import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task/core/constants/app_assets.dart';
import 'package:task/core/constants/app_color.dart';
import 'package:task/core/constants/app_sizes.dart';
import 'package:task/core/constants/app_style.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String selectedType = "الكل";
  String selectedRooms = "5 غرف+";
  String selectedPayment = "كاش";
  String selectedStatus = "جاهز";

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          title: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: IconButton( onPressed: () {
                  Navigator.pop(context);
                }, icon: Icon(Icons.close_rounded, color: AppColors().blackColor),),
              ),
              Text("فلترة", style: AppStyles.text24),
              const Spacer(),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "رجوع للأفتراضى",
                  style: AppStyles.text16.copyWith(
                    color: AppColors().blueColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: AppSizes.width10),
            ],
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(AppSizes.padding8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "الفئة",
                style: AppStyles.text16.copyWith(
                  color: AppColors().gray8fColor,
                ),
              ),
              SizedBox(height: AppSizes.height12),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: SvgPicture.asset(AppIcons.pay),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "عقارات",
                      style: AppStyles.text14.copyWith(
                        color: AppColors().blackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "فلل للبيع",
                      style: AppStyles.text12.copyWith(
                        color: AppColors().gray8fColor,
                      ),
                    ),
                  ],
                ),
                trailing: Text(
                  "تغيير",
                  style: AppStyles.text14.copyWith(
                    color: AppColors().bluef2Color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(color: AppColors().graye6Color, thickness: 1),
              SizedBox(height: AppSizes.height5),
              ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "الموقع",
                      style: AppStyles.text14.copyWith(
                        color: AppColors().blackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "مصر",
                      style: AppStyles.text12.copyWith(
                        color: AppColors().gray8fColor,
                      ),
                    ),
                  ],
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: AppColors().blackColor,
                ),
                leading: Icon(
                  Icons.location_on_outlined,
                  color: AppColors().blackColor,
                ),
              ),
              SizedBox(height: AppSizes.height5),
              Divider(color: AppColors().graye6Color, thickness: 1),
              SizedBox(height: AppSizes.height10),
              Text(
                "الأقساط الشهرية",
                style: AppStyles.text16.copyWith(
                  color: AppColors().gray8fColor,
                ),
              ),
              SizedBox(height: AppSizes.height5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: AppSizes.width158,
                    height: AppSizes.height48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSizes.radius8),
                      border: Border.all(
                        color: AppColors().graye6Color,
                        width: 1,
                      ),
                    ),
                  ),
                  Container(
                    width: AppSizes.width158,
                    height: AppSizes.height48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSizes.radius8),
                      border: Border.all(
                        color: AppColors().graye6Color,
                        width: 1,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSizes.height20),
              Text(
                "النوع",
                style: AppStyles.text16.copyWith(
                  color: AppColors().gray8fColor,
                ),
              ),
              SizedBox(height: AppSizes.height5),
              Wrap(
                spacing: AppSizes.width12,
                runSpacing: AppSizes.height10,
                children: [
                  _buildSelectableChip("الكل", selectedType),
                  _buildSelectableChip("توين هاوس", selectedType),
                  _buildSelectableChip("فيلا منفصلة", selectedType),
                  _buildSelectableChip("تاون هاوس", selectedType),
                ],
              ),
              SizedBox(height: AppSizes.height20),
              Text(
                "عدد الغرف",
                style: AppStyles.text16.copyWith(
                  color: AppColors().gray8fColor,
                ),
              ),
              SizedBox(height: AppSizes.height5),
              Wrap(
                spacing: AppSizes.width12,
                runSpacing: AppSizes.height10,
                children: [
                  _buildSelectableChip("الكل", selectedRooms, group: "rooms"),
                  _buildSelectableChip("غرفتين", selectedRooms, group: "rooms"),
                  _buildSelectableChip("3 غرف", selectedRooms, group: "rooms"),
                  _buildSelectableChip("4 غرف", selectedRooms, group: "rooms"),
                  _buildSelectableChip("5 غرف+", selectedRooms, group: "rooms"),
                ],
              ),
              SizedBox(height: AppSizes.height20),
              Text(
                "السعر",
                style: AppStyles.text16.copyWith(
                  color: AppColors().gray8fColor,
                ),
              ),
              SizedBox(height: AppSizes.height5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: AppSizes.width158,
                    height: AppSizes.height48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSizes.radius8),
                      border: Border.all(
                        color: AppColors().graye6Color,
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(AppSizes.padding12),
                      child: Text(
                        "اقل سعر",
                        style: AppStyles.text14.copyWith(
                          color: AppColors().grayColor,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: AppSizes.width158,
                    height: AppSizes.height48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSizes.radius8),
                      border: Border.all(
                        color: AppColors().graye6Color,
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(AppSizes.padding12),
                      child: Text(
                        "أقصى سعر",
                        style: AppStyles.text14.copyWith(
                          color: AppColors().grayColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSizes.height12),
              Text(
                "طريقة الدفع",
                style: AppStyles.text16.copyWith(
                  color: AppColors().gray8fColor,
                ),
              ),
              SizedBox(height: AppSizes.height5),
              Wrap(
                spacing: AppSizes.width12,
                children: [
                  _buildSelectableChip("أى", selectedPayment, group: "payment"),
                  _buildSelectableChip(
                    "تقسيط",
                    selectedPayment,
                    group: "payment",
                  ),
                  _buildSelectableChip(
                    "كاش",
                    selectedPayment,
                    group: "payment",
                  ),
                ],
              ),
              SizedBox(height: AppSizes.height20),
              Text(
                "حالة العقار",
                style: AppStyles.text16.copyWith(
                  color: AppColors().gray8fColor,
                ),
              ),
              SizedBox(height: AppSizes.height5),
              Wrap(
                spacing: AppSizes.width12,
                children: [
                  _buildSelectableChip("أى", selectedStatus, group: "status"),
                  _buildSelectableChip("جاهز", selectedStatus, group: "status"),
                  _buildSelectableChip(
                    "قيد الأنشاء",
                    selectedStatus,
                    group: "status",
                  ),
                ],
              ),
              SizedBox(height: AppSizes.height70),
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
                  child: Text(
                    "شاهد 10,000+ نتائج",
                    style: AppStyles.text16.copyWith(
                      color: AppColors().whiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSelectableChip(
    String text,
    String selected, {
    String group = "type",
  }) {
    final bool isSelected = selected == text;

    return GestureDetector(
      onTap: () {
        setState(() {
          if (group == "type") selectedType = text;
          if (group == "rooms") selectedRooms = text;
          if (group == "payment") selectedPayment = text;
          if (group == "status") selectedStatus = text;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.width16,
          vertical: AppSizes.height10,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors().blueffColor : Colors.transparent,
          borderRadius: BorderRadius.circular(AppSizes.radius30),
          border: Border.all(
            color: isSelected ? AppColors().blueColor : AppColors().graye6Color,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Text(
          text,
          style: AppStyles.text14.copyWith(
            color: isSelected ? AppColors().blueColor : AppColors().grayColor,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
