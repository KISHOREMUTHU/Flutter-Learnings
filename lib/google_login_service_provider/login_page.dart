import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'google_login_configs.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Size? size = MediaQuery.of(context).size;
    Color? color = const Color(0xFF27E9F7);
    return SafeArea(
      child: Scaffold(
        body: Container(

          alignment: Alignment.center,
         height: size.height,
          width: size.width,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/bg.gif')
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height *  0.45,
                width: size.width * 0.75,
                child: SvgPicture.asset("assets/quiz.svg"),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Text("SEIQ Tool",
                    style: GoogleFonts.montserrat(
                        fontSize: 35,
                        color: color,
                        fontWeight: FontWeight.bold
                    ),

                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:30.0,bottom: 50),
                child: GoogleSignInButtonWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GoogleSignInButtonWidget extends StatelessWidget {
  const GoogleSignInButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Color? color = const Color(0xFF27E9F7);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 80,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: color.withAlpha(60),
              spreadRadius: 5,
              blurRadius: 10,
            ),
          ],
        ),
        child: OutlinedButton.icon(
          onPressed: () {
            final provider =
            Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.login();
          },
          icon: FaIcon(
            FontAwesomeIcons.google,
            color: Theme.of(context).primaryColor,
            size: 25,
          ),
          label: Text(' Sign In With Google ',
              style: GoogleFonts.montserrat(
                color: Theme.of(context).primaryColor,
                fontSize: 24,
              )),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(color),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: color),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
