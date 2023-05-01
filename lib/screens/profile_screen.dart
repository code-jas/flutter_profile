import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import 'package:flutter_profile/app_colors.dart';

import 'package:flutter_profile/widgets/profile_header_widget.dart';
import 'package:flutter_profile/screens/portfolio_screen.dart';
import 'package:flutter_profile/screens/skills_screen.dart';
import 'package:flutter_profile/screens/about_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(45),
        child: Container(
          decoration: const BoxDecoration(
              // border: Border(
              //   bottom: BorderSide(
              //     color: AppColors.bgColor,
              //   ),
              // ),
              ),
          child: AppBar(
            backgroundColor: AppColors.bgColor,
            title: const Text(
              "John Angelo",
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            centerTitle: true,
            elevation: 0,
            actions: [
              // IconButton(
              //   icon: const Icon(Icons.add_box_outlined,
              //       color: AppColors.textColor),
              //   // ignore: avoid_print
              //   onPressed: () => print("Add"),
              // ),
              // IconButton(
              //   icon: const Icon(Icons.menu, color: AppColors.textColor),
              //   // ignore: avoid_print
              //   onPressed: () => print("Menu"),
              // )
            ],
          ),
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (context, _) {
            return [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    profileHeaderWidget(context),
                  ],
                ),
              ),
            ];
          },
          body: Column(
            children: const <Widget>[
              Material(
                color: AppColors.bgColor,
                child: TabBar(
                  labelColor: AppColors.textColor,
                  unselectedLabelColor: AppColors.grayColor,
                  indicatorWeight: 1,
                  indicatorColor: AppColors.textColor,
                  tabs: [
                    Tab(
                      icon:
                          Icon(UniconsLine.images, color: AppColors.textColor),
                    ),
                    Tab(
                      icon: Icon(UniconsLine.analysis,
                          color: AppColors.textColor),
                    ),
                    Tab(
                      icon: Icon(UniconsLine.user, color: AppColors.textColor),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Portfolio(),
                    Skills(),
                    About(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
