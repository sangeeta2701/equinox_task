import 'package:equinox_task/Utils/colors.dart';
import 'package:equinox_task/Utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

import '../../Widgets/sizedbox.dart';
import '../../model/blogListData.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  @override
  void initState() {
    super.initState();
    _getBlogList();
  }

  List<BlogListData> blogList = [];
  Future<void> _getBlogList() async {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
    );
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var _blogs = blogListDataFromJson(response.body);

      setState(() {
        blogList = _blogs;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: themeColor,
        iconTheme: IconThemeData(color: wColor),
        elevation: 0,
        title: Text(
          "Blog List",
          style: buttonStyle,
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20,12,20,0),
          child:blogList.isEmpty?Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(themeColor),),): ListView.builder(
            itemCount: blogList.length,
            itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
              child: Container(
                height: 180.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: lightThemeColor.withOpacity(0.3),
                  boxShadow: [
                    BoxShadow(
                      color: lightThemeColor.withOpacity(0.3),
                      // spreadRadius: 3,
                      blurRadius: 4,
                      offset: Offset(2, 4), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      blogList[index].title,
                      style: blackSubHeading,
                    ),
                    height4,
                    Text(
                      blogList[index].body,
                      style: greyContent,
                      maxLines: 4,
                    ),
                    height8,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "View More",
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
              ),
            );
          }),
        ),
      ),
    );
  }
}
