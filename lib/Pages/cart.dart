import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/Images/cart.png",
            height: 200,
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            "Under Development\nComing Soon..",
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
