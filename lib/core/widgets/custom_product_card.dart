import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task/core/constants/app_assets.dart';
import 'package:task/core/constants/app_color.dart';
import 'package:task/core/constants/app_sizes.dart';
import 'package:task/core/constants/app_style.dart';
import '../../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes.width158,
      height: AppSizes.height360,
      decoration: BoxDecoration(
        color: AppColors().whiteColor,
        borderRadius: BorderRadius.circular(AppSizes.radius4),
        border: Border.all(color: AppColors().graye6Color, width:AppSizes.width1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 6,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(AppSizes.radius16)),
              child: Image.asset(
                product.image,
                width: double.infinity,
                height: AppSizes.height150,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: AppColors().gray8fColor,
                  child: Icon(Icons.image_not_supported, size: AppSizes.radius40),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(AppSizes.padding4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          product.name,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyles.text14,
                        ),
                      ),
                      SvgPicture.asset(AppIcons.sold, width: AppSizes.width18, height: AppSizes.height18),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: _buildPriceWidget(product.price),
                      ),
                      Icon(Icons.favorite_border, color: AppColors().blackColor, size: AppSizes.radius18),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.local_fire_department_outlined,
                            color: AppColors().grayColor,
                            size: AppSizes.radius12,
                          ),
                          SizedBox(width: AppSizes.width2),
                          Expanded(
                            child: Text(
                              product.soldNumber,
                              style: AppStyles.text14.copyWith(
                                color: AppColors().grayColor,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: AppSizes.height40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SvgPicture.asset(AppIcons.company, width: AppSizes.width26, height: AppSizes.height26),
                          SizedBox(width: AppSizes.width50),
                          Container(
                            width: AppSizes.width32,
                            height: AppSizes.width24,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppSizes.radius4),
                              border: Border.all(color: AppColors().graye6Color, width: AppSizes.width1),
                            ),
                            child: Icon(
                              Icons.add_shopping_cart_outlined,
                              color: AppColors().grayColor,
                              size: AppSizes.radius12,
                            ),
                          ),
                          SizedBox(width: AppSizes.width5),
                          Image.asset(AppImages.tal3at, width: AppSizes.width15, height: AppSizes.width22),

                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildPriceWidget(String priceText) {
  final parts = priceText.split('/');
  if (parts.length == 2) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: parts[0],
            style: AppStyles.text14.copyWith(color: AppColors().redColor,),
          ),
          TextSpan(
            text: '/',
            style: AppStyles.text14.copyWith(color: AppColors().redColor,),
          ),
          TextSpan(
            text: parts[1],
            style: AppStyles.text14.copyWith(color: AppColors().grayColor, decoration: TextDecoration.lineThrough,
              decorationColor: Colors.grey,),
          ),
        ],
      ),
    );
  }
  return Text(
    priceText,
    style: AppStyles.text14.copyWith(color: AppColors().blackColor,),
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );
}