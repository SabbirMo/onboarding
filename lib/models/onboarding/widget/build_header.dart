import 'package:flutter/material.dart';
import 'package:islamic_app/core/theme/app_color.dart';

class BuildHeader extends StatelessWidget {
  const BuildHeader({
    super.key,
    required this.currentPage,
    required this.pageController,
  });

  final int currentPage;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          currentPage == 0
              ? SizedBox(width: 24)
              : GestureDetector(
                  onTap: () {
                    pageController.previousPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: AppColor.heTextColor,
                  ),
                ),
          Text(
            currentPage == 0
                ? "Select Language"
                : (currentPage == 1 ? "Learn and Practice" : "Stay Connected"),
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Color(0xff51806d),
            ),
          ),
          Text(
            "Skip",
            style: TextStyle(
              fontSize: 16,
              color: Color(0xffC1C6BE),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
