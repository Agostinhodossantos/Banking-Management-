import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttermoneymanagementapp/constants/color_constant.dart';
import 'package:fluttermoneymanagementapp/models/card_model.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 8),
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            // Custom AppBar
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                 GestureDetector(
                   onTap: () {
                     print("hello world");
                   },
                   child: SvgPicture.asset('assets/svg/drawer_icon.svg'),
                 ),
                 
                  Container(
                    height: 59,
                    width: 59,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(image: AssetImage('assets/images/user_image.png'))
                    ),
                  )
                ],
              ),
            ),

            // Card section
            SizedBox(
              height: 25,
            ),

            Padding(
              padding: EdgeInsets.only(left:16, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Good Morning', style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: kBlackColor
                  ),),
                  Text('Amanda Alex', style: GoogleFonts.inter(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: kBlackColor
                  ),)
                ],
              ),
            ),

            Container(
              height: 199,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 16, right: 6),
                itemCount: cards.length,
                itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(right: 10),
                  height: 199,
                  width: 344,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: Color(cards[index].cardBackground)
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        child: SvgPicture.asset(cards[index].cardElementTop)
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: SvgPicture.asset(
                          cards[index].cardElementBottom
                        )
                      ),

                      Positioned(
                        left: 29,
                        top: 48,
                        child: Text("CARD NUMBER", style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: kWhiteColor
                        ),)
                      ),


                      Positioned(
                        left: 29,
                        top: 65,
                        child: Text(cards[index].cardNumber, style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: kWhiteColor
                        ),)
                      ),

                      Positioned(
                        right: 21,
                        top: 35,
                        child: 
                          Image.asset(
                            cards[index].cardType), 
                            width: 27, 
                            height: 27,
                        ),
                        Positioned(
                          left: 49,
                          bottom: 49,
                          child: Text('CARD HOLDERNAME')
                        )
                   
                    ],
                  )
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}