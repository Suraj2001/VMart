import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  List categoryInfo = [
    [
      "assets/Images/f&v.png",
      "Fresh Fruits & vegetable",
      const Color(0xff53B175)
    ],
    ["assets/Images/oil.png", "Cooking Oil & Ghee", const Color(0xffF8A44C)],
    ["assets/Images/f&m.png", "Fish & Meat", const Color(0xffF7A593)],
    ["assets/Images/bakery.png", "Bakery & Snacks", const Color(0xffD3B0E0)],
    ["assets/Images/d&e.png", "Dairy & Eggs", const Color(0xffFDE598)],
    ["assets/Images/beverages.png", "Beverages", const Color(0xffB7DFF5)],
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 0, 10),
          child: Text("Categories",
              style: GoogleFonts.nunito(
                  fontSize: 24, fontWeight: FontWeight.bold)),
        ),
        GridView.builder(
          shrinkWrap: true,
          primary: false,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (_, i) => _cards(
              categoryInfo[i][0], categoryInfo[i][1], categoryInfo[i][2]),
          itemCount: categoryInfo.length,
        ),
      ],
    );
  }

  Widget _cards(image, title, color) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.10),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.70)),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.06),
              offset: const Offset(0, 4),
              blurRadius: 10)
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 100,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              title,
              style: GoogleFonts.nunito(fontSize: 18),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
