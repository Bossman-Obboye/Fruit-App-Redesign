import 'package:flutter/material.dart';
import 'package:fruit_app_redesigned/second_screen.dart';
import 'package:fruit_app_redesigned/widgets/colors.dart';
import 'package:fruit_app_redesigned/widgets/general_layout.dart';
import 'package:fruit_app_redesigned/widgets/group_of_widgets.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({
    super.key,
  });

  final sizeFactor = 1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return GeneralLayout(
      size: size,
      imagePath: 'assets/images/screen1.png',
      stackChildren: [
        Align(
          alignment: const Alignment(1, -1.01),
          child: Image(
            height: size.height * 0.188,
            color: white.withOpacity(0.5),
            image: const AssetImage('assets/images/watersplash4top.png'),
          ),
        ),
        Transform(
          transform: Matrix4.rotationZ(-0.5),
          alignment: const Alignment(11, -5.6),
          child: Image(
            height: size.height * 0.14,
            color: white.withOpacity(0.5),
            image: const AssetImage(
                'assets/images/main_water_splash_flipped_h.png'),
          ),
        ),
        Transform(
          transform: Matrix4.rotationZ(0.26),
          alignment: const Alignment(-13, 8.3),
          child: Image(
            height: size.height * 0.3,
            image: const AssetImage('assets/images/pear.png'),
          ),
        ),
        Align(
          alignment: const Alignment(0.76, 0.3),
          child: Transform.rotate(
            angle: 0.6,
            child: Image(
              color: white.withOpacity(0.5),
              height: size.height * 0.2,
              image: const AssetImage('assets/images/main_water_splash.png'),
            ),
          ),
        ),
        Align(
          alignment: const Alignment(0.1, -0.2),
          child: Transform.rotate(
            angle: -0.35,
            child: Image(
              height: size.height * 0.16,
              image: const AssetImage('assets/images/pear.png'),
            ),
          ),
        ),
        Align(
          alignment: const Alignment(0.13, -0.15),
          child: Transform.rotate(
            angle: 0.8,
            child: Image(
              color: white.withOpacity(0.5),
              height: size.height * 0.1,
              image: const AssetImage('assets/images/main_water_splash.png'),
            ),
          ),
        ),
      ],
      columnChildren: [
        const AppTitleRow(icon: Icons.menu),
        SizedBox(
          height: size.height * 0.33,
        ),
        const ColumnOfTwoText(
          firstText: "Welcome",
          secondText: "To Fruit Basket",
        ),
        SizedBox(
          height: size.height * 0.012,
        ),
        SizedBox(
          width: size.width * 0.5,
          child: const Text(
            'Enim magna proident proident sunt exercitation irure duis excepteur eu eidelitminim. Non esse aute ut vet da quis.excepte',
            style: TextStyle(
                color: Color(0xff919292),
                fontSize: 9,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        InkWell(
          onTap: () {
            Navigator.push((context),
                MaterialPageRoute(builder: (context) => const SecondScreen()));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            height: size.height * 0.024,
            width: size.width * 0.23,
            decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5.5),
                bottomLeft: Radius.circular(5.5),
                topRight: Radius.circular(8),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('View More',
                    style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold)),
                Icon(Icons.arrow_right_alt_outlined, size: 19),
              ],
            ),
          ),
        ),
      ],
      desingBoxVisible: true,
    );
  }
}
