// Imports
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:number_lookup_web/constants/strings.dart';
import '../constans/app_constants.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(kBorderRadius)),
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            Row(
              children: [
                Text('identified by'),
                SizedBox(width: 6),
                Text(
                  'Truecaller',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text('Rahil Patel Lenditt', style: TextStyle(fontSize: 22)),
              ],
            ),
            SizedBox(height: 15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(EvaIcons.phone, size: 18, color: Colors.grey),
                SizedBox(width: 6),
                Column(
                  children: [
                    Text('Carrier - Airtel'),
                    SizedBox(height: 4),
                    Text('+91 1234567890', style: TextStyle(color: Colors.grey))
                  ],
                )
              ],
            ),
            SizedBox(height: 6),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(EvaIcons.compass, size: 20, color: Colors.grey),
                SizedBox(width: 6),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Address'),
                    SizedBox(height: 4),
                    Text('Gujarat, India - Local time 18:20',
                        style: TextStyle(color: Colors.grey))
                  ],
                )
              ],
            )
          ]),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(Strings.kModeratedTxt,
              style: TextStyle(color: Colors.grey, fontSize: 12)),
        )
      ],
    );
  }
}
