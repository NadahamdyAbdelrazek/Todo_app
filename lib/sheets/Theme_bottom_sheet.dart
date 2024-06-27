import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Provider/My_provider.dart';
class Themebottomsheet extends StatelessWidget {
  Themebottomsheet({super.key});
  bool Isicon=true;
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        children: [
             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(onTap: (){
                  provider.changeMode(ThemeMode.dark);
                },
                  child: Text(AppLocalizations.of(context)!.dark,style: TextStyle(fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: provider.Mytheme==ThemeMode.light?Colors.black: Colors.blue),),
                ),
                provider.Mytheme==ThemeMode.light?SizedBox(): Icon(Icons.done,color: Colors.blue),
              ],
            ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(onTap: (){
                provider.changeMode(ThemeMode.light);
              },
                child: Text(AppLocalizations.of(context)!.light,style: TextStyle(fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: provider.Mytheme==ThemeMode.light?Colors.blue:Colors.white),),
              ),
              provider.Mytheme==ThemeMode.light? Icon(Icons.done,color: Colors.blue):SizedBox(),
            ],
          ),



        ],),
    );
  }
}
