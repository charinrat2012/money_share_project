// ignore_for_file: prefer_const_constructors, camel_case_types, unused_import, prefer_const_literals_to_create_immutables, must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';

class showMoneyShareUI extends StatefulWidget {

  double? money, tip, moneyShare;
  int person;

  showMoneyShareUI({
    super.key,
    this.money,
    this.tip,
    this.moneyShare,
    required this.person,
  });

  @override
  State<showMoneyShareUI> createState() => _ShowMoneyShareUIState();
}

class _ShowMoneyShareUIState extends State<showMoneyShareUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 193, 193),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 252, 74, 74),
        title: Text(
          'มาแชร์เงินกันเถอะ(ผล)',
          style: GoogleFonts.itim(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
              ),
              CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.20,
                backgroundColor: Color.fromARGB(255, 252, 74, 74),
                child: Image.asset(
                  'assets/images/money.png',
                  width: MediaQuery.of(context).size.width * 0.25,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Text(
                'จำนวนเงินที่จะหาร',
                style: GoogleFonts.itim(
                  color: Color.fromARGB(255, 252, 74, 74),
                  fontSize: 20,
                ),
              ),
              Text(
                widget.money!.toStringAsFixed(2).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},'),
                style: GoogleFonts.itim(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              Text(
                'บาท',
                style: GoogleFonts.itim(
                  color: Color.fromARGB(255, 252, 74, 74),
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Text(
                'จำนวนคนที่จะหาร',
                style: GoogleFonts.itim(
                  color: Color.fromARGB(255, 252, 74, 74),
                  fontSize: 20,
                ),
              ),
              Text(
                widget.person.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},'),
                style: GoogleFonts.itim(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              Text(
                'คน',
                style: GoogleFonts.itim(
                  color: Color.fromARGB(255, 252, 74, 74),
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Text(
                'จำนวนเงินทิป',
                style: GoogleFonts.itim(
                  color: Color.fromARGB(255, 252, 74, 74),
                  fontSize: 20,
                ),
              ),
              Text(
                widget.tip!.toStringAsFixed(2).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},'),
                style: GoogleFonts.itim(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              Text(
                'บาท',
                style: GoogleFonts.itim(
                  color: Color.fromARGB(255, 252, 74, 74),
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                'แชร์เงินคนละ',
                style: GoogleFonts.itim(
                  color: Color.fromARGB(255, 252, 74, 74),
                  fontSize: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50,right: 50),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 252, 74, 74),
                  ),
                  //height: MediaQuery.of(context).size.height * 0.1,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text(
                        widget.moneyShare!.toStringAsFixed(2).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},'),
                        style: GoogleFonts.itim(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                'บาท',
                style: GoogleFonts.itim(
                  color: Color.fromARGB(255, 252, 74, 74),
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
