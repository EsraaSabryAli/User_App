// ignore_for_file: prefer_const_constructors, unused_import, missing_required_param, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(Ss());
}
   
class Ss extends StatelessWidget {
  final data ;

  const Ss({super.key, this.data});
  void launchWhatsapp({@required number, @required message}) async {
    String whatsAppURL = "whatsapp://send?+2001211406202";
    launchUrl(Uri.parse(whatsAppURL));
  }

  launchPhoneDialer(String phoneNumber) async {
    String url = "tel:$phoneNumber";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Color.fromRGBO(118, 165, 209, 1),
            // Adjust the size as needed
          ),
          //  backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 12,
                    decoration: InputDecoration(
                      hintText: '${data['phoneNumber']} ${data['phoneNumber']}',
                      hintStyle: TextStyle(fontSize: 14, color: Colors.black),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 10,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    OutlinedButton.icon(
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                          fontSize: 15,
                        ),
                        onPrimary: Colors.black,
                        side: BorderSide(width: 0, color: Colors.white),
                        backgroundColor: Color.fromRGBO(118, 165, 209, 1),
                      ),
                      onPressed: () {},
                      icon: Icon(
                        Icons.local_offer_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                      label: Text(
                        "Make Offer ",
                      ),
                    ),
                    OutlinedButton.icon(
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                          fontSize: 15,
                        ),
                        onPrimary: Colors.black,
                        side: BorderSide(width: 0, color: Colors.white),
                        backgroundColor: Color.fromRGBO(118, 165, 209, 1),
                      ),
                      onPressed: () {},
                      icon: Icon(
                        Icons.calendar_month_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                      label: Text(
                        " Tour Request ",
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 19),
                // Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: [
                //       InkWell(
                //         onTap: () {
                //           launchWhatsapp();
                //         },
                //         child: Image.asset(
                //           'images/image/test1.jpg',
                //           height: 70,
                //           width: 70,
                //         ),
                //       ),
                //         InkWell(
                //         onTap: () {
                //         launchPhoneDialer("+201211406202");
                //         },
                //         child: Image.asset(
                //           'images/image/44.jpg',
                //           height: 50,
                //           width: 50,
                //         ),
                //       ),
                     
                //     ])
              ], // close the Column children list here
            ),
          ),
        ),
      ),
    );
  }
}
