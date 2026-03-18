import 'package:caffeine_stay/common/constants/styles/colors.dart';
import 'package:caffeine_stay/common/constants/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:intl/intl.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.title,
    required this.cat,
    required this.unit,
    required this.caffeine,
    this.date,
  });

  final String title;
  final String cat;
  final String unit;
  final double caffeine;
  final DateTime? date;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.edgeInsets(all: context.r(16)),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: AppColor.descColor.withValues(alpha: 0.2),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(context.r(24)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  padding: context.edgeInsets(all: 12),
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(context.r(16)),
                    ),
                  ),
                  child: Icon(
                    Icons.coffee,
                    size: context.h(24),
                    color: AppColor.primaryColor,
                  ),
                ),
                context.horizontalSpace(16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: PretendardText.title4.copyWith(
                          color: AppColor.primaryColor,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      context.verticalSpace(4),
                      Text(
                        '$cat / $unit',
                        style: PretendardText.caption1.copyWith(
                          color: AppColor.descColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          context.horizontalSpace(16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${caffeine}mg',
                style: PretendardText.body4.copyWith(
                  color: AppColor.primaryColor,
                ),
              ),
              if (date != null)
                Text(
                  DateFormat('HH:mm a').format(date!).toLowerCase(),
                  style: PretendardText.caption1.copyWith(
                    color: AppColor.primaryColor.withValues(alpha: 0.5),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
