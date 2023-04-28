import 'package:flutter/material.dart';
import 'package:flutter_profile/app_colors.dart';

class Skills extends StatefulWidget {
  const Skills({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SkillsState createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  final List<Map<String, dynamic>> techStacks = [
    {
      '_id': 1,
      'title': 'Frontend Developer',
      'subtitle': 'More than 2 years',
      'iconList': [
        {
          'name': 'HTML5',
          'icon': 'assets/images/techstack/front/html-5.svg',
        },
        {
          'name': 'CSS',
          'icon': 'assets/images/techstack/front/css-3.svg',
        },
        {
          'name': 'JavaScript',
          'icon': 'assets/images/techstack/front/javascript.svg',
        },
        {
          'name': 'React',
          'icon': 'assets/images/techstack/front/react.svg',
        },
        {
          'name': 'NextJs',
          'icon': 'assets/images/techstack/front/nextjs.svg',
        },
        {
          'name': 'VueJs',
          'icon': 'assets/images/techstack/front/vue.svg',
        },
        {
          'name': 'Nuxt',
          'icon': 'assets/images/techstack/front/nuxt.svg',
        },
        {
          'name': 'Tailwind',
          'icon': 'assets/images/techstack/front/tailwindcss-icon.svg',
        },
        {
          'name': 'Flutter',
          'icon': 'assets/images/techstack/front/flutter.svg',
        },
      ],
    },
    {
      '_id': 2,
      'title': 'Backend Developer',
      'subtitle': 'More than 2 years',
      'iconList': [
        {'name': 'PHP', 'icon': 'assets/images/techstack/back/php.svg'},
        {'name': 'mySQL', 'icon': 'assets/images/techstack/back/mysql.svg'},
        {
          'name': 'Firebase',
          'icon': 'assets/images/techstack/back/firebase.svg'
        },
        {'name': 'Flask', 'icon': 'assets/images/techstack/back/flask.svg'},
        {'name': 'Sanity', 'icon': 'assets/images/techstack/back/sanity.svg'},
      ],
    },
    {
      '_id': 3,
      'title': 'Others',
      'subtitle': 'Seeking skills',
      'iconList': [
        {'name': 'Figma', 'icon': 'assets/images/techstack/others/figma.svg'},
        {'name': 'git', 'icon': 'assets/images/techstack/others/git-icon.svg'},
        {
          'name': 'pytorch',
          'icon': 'assets/images/techstack/others/pytorch.svg'
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bgColor, // Set the background color of the container
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 40.0),
          child: Column(
            children: const [
              _FrontEndContainer(),
              SizedBox(height: 20),
              _BackEndContainer(),
              SizedBox(height: 20),
              _OtherEndContainer(),
            ],
          ),
        ),
      ),
    );
  }
}

class _FrontEndContainer extends StatelessWidget {
  const _FrontEndContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Front-End',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.textColor,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 400,
          width: 350,
          decoration: BoxDecoration(
            color: AppColors.contColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                color: AppColors.bgColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _BackEndContainer extends StatelessWidget {
  const _BackEndContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Back-End',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.textColor,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 400,
          width: 350,
          decoration: BoxDecoration(
            color: AppColors.contColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 7,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                color: AppColors.bgColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _OtherEndContainer extends StatelessWidget {
  const _OtherEndContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Others',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.textColor,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 400,
          width: 350,
          decoration: BoxDecoration(
            color: AppColors.contColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: const Center(
            child: Text(
              'HTML',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}



// class _FrontEndContainer extends StatelessWidget {
//   const _FrontEndContainer({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const Text(
//           'Front-End',
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//             color: AppColors.textColor,
//           ),
//         ),
//         const SizedBox(
//           height: 20,
//         ),
//         Container(
//           height: 50,
//           width: 300,
//           decoration: BoxDecoration(
//             color: AppColors.contColor,
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//           child: const Center(
//             child: Text(
//               'HTML',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: AppColors.textColor,
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         Container(
//           height: 50,
//           width: 300,
//           decoration: BoxDecoration(
//             color: AppColors.contColor,
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//           child: const Center(
//             child: Text(
//               'CSS',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: AppColors.textColor,
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         Container(
//           height: 50,
//           width: 300,
//           decoration: BoxDecoration(
//             color: AppColors.contColor,
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//           child: const Center(
//             child: Text(
//               'JavaScript',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: AppColors.textColor,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
