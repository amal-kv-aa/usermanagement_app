import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:user_mgt/screens/home/model/home.model.dart' as model;
import 'package:user_mgt/screens/home/provider/home_provider.dart';

class DetailesProvider with ChangeNotifier {
  bool isedit = false;
  final TextEditingController namecontroller = TextEditingController();

  final TextEditingController numbercontroller = TextEditingController();

  final formkey = GlobalKey<FormState>();
  edit(bool value) {
    isedit = value;
    notifyListeners();
  }

//**********************update user datas*********************/

  updateuser(
      TextEditingController namecontroller,
      TextEditingController numbercontroller,
      model.User user,
      BuildContext context,image) async {
    final docUser = FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser!.email.toString())
        .doc(user.id);
    await docUser.update({
      'name': namecontroller.text.trim(),
      'number': numbercontroller.text.trim(),
      'image':image
    });
   Navigator.pop(context);
  }
//******************************delete***************************//

  delete(model.User user, BuildContext context) async {
    final docUser = FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser!.email.toString())
        .doc(user.id);
    await docUser.delete();
    Navigator.pop(context);
  }

  validatefield(
      model.User user,
      BuildContext context) async {
    if (formkey.currentState!.validate() == false) {
      return;
    } else {
      updateuser(namecontroller, numbercontroller, user, context,context.read<HomeProvider>().image);
      Navigator.pop(context);
      namecontroller.clear();
      numbercontroller.clear();
      context.read<HomeProvider>().image ='';
      notifyListeners();
    }
  }
}
