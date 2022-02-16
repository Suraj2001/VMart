import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:vmart/Pages/navbar.dart';
import 'package:vmart/theme.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Center(
              child: Image.asset(
                "assets/verification_illustration.png",
              ),
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    "Enter Verification Code",
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                        color: const Color(0xff030303)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "We have sent SMS to:",
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: VTheme.lightText,
                        letterSpacing: 1),
                  ),
                  Text(
                    "01XXXXXXXXXX",
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: const Color(0xff37474F)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _otpTextField(context, true),
                  const Spacer(),
                  _otpTextField(context, false),
                  const Spacer(),
                  _otpTextField(context, false),
                  const Spacer(),
                  _otpTextField(context, false),
                  const Spacer(),
                  _otpTextField(context, false),
                ],
              ),
            ),
            const Center(child: Text("Resend OTP")),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const BottomNavig(),
                ));
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                height: 44,
                decoration: BoxDecoration(
                    color: VTheme.ksecondaryColor,
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: Text(
                    "Next",
                    style: GoogleFonts.montserrat(
                        fontSize: 16, color: Colors.white, letterSpacing: 2),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _otpTextField(BuildContext context, bool autoFocus) {
    return Container(
      height: MediaQuery.of(context).size.shortestSide * 0.13,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xffEEEEEE),
        shape: BoxShape.rectangle,
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: TextField(
          autofocus: autoFocus,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          style: const TextStyle(),
          maxLines: 1,
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
        ),
      ),
    );
  }
}
