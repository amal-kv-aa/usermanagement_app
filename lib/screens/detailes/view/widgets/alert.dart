import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_mgt/screens/home/model/home.model.dart';

import '../../provider/detailes_provider.dart';

class ShowConform extends StatelessWidget {
  const ShowConform({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,) {
    return
  const SizedBox();
  }
static  alertDlt(BuildContext context,User user){
    showDialog(
    barrierColor: const Color.fromARGB(255, 55, 29, 29),
    context: context,
   builder: (context) {
     return
     AlertDialog(
      title: const Text("Delete Data ?"),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
             ElevatedButton(onPressed: (){
               Navigator.pop(context);
            }, child:const Text('No',style: TextStyle(color: Colors.white),)),
            SizedBox(width: MediaQuery.of(context).size.height*0.03),
            ElevatedButton(onPressed: (){
            context.read<DetailesProvider>().delete(user, context);
            Navigator.pop(context);
            Navigator.pop(context);
            }, child:const Text('Ok',style: TextStyle(color: Colors.white),)),
           
          ],
        )
      ],);
   },
   );
  }
}