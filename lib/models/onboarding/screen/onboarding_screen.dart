import 'package:flutter/material.dart';
import 'package:islamic_app/core/theme/app_color.dart';
import 'package:islamic_app/models/onboarding/widget/build_header.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int? selectedIndex = 0; // Default English selected
  int currentPage = 0;
  PageController pageController = PageController();

  final List<Map<String, String>> languages = [
    {"flag": "🇺🇸", "name": "English"},
    {"flag": "🇧🇩", "name": "Bangla"},
    {"flag": "🇸🇦", "name": "Arabic"},
    {"flag": "🇵🇰", "name": "Urdu"},
    {"flag": "🇮🇳", "name": "Hindi"},
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: Column(
        children: [
          SizedBox(height: size.height * .07),
          BuildHeader(
            currentPage: currentPage,
            pageController: pageController,
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              children: [
                // First Page - Language Selection
                Column(
                  children: [
                    // Image Container
                    Container(
                      width: double.infinity,
                      height: size.height * 0.3,
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://static.vecteezy.com/system/resources/thumbnails/022/724/683/small_2x/ramadan-mosque-islamic-lantern-free-photo.jpg'),
                          fit: BoxFit.cover,
                          opacity: 0.6,
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    // Language List
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        itemCount: languages.length,
                        itemBuilder: (context, index) {
                          bool isSelected = selectedIndex == index;
                          final item = languages[index];
                          return Card(
                            color: isSelected ? Colors.white : AppColor.bgColor,
                            elevation: isSelected ? 4 : 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            margin: EdgeInsets.symmetric(vertical: 4),
                            child: ListTile(
                              leading: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.shade100,
                                ),
                                child: Center(
                                  child: Text(
                                    item['flag']!,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                              title: Text(
                                item['name']!,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              trailing: isSelected ? Icon(Icons.check) : null,
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),

                // Second Page
                buildCustomPage(
                    title: "Welcome to Islamic App",
                    description:
                        "Discover the beauty of Islamic knowledge and practice",
                    image: ''),

                // Third Page
                buildCustomPage(
                    title: "Start Your Journey",
                    description: "Begin exploring Islamic teachings and wisdom",
                    image: ''),
              ],
            ),
          ),

          // Continue Button
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 20),
            child: InkWell(
              onTap: () {
                if (currentPage < 2) {
                  pageController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                } else {
                  // Navigate to home screen
                  // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
                }
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: AppColor.heTextColor,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.heTextColor.withOpacity(0.3),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      color: AppColor.bgColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCustomPage({
    required String title,
    required String description,
    required String image,
    bool isOn = false,
  }) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 50),

          // Placeholder for image
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: AppColor.heTextColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              Icons.mosque,
              size: 80,
              color: AppColor.heTextColor.withOpacity(0.7),
            ),
          ),

          SizedBox(height: 40),

          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColor.heTextColor,
            ),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 20),

          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              height: 1.5,
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Location"),
                SizedBox(
                  height: 40,
                  width: 80,
                  child: Switch(
                    value: isOn,
                    onChanged: (value) {
                      setState(() {
                        isOn = value;
                      });
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
