import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rec_hackoverflow/quiz_pages/academic_quiz_page.dart';
import 'google_login_service_provider/google_login_configs.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size? size = MediaQuery.of(context).size;




    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(


      body: Container(
        decoration: const BoxDecoration(
          
          gradient: LinearGradient(


            colors: [
              Color(0xFF3550DC),
              Color(0xFF27E9F7),

            ],
          ),
        ),
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: IconButton(onPressed: (){
                        final provider =
                        Provider.of<GoogleSignInProvider>(context, listen: false);
                        provider.logout();
                      }, icon: Icon(FontAwesomeIcons.signOut, size: 40, color: Theme.of(context).primaryColor,)),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,30,30,20),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                user!.photoURL!.toString()
                            )
                          )

                        ),

                      ),
                    ),

                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0,0,0,16),
                  child: Text("Hello, " + user.displayName!,
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0,0,0,40),
                  child: Text("Let's have a small SEIQ Quiz !!!",
                    style: GoogleFonts.montserrat(
                      fontSize: 25,
                      color: Theme.of(context).scaffoldBackgroundColor,
                      fontWeight: FontWeight.bold
                    ),

                  ),
                )
              ],
            ),
            Container(
               height: size.height * .63,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(topLeft:Radius.circular(50),topRight: Radius.circular(50))
              ),
              child: Center(
                child: Column(
                  children: [
                     SizedBox(
                       height: size.height *  0.4,
                         width: size.width * 0.7,
                         child: SvgPicture.asset("assets/quiz.svg"),
                     ),
                    MaterialButton(
                      onPressed:(){
                       Navigator.push(context, MaterialPageRoute(builder: (context) => AcademicsQuizPage()));
                    }, 
                      child: Container(
                        height: size.height * 0.08,
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Color(0xFF27E9F7),
                          borderRadius: BorderRadius.circular(size.height * 0.1)
                        ),
                        child: Center(
                          child: Text('Start Quiz !',
                           style: GoogleFonts.montserrat(
                             fontWeight: FontWeight.bold,
                             fontSize: 20,
                             color: Theme.of(context).scaffoldBackgroundColor
                           ),
                          ),
                          
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  customDivider(String title) {
    Color? color = const Color(0xFF78fe04);
    return Container(
      color: Theme.of(context).primaryColor,
      child: Row(
        children: [
          Expanded(
            child: Container(
              color: color,
              height: 10,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: color,
              ),
              borderRadius: BorderRadius.circular(13),
              color: Theme.of(context).primaryColor,
            ),
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.start,
                style: GoogleFonts.nunito(
                  color: color,
                  fontSize: 22,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: color,
              height: 10,
            ),
          ),
        ],
      ),
    );
  }

  List topImageCarousel = [
    "assets/news1.jpg",
    "assets/news2.jpg",
    "assets/news3.jpg",
    "assets/news4.jpg",
    "assets/news5.jpg",
  ];

  // ignore: non_constant_identifier_names





}
