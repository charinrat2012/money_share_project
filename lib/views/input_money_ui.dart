// ignore_for_file: prefer_const_constructors, camel_case_types, unused_import, prefer_const_literals_to_create_immutables, duplicate_import, prefer_is_empty, sort_child_properties_last, unused_local_variable

import 'dart:io';

import "package:flutter/material.dart";
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_share_project/views/show_money_share_ui.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';

class InputMoneyUI extends StatefulWidget {
  const InputMoneyUI({super.key});

  @override
  State<InputMoneyUI> createState() => _InputMoneyUIState();
}

class _InputMoneyUIState extends State<InputMoneyUI> {
  bool? checkStatus = false;


  TextEditingController moneyCtrl = TextEditingController(text: '');
  TextEditingController personCtrl = TextEditingController(text: '');
  TextEditingController tipCtrl = TextEditingController(text: '');

 
  warningMessage(context, msg) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        title: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 252, 74, 74),
            ),
            child: Text(
              'คำเตือน',
              style: GoogleFonts.itim(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        content: Text(
          msg,
          style: GoogleFonts.itim(
            color: Color.fromARGB(255, 252, 74, 74),
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'ตกลง',
              style: GoogleFonts.itim(
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              backgroundColor: Color.fromARGB(255, 252, 74, 74),
            ),
          ),
        ],
      ),
    );
  }

  
  ShowMoneyShare(double money, double tip, double moneyShare, int person) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => showMoneyShareUI(
          money: money,
          tip: tip,
          moneyShare: moneyShare,
          person: person,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 193, 193),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 252, 74, 74),
        title: Text(
          'แชร์เงินกันเถอะ',
          style: GoogleFonts.kanit(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.1,
                right: MediaQuery.of(context).size.width * 0.1),
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
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  TextField(
                    controller: moneyCtrl,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r'^[0-9]+.?[0-9]*'),
                      ),
                    ],
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'ป้อนจำนวนเงิน (บาท)',
                      hintStyle: GoogleFonts.kanit(color: Colors.white),
                      prefixIcon: Icon(
                        FontAwesomeIcons.moneyBill,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  TextField(
                    controller: personCtrl,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r"\d+([.]\d+)?"),
                      ),
                    ],
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'ป้อนจำนวนคน (คน)',
                      hintStyle: GoogleFonts.kanit(color: Colors.white),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        onChanged: (param) {
                        
                          if (param == false) {
                            setState(() {
                              tipCtrl.text = '';
                            });
                          }
                          setState(() {
                            checkStatus = param;
                          });
                        },
                        value: checkStatus,
                        activeColor: Colors.red,
                        side: BorderSide(color: Colors.red),
                      ),
                      Text(
                        'เงินทิป (บาท)',
                        style: GoogleFonts.kanit(
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  TextField(
                    controller: tipCtrl,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r'^[0-9]+.?[0-9]*'),
                      ),
                    ],
                    enabled: checkStatus,
                    decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'ป้อนจำนวนเงินทิป (บาท)',
                      hintStyle: GoogleFonts.kanit(color: Colors.white),
                      prefixIcon: Icon(
                        FontAwesomeIcons.moneyBill,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            double money = 0, tip = 0, moneyShare = 0;
                            int person = 0;
                           
                            if (moneyCtrl.text.length == 0) {
                           
                              warningMessage(context, 'ยังไม่ป้อนเงิน');
                            } else if (double.parse(moneyCtrl.text) == 0) {
                             
                              warningMessage(context, 'เงินไม่ควรเป็น 0');
                            } else if (personCtrl.text.isEmpty == true) {
                            
                              warningMessage(context, 'ยังไม่ป้อนคน');
                            } else if (int.parse(personCtrl.text) == 0) {
                           
                              warningMessage(context, 'คนไม่ควรเป็น 0');
                            } else if (checkStatus == true) {
                              if (tipCtrl.text.isEmpty == true) {
                              
                                warningMessage(context, 'ยังไม่ป้อนทิป');
                              } else if (double.parse(tipCtrl.text) == 0) {
                                
                                warningMessage(context, 'ทิปไม่ควรเป็น 0');
                              } else {
                                
                                money = double.parse(moneyCtrl.text);
                                tip = double.parse(tipCtrl.text);
                                person = int.parse(personCtrl.text);
                                moneyShare = (money + tip) / person;
                                ShowMoneyShare(money, tip, moneyShare, person);
                              }
                            } else {
                        
                              money = double.parse(moneyCtrl.text);
                              person = int.parse(personCtrl.text);
                              moneyShare = money / person;
                              ShowMoneyShare(money, tip, moneyShare, person);
                            }
                          },
                          icon: Icon(
                            Icons.calculate,
                            color: Colors.white,
                          ),
                          label: Text(
                            'คำนวณ',
                            style: GoogleFonts.kanit(
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 252, 74, 74),
                              fixedSize: Size.fromHeight(
                                55.0,
                              )),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              tipCtrl.text = '';
                              personCtrl.text = '';
                              moneyCtrl.text = '';
                              checkStatus = false;
                            });
                          },
                          icon: Icon(
                            Icons.cancel,
                            color: Colors.white,
                          ),
                          label: Text(
                            'ยกเลิก',
                            style: GoogleFonts.kanit(
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 252, 74, 74),
                              fixedSize: Size.fromHeight(
                                55.0,
                              )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
