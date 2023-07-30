// Imports
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:number_lookup_web/app/models/number_info.dart';
import 'package:number_lookup_web/constants/strings.dart';
import '../constans/app_constants.dart';

class ContactCard extends StatelessWidget {
  final NumberInfo numberInfo;
  const ContactCard({required this.numberInfo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (numberInfo.name == null) return const SizedBox.shrink();

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
                const Text('identified by'),
                const SizedBox(width: 6),
                Text(
                  'Truecaller',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(children: [
              Text(numberInfo.name ?? '', style: const TextStyle(fontSize: 22)),
            ]),
            const SizedBox(height: 15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(EvaIcons.phone, size: 18, color: Colors.grey),
                const SizedBox(width: 6),
                Column(
                  children: [
                    Text('Carrier - ${numberInfo.carrier}'),
                    const SizedBox(height: 4),
                    Text(numberInfo.number ?? '',
                        style: const TextStyle(color: Colors.grey))
                  ],
                )
              ],
            ),
            const SizedBox(height: 6),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(EvaIcons.compass, size: 20, color: Colors.grey),
                const SizedBox(width: 6),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Address'),
                    const SizedBox(height: 4),
                    Text('${numberInfo.address} - Local time 18:20',
                        style: const TextStyle(color: Colors.grey))
                  ],
                )
              ],
            )
          ]),
        ),
        const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(Strings.kModeratedTxt,
                style: TextStyle(color: Colors.grey, fontSize: 12)))
      ],
    );
  }
}
