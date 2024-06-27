
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Provider/My_provider.dart';


class Languagebottomsheet extends StatelessWidget {
  Languagebottomsheet({super.key});

  bool Isicon=true;

  @override
  Widget build(BuildContext context) {
    var provider =Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(onTap: (){
                provider.changeLanguage("ar");

              },
                child: Text(AppLocalizations.of(context)!.arbic,style: TextStyle(fontSize: 22,
                    fontWeight: FontWeight.w400,
                   color:provider.language=="en"? Colors.white:Colors.blue),),
              ),
              provider.language=="en"?SizedBox():Icon(Icons.done,color: Colors.blue),
            ],
          ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(onTap: (){
                provider.changeLanguage("en");
              },
                child: Text(AppLocalizations.of(context)!.enghlish,style: TextStyle(fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color:provider.language=="en"? Colors.blue:Colors.white),),
              ),
              provider.language=="en"?Icon(Icons.done,color: Colors.blue):SizedBox(),
            ],
          ),



      ],),
    );
  }
}
