import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vmart/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List cards = [
    ["Mini Mart Grocery", 4, "assets/Images/grocery1.jpg", 2],
    ["Ravi Veggie Corner", 4.5, "assets/Images/grocery2.jpg", 0.5],
    ["Ravi Veggie Corne", 4.5, "assets/Images/grocery3.jpg", 5],
    ["Indian Retail Store", 3, "assets/Images/grocery4.jpg", 8]
  ];

  List dealInfo = [
    ["assets/Images/nescafe.png", "Coffee", 100, "50 gms", "Mini Mart Grocery"],
    [
      "assets/Images/sugar.png",
      "Deshi sugar",
      240,
      "1 Kg",
      "Ravi Veggie Corner"
    ],
    ["assets/Images/banana.png", "Banana", 20, "7 pcs", "Ravi Veggie Corne"],
    ["assets/Images/eggs.png", "Eggs", 140, "4 pcs", "Indian Retail Store"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFCFCFC),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hello Daniel",
                        style: GoogleFonts.nunito(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    Text(
                      "Norristown, Pennsylvania, 19403",
                      style: GoogleFonts.nunito(color: const Color(0xff8A8A8E)),
                    )
                  ],
                ),
                Image.asset(
                  "assets/Icons/Vector.png",
                  height: 20,
                ),
              ],
            ),
          ),
          Container(
            height: 40,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                      color: Colors.black.withOpacity(0.06),
                    )
                  ]),
              child: TextField(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => SearchScreen()),
                  // );
                },
                autofocus: false,

                // readOnly: true,
                decoration: InputDecoration(
                  hintText: 'Search For Groceries',
                  hintStyle: GoogleFonts.nunito(
                    color: VTheme.lightText.withOpacity(0.6),
                    fontWeight: FontWeight.w300,
                  ),
                  contentPadding: const EdgeInsets.only(top: 5),
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: VTheme.contrast.withOpacity(0.6),
                  ),
                ),
              ),
            ),
          ),
          _topics("Stores Near You", "See All"),
          Container(
            height: MediaQuery.of(context).size.height * 0.22,
            child: ListView.builder(
              itemCount: cards.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, int index) {
                return _storeCards(cards[index][0], cards[index][1],
                    cards[index][2], cards[index][3]);
              },
            ),
          ),
          _topics("Best Deals", "See All"),
          GridView.builder(
            shrinkWrap: true,
            primary: false,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.9),
            itemBuilder: (_, i) => _dealCards(dealInfo[i][0], dealInfo[i][1],
                dealInfo[i][2], dealInfo[i][3], dealInfo[i][4]),
            itemCount: dealInfo.length,
          )
        ],
      ),
    );
  }

  Widget _topics(title, subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10)
          .copyWith(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: GoogleFonts.nunito(
                  fontSize: 20, fontWeight: FontWeight.bold)),
          Text(subtitle,
              style: GoogleFonts.nunito(
                  fontSize: 16, color: VTheme.kPrimaryColor)),
        ],
      ),
    );
  }

  Widget _dealCards(image, title, price, weight, store) {
    return Container(
      margin: const EdgeInsets.all(20).copyWith(top: 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: VTheme.kPrimaryLightColor),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.06),
              offset: const ui.Offset(0, 4),
              blurRadius: 10)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Center(
              child: Image.asset(
                image,
                height: 80,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  overflow: TextOverflow.ellipsis,
                  strutStyle: const StrutStyle(fontSize: 16.0),
                  text: TextSpan(
                    text: title,
                    style: GoogleFonts.nunito(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: VTheme.contrast),
                  ),
                ),
                Text(
                  weight,
                  style: GoogleFonts.nunito(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: VTheme.contrast.withOpacity(0.5)),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Rs " + price.toString(),
                      style: GoogleFonts.nunito(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: VTheme.contrast),
                    ),
                    InkWell(
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: VTheme.kPrimaryColor.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 500,
              decoration: const BoxDecoration(
                  color: VTheme.kPrimaryLightColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16))),
              child: Text(
                store,
                textAlign: ui.TextAlign.center,
                style: GoogleFonts.nunito(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: VTheme.kPrimaryColor),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _storeCards(title, rating, image, distance) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, bottom: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 5,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              padding: const EdgeInsets.all(10).copyWith(top: 70),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(image))),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 61,
                width: MediaQuery.of(context).size.width * 0.7 - 20,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    color: Colors.white.withOpacity(0.9)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title ?? "",
                          style: GoogleFonts.nunito(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5),
                        ),
                        Row(
                          children: [
                            Image.asset("assets/Icons/starF.png"),
                            Image.asset("assets/Icons/starF.png"),
                            Image.asset("assets/Icons/starF.png"),
                            Image.asset("assets/Icons/starF.png"),
                            Image.asset("assets/Icons/star.png"),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset("assets/Icons/location.png", height: 10),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          distance.toString() + " Kms",
                          style: GoogleFonts.nunito(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
