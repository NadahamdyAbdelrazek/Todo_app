
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/sheets/Language_bottom_sheet.dart';
import 'package:todo_app/sheets/Theme_bottom_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../Provider/My_provider.dart';
import '../Theme/My_theme.dart';

class Settingstab extends StatelessWidget {
  const Settingstab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            AppLocalizations.of(context)!.language,
            style: TextStyle(color: MyThemeData.primarycolor ,fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        InkWell(
          onTap: () {
            showModalBottomSheet(isDismissible: true,
              isScrollControlled: false,
              context: context,
              builder: (context) {
              return Languagebottomsheet();

              },);
          },
          child: Container(
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.symmetric(vertical: 12),
            width: double.infinity,
            decoration: BoxDecoration(
                color: provider.getBacKgroundImage(),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Colors.blue)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(provider.language=="en"?AppLocalizations.of(context)!.enghlish:AppLocalizations.of(context)!.arbic,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.blue)),
                  Icon(Icons.arrow_drop_down, color: Colors.blue,),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 32,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(AppLocalizations.of(context)!.mode,
              style: TextStyle(color: MyThemeData.primarycolor,fontSize: 14, fontWeight: FontWeight.w700)),
        ),
        SizedBox(
          height: 12,
        ),
        InkWell(
          onTap: () {
            showModalBottomSheet(isDismissible: true,
              isScrollControlled: false,
              context: context,
              builder: (context) {
                return Themebottomsheet();

              },);
          },
          child: Container(
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.symmetric(vertical: 12),
            width: double.infinity,
            decoration: BoxDecoration(
                color: provider.getBacKgroundImage(),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Colors.blue)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                   provider.Mytheme==ThemeMode.light? AppLocalizations.of(context)!.light:AppLocalizations.of(context)!.dark,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.blue),
                  ),
                  Icon(Icons.arrow_drop_down, color: Colors.blue,),
                ],
              ),
            ),),
        ),

      ],

    );
  }
}
