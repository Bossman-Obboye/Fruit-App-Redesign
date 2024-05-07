import 'package:flutter/material.dart';
import 'package:fruit_app_redesigned/widgets/colors.dart';
import 'package:fruit_app_redesigned/widgets/general_layout.dart';
import 'package:fruit_app_redesigned/widgets/group_of_widgets.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen(
      {super.key,
      required this.image,
      required this.name,
      required this.price,
      required this.description});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();

  final String image;
  final String name;
  final double price;
  final String description;
}

class _ThirdScreenState extends State<ThirdScreen> {
  int quantity = 1;

  add() {
    quantity++;
  }

  reduce() {
    if (quantity > 1) {
      quantity--;
    }
  }

  @override
  Widget build(BuildContext context) {
    double tPrice = quantity * widget.price;
    Size size = MediaQuery.sizeOf(context);
    return GeneralLayout(
      size: size,
      imagePath: 'assets/images/screen2.png',
      columnChildren: [
        SizedBox(
          height: size.height * 0.02,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonWithIcon(
                onTap: () => Navigator.pop(context),
                size: size,
                content: Image(
                    width: size.width * 0.04,
                    color: white.withOpacity(0.7),
                    image: const AssetImage('assets/images/arrow_back.png')),
              ),
              ButtonWithIcon(
                size: size,
                content: Icon(
                  Icons.shopping_cart_outlined,
                  color: white.withOpacity(0.7),
                  size: 20,
                ),
              ),
            ],
          ),
        ),
        Center(
          child: Image(
            fit: BoxFit.contain,
            image: AssetImage(widget.image),
            height: size.height * 0.24,
          ),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ColumnOfTwoText(
              firstText: widget.name,
              secondText: 'Super Tasty',
            ),
            ButtonWithIcon(
              size: size,
              content: Icon(
                Icons.favorite_outline,
                color: white.withOpacity(0.7),
                size: 20,
              ),
            ),
          ],
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        SizedBox(
          height: size.height * 0.19,
          width: size.width - 20,
          child: Text(
            widget.description,
            style: TextStyle(
              color: white.withOpacity(0.7),
              fontSize: 20,
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.04,
        ),
        Row(
          children: [
            AddandRemoveButton(
              onPress: () {
                setState(() {
                  reduce();
                });
              },
              size: size,
              opacity: 0.4,
              iconData: Icons.remove,
            ),
            Text('$quantity',
                style: const TextStyle(color: white, fontSize: 25)),
            AddandRemoveButton(
              onPress: () {
                setState(() {
                  add();
                });
              },
              size: size,
              opacity: 0.7,
              iconData: Icons.add,
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "\$${tPrice.toStringAsFixed(2)}",
                  style: const TextStyle(
                      color: white, fontWeight: FontWeight.w500, fontSize: 23),
                ),
                const Text(
                  "Total Price",
                  style: TextStyle(color: greylike, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        Container(
          height: size.height * 0.082,
          width: size.width - 20,
          decoration: BoxDecoration(
            color: deepPrimaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(
            child: Text(
              'Add to cart',
              style: TextStyle(
                color: blacklike,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
      stackChildren: [
//this is the water on the fruit in the column
        Align(
          alignment: const Alignment(-0.15, -0.63),
          child: Image(
            height: size.height * 0.18,
            color: white.withOpacity(0.5),
            image: const AssetImage('assets/images/main_water_splash.png'),
          ),
        ),
      ],
    );
  }
}

class AddandRemoveButton extends StatelessWidget {
  const AddandRemoveButton({
    super.key,
    required this.size,
    required this.opacity,
    required this.iconData,
    required this.onPress,
  });

  final Size size;
  final double opacity;
  final IconData iconData;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Padding(
        padding: EdgeInsets.all(size.height * 0.01),
        child: Container(
          // padding: EdgeInsets.all(6),
          height: size.height * 0.058,
          width: size.height * 0.058,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: white.withOpacity(opacity),
          ),
          child: Center(
            child: Icon(iconData, color: blacklike, size: 28),
          ),
        ),
      ),
    );
  }
}
