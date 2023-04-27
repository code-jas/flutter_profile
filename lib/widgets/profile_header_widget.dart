// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile/app_colors.dart';
import 'package:flutter_profile/data/data.dart';

Widget profileHeaderWidget(BuildContext context) {
  return Container(
    width: double.infinity,
    decoration: const BoxDecoration(color: AppColors.bgColor),
    child: Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Image.asset(
                "assets/images/angelo_1.png",
                height: 173,
                width: 173,
                fit: BoxFit.cover,
              ),

              // Row(
              //   children: [
              //     Column(
              //       children: const [
              //         Text(
              //           "23",
              //           style: TextStyle(
              //             fontSize: 15,
              //             fontWeight: FontWeight.w700,
              //           ),
              //         ),
              //         Text(
              //           "Posts",
              //           style: TextStyle(
              //             fontSize: 15,
              //             letterSpacing: 0.4,
              //           ),
              //         )
              //       ],
              //     ),
              //     const SizedBox(
              //       width: 30,
              //     ),
              //     Column(
              //       children: const [
              //         Text(
              //           "1.5M",
              //           style: TextStyle(
              //             fontSize: 15,
              //             fontWeight: FontWeight.w700,
              //           ),
              //         ),
              //         Text(
              //           "Followers",
              //           style: TextStyle(
              //             letterSpacing: 0.4,
              //             fontSize: 15,
              //           ),
              //         )
              //       ],
              //     ),
              //     const SizedBox(
              //       width: 30,
              //     ),
              //     Column(
              //       children: const [
              //         Text(
              //           "234",
              //           style: TextStyle(
              //             letterSpacing: 0.4,
              //             fontSize: 15,
              //             fontWeight: FontWeight.w700,
              //           ),
              //         ),
              //         Text(
              //           "Following",
              //           style: TextStyle(
              //             letterSpacing: 0.4,
              //             fontSize: 15,
              //           ),
              //         )
              //       ],
              //     ),
              //     const SizedBox(
              //       width: 15,
              //     ),
              //   ],
              // )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Hi, I am John Angelo",
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      letterSpacing: 0.4,
                    ),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Text(
                    "Software Developer",
                    style: TextStyle(
                      color: AppColors.textColorAlt,
                      letterSpacing: 0.4,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Motivated and enthusiastic web developer looking for a new role in full-stack development",
                    style: TextStyle(
                      color: AppColors.textColorAlt,
                      letterSpacing: 0.4,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // actions(context),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                ]),
          )

          // SizedBox(
          //   height: 85,
          //   child: ListView.builder(
          //     shrinkWrap: true,
          //     scrollDirection: Axis.horizontal,
          //     itemCount: highlightItems.length,
          //     itemBuilder: (context, index) {
          //       return Row(
          //         children: [
          //           Column(
          //             children: [
          //               CircleAvatar(
          //                 radius: 30,
          //                 backgroundColor: Colors.grey,
          //                 child: Padding(
          //                   padding: const EdgeInsets.all(2.0),
          //                   child: CircleAvatar(
          //                     backgroundImage:
          //                         AssetImage(highlightItems[index].thumbnail),
          //                     radius: 28,
          //                   ),
          //                 ),
          //               ),
          //               Padding(
          //                 padding: const EdgeInsets.only(top: 4),
          //                 child: Text(
          //                   highlightItems[index].title,
          //                   style: TextStyle(fontSize: 13),
          //                 ),
          //               )
          //             ],
          //           ),
          //           const SizedBox(
          //             width: 10,
          //           )
          //         ],
          //       );
          //     },
          //   ),
          // )
        ],
      ),
    ),
  );
}

Widget actions(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              minimumSize: const Size(0, 30),
              side: const BorderSide(
                color: AppColors.grayColor,
              )),
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Text("Edit Profile",
                style: TextStyle(color: AppColors.textColor)),
          ),
        ),
      ),
    ],
  );
}
