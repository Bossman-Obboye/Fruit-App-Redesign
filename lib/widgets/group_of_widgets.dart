import 'package:flutter/material.dart';
import 'package:fruit_app_redesigned/get_started_screen.dart';
import 'package:fruit_app_redesigned/models/fruit_model.dart';
import 'package:fruit_app_redesigned/third_screen.dart';
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
        GestureDetector(
          onTap: () {
            Navigator.push((context), MaterialPageRoute(builder: (context) {
              return const GetStartedView();
            }));
          },
          child: const Text(
            'FruitBasket',
            style: TextStyle(
              color: white,
              fontFamily: 'MrsSaintDelafield',
              fontSize: 20,
            ),
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
    required this.widgetID,
    required this.fruit,
  });

  final int widgetID;
  final Size size;
  final EachFruit fruit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ThirdScreen(
                image: fruit.image,
                name: fruit.name,
                price: fruit.price,
                description: fruit.description);
          }));
        },
        child: Container(
          height: size.height * 0.156,
          width: size.width * 0.4,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: greylike.withOpacity(0.2),
                  blurRadius: 3,
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
                  image: AssetImage(fruits[widgetID]['image']),
                ),
              ),
              Align(
                alignment: const Alignment(0.8, -0.8),
                child: SizedBox(
                  height: size.height * 0.06,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(fruits[widgetID]['name'],
                          style: const TextStyle(
                              color: white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17)),
                      Text(
                        "Price: \$${fruits[widgetID]['price'].toStringAsFixed(2)}",
                        style: const TextStyle(
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
      ),
    );
  }
}

// this is the bottons on specifically the third screen.
// This will require a widget a the center,
// it may be an icon or an image or something else

class ButtonWithIcon extends StatelessWidget {
  const ButtonWithIcon({
    super.key,
    required this.size,
    required this.content,
    this.onTap,
  });
  final Widget content;
  final Size size;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        // padding: EdgeInsets.all(6),
        height: size.height * 0.05,
        width: size.height * 0.05,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: greylike.withOpacity(0.2),
        ),
        child: Center(
          child: content,
        ),
      ),
    );
  }
}
