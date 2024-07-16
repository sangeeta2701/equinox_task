import 'package:equinox_task/Utils/colors.dart';
import 'package:equinox_task/Utils/constant.dart';
import 'package:equinox_task/Widgets/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key,required this.username});
  final String username;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> moods = ["Happy", "Angry", "Calm", "Sad", "Confused"];
  List _selectedIndexs = [];
  final List<String> _moodIcons = [
    'assets/icons/icon1.png',
    'assets/icons/icon2.png',
    'assets/icons/icon3.png',
    'assets/icons/icon4.png',
    'assets/icons/icon5.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Hello",
                        style: greyContent,
                      ),
                      width8,
                      Text(
                        widget.username,
                        style: blackText,
                      ),
                    ],
                  ),
                  height30,
                  Text(
                    "How are you feeling today?",
                    style: blackContent,
                  ),
                  height12,
                  SizedBox(
                    height: 100.h,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: moods.length,
                        itemBuilder: (context, index) {
                          final _isSelected = _selectedIndexs.contains(index);
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (_isSelected) {
                                    _selectedIndexs.remove(index);
                                  } else {
                                    _selectedIndexs.add(index);
                                  }
                                });
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 50.h,
                                    width: 50.w,
                                    decoration: BoxDecoration(
                                      color: _isSelected == true
                                          ? themeColor
                                          : gColor.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        _moodIcons[index],
                                        height: 40.h,
                                        width: 40.w,
                                      ),
                                    ),
                                  ),
                                  height4,
                                  Text(
                                    moods[index],
                                    style: textFieldText,
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  
                  height30,
                  Text(
                    "Today's Task",
                    style: blackContent,
                  ),
                  height12,
                  taskContainer(
                      "Group Meetup",
                      "Let's open up to the things that matters among the people.",
                      "assets/icons/icon6.png",
                      lightThemeColor.withOpacity(0.2)),
                  height30,
                  taskContainer(
                      "Meditation",
                      "Aura is the most important thing that matters to you, join us now.",
                      "assets/icons/icon7.png",
                      lightThemeColor.withOpacity(0.1)),
                ],
              ),
            ),
          ),
        ));
  }

  Widget taskContainer(
      String heading, String desc, String icon, Color containerColor) {
    return Container(
      height: 150.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: containerColor, borderRadius: BorderRadius.circular(12),
          boxShadow: [
                    BoxShadow(
                      color: lightThemeColor.withOpacity(0.3),
                      // spreadRadius: 3,
                      blurRadius: 4,
                      offset: Offset(2, 4), // changes position of shadow
                    ),
                  ],),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  heading,
                  style: blackSubHeading,
                ),
                height4,
                Text(
                  desc,
                  style: greyContent,
                ),
                height8,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Join Now",
                      style: themeContent,
                    ),
                    width4,
                    Icon(
                      Icons.arrow_forward,
                      color: themeColor,
                    )
                  ],
                )
              ],
            ),
          ),
          Image.asset(
            icon,
            height: 100.h,
            width: 90.w,
          ),
        ]),
      ),
    );
  }

  Widget moodContainer(String icon, String mood) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 50.h,
            width: 50.w,
            decoration: BoxDecoration(
              color: themeColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Image.asset(
                icon,
                height: 40.h,
                width: 40.w,
              ),
            ),
          ),
          height4,
          Text(
            mood,
            style: textFieldText,
          )
        ],
      ),
    );
  }
}
