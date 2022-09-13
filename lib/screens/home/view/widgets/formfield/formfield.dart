import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormText extends StatelessWidget {
  const FormText({Key? key,this.namecontroller,this.numbercontroller}) : super(key: key);
  final TextEditingController? namecontroller ;
  final  TextEditingController? numbercontroller;
  @override
  Widget build(BuildContext context) {
    return
    Column(
      children: [
        TextFormField(
                                        autocorrect: false,
                                        controller: namecontroller,
                                        decoration: const InputDecoration(
                                            labelText: "Name ",
                                            fillColor: Colors.white12,
                                            filled: true,
                                            border: OutlineInputBorder()),
                                        autovalidateMode:
                                            AutovalidateMode.disabled,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'pleas enter name';
                                          }
                                          return null;
                                        },
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                      TextFormField(
                                        controller: numbercontroller,
                                        autocorrect: false,
                                        decoration: const InputDecoration(
                                          fillColor: Colors.white12,
                                          filled: true,
                                          labelText: "Number",
                                          border: OutlineInputBorder(),
                                        ),keyboardType: TextInputType.phone,
                                        inputFormatters: [
                                         FilteringTextInputFormatter(
                                          allow:true,
                                           RegExp(r'^[0-9]*$'),

                                        ),
                                        LengthLimitingTextInputFormatter(10)
                                        ],
                                        autovalidateMode:
                                            AutovalidateMode.disabled,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'pleas enter number';
                                          }
                                          return null;
                                        },
                                      ),
      ],
    );
  }
}