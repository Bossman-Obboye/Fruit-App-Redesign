import 'package:flutter/material.dart';
import 'package:fruit_app_redesigned/second_screen.dart';
import 'package:fruit_app_redesigned/widgets/colors.dart';
import 'package:fruit_app_redesigned/widgets/small_rectangular_design_button.dart';

class GeneralLayout extends StatelessWidget {
  const GeneralLayout({
    super.key,
    required this.size,
    required this.imagePath,
    required this.columnChildren,
    this.stackChildren = const <Widget>[],
    this.desingBoxVisible = false,
    this.homeButtonDisplayed = true,
  });

  final Size size;
  final String imagePath;
  final List<Widget> columnChildren;
  final List<Widget> stackChildren;
  final bool desingBoxVisible;
  final bool homeButtonDisplayed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Stack(
        children: [
          Image(
            height: size.height,
            width: size.width,
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(size.width * 0.055),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ...columnChildren,
              const Spacer(),
              if (desingBoxVisible)
                SizedBox(
                  height: size.height * 0.02,
                ),
              if (desingBoxVisible) DsnBoxRow(size: size),
              SizedBox(
                height: size.height * 0.03,
              ),
              if (homeButtonDisplayed)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SecondScreen()));
                    },
                    child: const Icon(
                      Icons.home,
                      color: greylike,
                      size: 27,
                    ),
                  ),
                ),
            ]),
          ),
          ...stackChildren,
        ],
      ),
    );
  }
}
