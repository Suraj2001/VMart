import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vmart/Pages/landing.dart';
import 'package:vmart/theme.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
          onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const LandingPage(),
              )),
          child: Container(
            height: 50,
            width: 200,
            color: VTheme.kPrimaryLightColor,
            child: Center(
              child: Text(
                "Get Back To landing Page",
                style: GoogleFonts.nunito(
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
            ),
          )),
    );
  }
}
