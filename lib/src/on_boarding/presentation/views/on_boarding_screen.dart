import 'package:flutter/material.dart';
import 'package:flutter_wanandroid2/src/on_boarding/presentation/widgets/on_boarding_info_section.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            TabBarView(
              controller: tabController,
              children: const [
                OnBoardingInfoSection.first(),
                OnBoardingInfoSection.second(),
              ],
            ),
            Positioned(
                bottom: 80,
                child: TabPageSelector(
                  controller: tabController,
                  color: Colors.white,
                  indicatorSize: 10,
                  selectedColor: Colors.orange,
                ))
          ],
        ),
      ),
    );
  }
}
