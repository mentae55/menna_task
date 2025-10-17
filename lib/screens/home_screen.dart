import 'package:flutter/material.dart';
import 'package:task/core/constants/app_assets.dart';
import 'package:task/core/constants/app_color.dart';
import 'package:task/core/constants/app_sizes.dart';
import 'package:task/core/constants/app_style.dart';
import 'package:task/screens/filter_screen.dart';
import 'package:task/screens/main_screen.dart';
import '../core/services/database_helper.dart';
import '../core/widgets/custom_product_card.dart';
import '../models/product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().whiteColor,
      appBar: AppBar(
        toolbarHeight: AppSizes.height60,
        automaticallyImplyLeading: false,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: AppSizes.width160,
            children: [
              Text("أستكشف العروض", style: AppStyles.text16),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FilterScreen(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Text(
                      "الكل",
                      style: AppStyles.text16.copyWith(
                        color: AppColors().grayColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.arrow_forward, color: AppColors().grayColor),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: FutureBuilder<List<Product>>(
        future: DatabaseHelper.instance.getProducts(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final products = snapshot.data!;

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(AppSizes.padding10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: AppSizes.padding8,
                      children: [
                        _buildCategory("كل العروض", true),
                        _buildCategory("ملابس", false),
                        _buildCategory("أكسسوارات", false),
                        _buildCategory("الكترونيات", false),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSizes.height40),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: AppSizes.width12,
                      children: [
                        _buildIconCategory(AppImages.man, "موضة رجالى"),
                        _buildIconCategory(AppImages.watch, "ساعات"),
                        _buildIconCategory(AppImages.phone, "موبايلات"),
                        _buildIconCategory(AppImages.makeup, "منتجات تجميل"),
                        _buildIconCategory(AppImages.home, "فلل"),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSizes.height20),
                  Container(
                    height: AppSizes.height32,
                    decoration: BoxDecoration(
                      color: AppColors().orangf4Color,
                      borderRadius: BorderRadius.circular(AppSizes.radius4),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.check, color: AppColors().greenColor),
                        SizedBox(width: AppSizes.width5),
                        Text(
                          "شحن مجانى",
                          style: AppStyles.text12.copyWith(
                            color: AppColors().greenColor,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "لأى عرض تطلبه دلوقتى !",
                          style: AppStyles.text10.copyWith(
                            color: AppColors().blackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSizes.height10),
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.45,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ProductCard(product: product);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCategory(String title, bool isActive) {
    return Container(
      height: AppSizes.height40,
      width: isActive ? AppSizes.width95 : AppSizes.width85,
      decoration: BoxDecoration(
        color: isActive ? AppColors().orangf4Color : AppColors().whiteColor,
        borderRadius: BorderRadius.circular(AppSizes.radius4),
        border: Border.all(
          color: isActive ? AppColors().bluef4Color : AppColors().graye6Color,
          width: 1,
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: AppStyles.text14.copyWith(
            color: isActive ? AppColors().orangColor : AppColors().gray8fColor,
          ),
        ),
      ),
    );
  }

  Widget _buildIconCategory(String image, String label) {
    return SizedBox(
      width: AppSizes.width75,
      height: AppSizes.height80,
      child: Column(
        children: [
          Image.asset(image),
          SizedBox(height: AppSizes.height5),
          Text(
            label,
            style: AppStyles.text12.copyWith(color: AppColors().blackColor),
          ),
        ],
      ),
    );
  }
}
