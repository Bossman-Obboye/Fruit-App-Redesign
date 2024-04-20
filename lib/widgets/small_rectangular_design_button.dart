import 'package:flutter/material.dart';
import 'package:fruit_app_redesigned/widgets/colors.dart';

class DsnBoxRow extends StatelessWidget {
  const DsnBoxRow({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        DesignBox(
          size: size,
          mainText: 'Fruit',
        ),
        DesignBox(
          size: size,
          fillColor: const Color(0xff454854),
          height: size.height * 0.032,
          mainText: 'Flower',
        ),
        DesignBox(
          size: size,
          mainText: 'Feasr',
        ),
      ],
    );
  }
}

class DesignBox extends StatelessWidget {
  const DesignBox({
    super.key,
    required this.size,
    required this.mainText,
    this.fillColor = const Color(0xff283438),
    this.height = 22,
  });
  final String mainText;
  final Size size;
  final Color fillColor;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      height: height,
      width: size.width * 0.22,
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              mainText,
              style: const TextStyle(
                  color: white, fontSize: 12, fontFamily: "MrsSaintDelafield"),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: size.height * 0.01,
              width: size.height * 0.01,
              decoration: const BoxDecoration(
                  color: primaryColor, shape: BoxShape.circle),
            ),
          ),
        ],
      ),
    );
  }
}
