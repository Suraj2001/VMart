import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vmart/Pages/verification.dart';
import 'package:vmart/theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(flex: 2),
          Center(
            child: Image.asset(
              "assets/shopping_illustration.png",
            ),
          ),
          const Spacer(flex: 2),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Get Your Groceries \nwith V-Mart",
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontSize: MediaQuery.of(context).size.width * 0.07,
                    color: const Color(0xff030303)),
              ),
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              onChanged: (val) {
                if (val.length == 10) {
                  FocusManager.instance.primaryFocus?.unfocus();
                }
              },
              keyboardType: TextInputType.number,
              style: GoogleFonts.montserrat(),
              decoration: InputDecoration(
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(width: 0.2)),
                focusedBorder: const UnderlineInputBorder(
                    borderSide:
                        BorderSide(width: 0.5, color: VTheme.kPrimaryColor)),
                prefixIcon: Image.asset("assets/Icons/Symbol.png"),
                prefixText: "+91",
              ),
            ),
          ),
          const Spacer(flex: 2),
          InkWell(
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const VerificationPage(),
              ));
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
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
          const Spacer(flex: 3),
          Row(
            children: [
              const Expanded(
                child: Divider(
                  color: Colors.black,
                  thickness: 0.2,
                  indent: 50,
                  endIndent: 20,
                ),
              ),
              Text(
                "OR",
                style: GoogleFonts.montserrat(),
              ),
              const Expanded(
                  child: Divider(
                color: Colors.black,
                thickness: 0.2,
                indent: 20,
                endIndent: 50,
              ))
            ],
          ),
          const Spacer(
            flex: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 36,
                width: 120,
                decoration: BoxDecoration(
                    color: VTheme.kPrimaryLightColor,
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                      child: Image.asset("assets/Icons/google.png"),
                    ),
                    Text(
                      "Google",
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        color: VTheme.contrast,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Container(
                height: 36,
                width: 120,
                decoration: BoxDecoration(
                    color: VTheme.kPrimaryLightColor,
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 6, 8, 6),
                      child: Image.asset("assets/Icons/Facebook.png"),
                    ),
                    Text(
                      "Facebook",
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        color: VTheme.contrast,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(
            flex: 5,
          ),
          Text(
            "Don’t have an account? Sign Up",
            style: GoogleFonts.montserrat(fontSize: 12),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      )),
    );
  }
}
