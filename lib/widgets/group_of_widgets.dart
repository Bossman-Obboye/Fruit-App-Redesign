import 'package:flutter/material.dart';
import 'package:fruit_app_redesigned/widgets/colors.dart';

// This is the widget that in place of the nav bar.
// it contains the App Title and an icon which may vary base
// on the screen.

class AppTitleRow extends StatelessWidget {
  const AppTitleRow({super.key, required this.icon});
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'FruitBasket',
          style: TextStyle(
            color: white,
            fontFamily: 'MrsSaintDelafield',
            fontSize: 20,
          ),
        ),
        Icon(icon, color: white),
      ],
    );
  }
}

// On the Welcome Screen this widget appear on the center.
// It contains two text widgets in a column which the first
// one is yellow and the other white

class ColumnOfTwoText extends StatelessWidget {
  const ColumnOfTwoText(
      {super.key, required this.firstText, required this.secondText});
  final String firstText;
  final String secondText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          firstText,
          style: const TextStyle(
              color: primaryColor, fontSize: 34, fontWeight: FontWeight.bold),
        ),
        Text(
          secondText,
          style: const TextStyle(
              color: white, fontSize: 17, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

// this is simply the card that displays the fruits on the
// second screen.

class DisplayCard extends StatelessWidget {
  const DisplayCard({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: size.height * 0.156,
        width: size.width * 0.4,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: greylike.withOpacity(0.3),
                blurRadius: 4,
                spreadRadius: 3,
                // offset: Offset(0, 8),
              ),
            ]),
        child: Stack(
          children: [
            Align(
              alignment: const Alignment(-0.8, 0.8),
              child: Image(
                height: size.height * 0.1,
                image: const AssetImage('assets/images/mango.png'),
              ),
            ),
            Align(
              alignment: const Alignment(0.8, -0.8),
              child: SizedBox(
                height: size.height * 0.06,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Mango',
                        style: TextStyle(
                            color: white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17)),
                    Text(
                      "maing skl",
                      style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.bold,
                          fontSize: 7),
                    ),
                  ],
                ),
              ),
            ),
            const Align(
                alignment: Alignment(1.2, 1.2),
                child: Icon(
                  Icons.add_box,
                  size: 22,
                  color: deepPrimaryColor,
                )),
          ],
        ),
      ),
    );
  }
}
