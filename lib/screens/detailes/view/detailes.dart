import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:user_mgt/screens/detailes/provider/detailes_provider.dart';
import 'package:user_mgt/screens/detailes/view/widgets/alert.dart';
import 'package:user_mgt/screens/home/model/home.model.dart' as model;
import 'package:user_mgt/screens/home/provider/home_provider.dart';

class DeatailesPage extends StatelessWidget {
 const  DeatailesPage({Key? key,this.user}) : super(key: key);
  final model.User? user;
  @override
  Widget build(BuildContext context) {
    context.read<DetailesProvider>().namecontroller.text = user!.name;
    context.read<DetailesProvider>().numbercontroller.text = user!.number;
     final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(),
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                height: size.height * 0.6,
                child: Card(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: context.watch<DetailesProvider>().isedit == true
                        ? ListView(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: size.height * 0.06,
                                  ),
                                   IconButton(onPressed: (){
                                    ShowConform.alertDlt(context,user!);
                                       
                                   }, icon:const Icon(Icons.delete)),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  context.watch<HomeProvider>().image.isEmpty ?
                                  Container(
                                    height: size.height * 0.2,
                                    width: size.width * 0.4,
                                    color: Colors.brown,
                                    child: ElevatedButton.icon(
                                        onPressed: () {  context.read<HomeProvider>().pickimage();},
                                           icon:const Icon(Icons.add),
                                        label: const Text('Add Image')),
                                  )
                                 :
                                  Container(
                                    height: size.height * 0.2,
                                    width: size.width * 0.4,
                                    decoration: BoxDecoration(image: DecorationImage(image: MemoryImage(const Base64Decoder().convert(context.watch<HomeProvider>().image))),
                                  ),),
                                  SizedBox(
                                    height: size.height * 0.03,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Form(
                                      key: context.watch<DetailesProvider>().formkey,
                                      child: Column(
                                        children: [

                                          TextFormField(
                                            controller: context.watch<DetailesProvider>().namecontroller,
                                            decoration: InputDecoration(
                                              prefixIcon:const Icon(Icons.person),
                                              border:const  OutlineInputBorder(),
                                                prefix:const Text('name    :'),
                                                hintText:user!.name),
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
                                            height: size.height * 0.01,
                                          ),
                                          TextFormField(
                                            controller: context.watch<DetailesProvider>().numbercontroller,
                                            decoration:  InputDecoration(
                                               prefixIcon: const Icon(Icons.mobile_friendly),
                                               border:  const OutlineInputBorder(),
                                                prefix:const Text('number :'),
                                                hintText:user!.number
                                                ),
                                                
                                                 keyboardType: TextInputType.phone,
                                        inputFormatters: [
                                          FilteringTextInputFormatter(
                                            allow: true,
                                            RegExp(r'^[0-9]*$'),
                                          ),
                                          LengthLimitingTextInputFormatter(
                                                  10)
                                        ],
                                        autovalidateMode:
                                            AutovalidateMode.disabled,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'pleas enter number ${value.length}';
                                          }
                                          else if(value.length < 10){
                                             return 'required 10 digits';
                                          }
                                          return null;
                                        },
                                          ),
                                          SizedBox(
                                            height: size.height * 0.03,
                                          ),
                                          ElevatedButton(
                                              onPressed: () {
                                                context.read<DetailesProvider>().validatefield(user!,context);
                                              },
                                              child:const Text('Make changes'))
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ////////end///////
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: size.height * 0.06,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        context
                                            .read<DetailesProvider>()
                                            .edit(true);
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                        color: Colors.green[400],
                                      ))
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: size.height * 0.2,
                                    width: size.width * 0.4,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: MemoryImage(
                                              const Base64Decoder().convert(
                                                 user!.image.toString())),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.03,
                                  ),
                                  Column(
                                    children: [
                                      Text("Name : ${user!.name}"),
                                      SizedBox(
                                        height: size.height * 0.01,
                                      ),
                                      Text("Ph : ${user!.number}"),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  
  }
}