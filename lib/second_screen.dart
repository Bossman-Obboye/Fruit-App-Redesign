import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fruit_app_redesigned/models/fruit_model.dart';
import 'package:fruit_app_redesigned/widgets/colors.dart';
import 'package:fruit_app_redesigned/widgets/general_layout.dart';
import 'package:fruit_app_redesigned/widgets/group_of_widgets.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List<EachFruit> fruits = [];
  Future loadJsonData() async {
    final String loadJsonData =
        await rootBundle.loadString('assets/json/fruit.json');
    final jsonData = jsonDecode(loadJsonData);
    setState(() {
      fruits = AllFruit.fromMyJson(jsonData).allFruits;
    });
  }

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return fruits.isEmpty
        ? const Scaffold(
            body: Center(
              child: Text("Empty container"),
            ),
          )
        : GeneralLayout(
            size: size,
            imagePath: "assets/images/screen2.png",
            desingBoxVisible: true,
            homeButtonDisplayed: false,
            columnChildren: [
              const AppTitleRow(icon: Icons.search),
              ClipPath(
                clipper: WaveClipperTwo(),
                child: ClipRRect(
                  child: Container(
                    height: size.height * 0.35,
                    width: size.width,
                    decoration: const BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Transform.rotate(
                          angle: -0.2,
                          child: const Text(
                            "FruitBasket",
                            style: TextStyle(
                              fontFamily: 'MrsSaintDelafield',
                              fontSize: 80,
                              color: white,
                            ),
                          ),
                        ),
                        const Image(
                          image: AssetImage('assets/images/woman.png'),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular Choices",
                      style: TextStyle(
                          color: white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "View all",
                      style: TextStyle(
                        color: white,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        DisplayCard(
                          size: size,
                          widgetID: fruits[0].index,
                          fruit: fruits[0],
                        ),
                        DisplayCard(
                          size: size,
                          widgetID: fruits[1].index,
                          fruit: fruits[1],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        DisplayCard(
                          size: size,
                          widgetID: fruits[2].index,
                          fruit: fruits[2],
                        ),
                        DisplayCard(
                          size: size,
                          widgetID: fruits[3].index,
                          fruit: fruits[3],
                        ),
                      ],
                    )
                  ]),
              const SizedBox(
                  // height: size.height * 0.025,
                  ),
            ],
          );
  }
}

class WaveClipperTwo extends CustomClipper<Path> {
  WaveClipperTwo();
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    var firstControlPoint = Offset(size.width / 8, size.height - 25);
    var firstEndPoint = Offset(size.width / 3, size.height - 25);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondCP = Offset(size.width / 1.4, size.height + 25);
    var secondEP = Offset(size.width, size.height - 25);
    path.quadraticBezierTo(secondCP.dx, secondCP.dy, secondEP.dx, secondEP.dy);

    path.lineTo(size.width, size.height - 20);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
