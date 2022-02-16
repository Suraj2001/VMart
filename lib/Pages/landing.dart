import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vmart/Pages/login.dart';
import 'package:vmart/theme.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                "assets/Icons/logo.png",
                height: MediaQuery.of(context).size.height * 0.4,
              ),
            ),
            const Spacer(),
            Text(
              "Welcome To V-MART",
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                  fontSize: MediaQuery.of(context).size.width * 0.08,
                  color: const Color(0xff030303)),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "One Stop Solution for connecting\nvendors to customers directly.",
              style: GoogleFonts.montserrat(
                fontSize: 14,
                color: VTheme.lightText,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 44,
                decoration: BoxDecoration(
                    color: VTheme.ksecondaryColor,
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: Text(
                    "Customer",
                    style: GoogleFonts.montserrat(
                        fontSize: 16, color: Colors.white, letterSpacing: 2),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 44,
                decoration: BoxDecoration(
                    border: Border.all(color: VTheme.kPrimaryColor),
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: Text(
                    "Merchant",
                    style: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: VTheme.kPrimaryColor,
                        letterSpacing: 2),
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
