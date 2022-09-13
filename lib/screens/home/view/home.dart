import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as validate;
import 'package:provider/provider.dart';
import 'package:user_mgt/screens/detailes/provider/detailes_provider.dart';
import 'package:user_mgt/screens/detailes/view/detailes.dart';
import 'package:user_mgt/screens/home/model/home.model.dart' as model;
import 'package:user_mgt/screens/home/provider/home_provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!.email;
    final size = MediaQuery.of(context).size;
    Widget buildUser(model.User user) {
      return InkWell(
        onTap: () {
          context.read<DetailesProvider>().edit(false);
          Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) => DeatailesPage(
                    user: user,
                  )));
        },
        child: Card(
          color: Colors.white60,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: MemoryImage(
                    const Base64Decoder().convert(user.image.toString()),
                  ),
                  radius: 50,
                ),
                ListTile(
                  title: Text("Name : ${user.name}"),
                  subtitle: Text("Ph : ${user.number}"),
                )
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Employees"),
        actions: [
          PopupMenuButton(
              itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () {
                                context.read<HomeProvider>().pickimage();
                              },
                              child: Consumer<HomeProvider>(
                                  builder: (context, value, child) =>
                                      value.image.isEmpty
                                          ? const CircleAvatar(
                                              maxRadius: 25,
                                              minRadius: 25,
                                            )
                                          : CircleAvatar(
                                              maxRadius: 25,
                                              backgroundImage: MemoryImage(
                                                  const Base64Decoder().convert(
                                                      value.image.toString())),
                                            ))),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.edit,
                                size: 20,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ))
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: Text(user.toString()),
                    ),
                    PopupMenuItem(
                      value: 3,
                      child: ElevatedButton(
                          onPressed: () {
                            FirebaseAuth.instance.signOut();
                            Navigator.pop(context);
                          },
                          child: const Text("Loge Out")),
                    )
                  ])
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: ListView(
        children: [
          Container(
            decoration: (BoxDecoration(
                border: Border.all(
                    width: 4, color: const Color.fromARGB(255, 0, 0, 0)),
                image: const DecorationImage(
                    image: NetworkImage(
                        'https://i.pinimg.com/564x/91/67/29/9167296ce7542865e8c05858ba857dc0.jpg'),
                    fit: BoxFit.cover,
                    opacity: 0.6,
                    colorFilter: ColorFilter.srgbToLinearGamma()))),
            height: size.height * 0.2,
            width: double.infinity,
            child: Center(
              child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                        barrierColor: const Color.fromARGB(255, 241, 241, 241)
                            .withOpacity(0.6),
                        context: context,
                        builder: (ctx) {
                          return AlertDialog(
                            contentPadding: const EdgeInsets.all(50),
                            clipBehavior: Clip.none,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            backgroundColor:
                                const Color.fromARGB(255, 43, 29, 24),
                            content: GestureDetector(
                              onTap: () =>
                                  context.read<HomeProvider>().pickimage(),
                              child: Consumer<HomeProvider>(
                                  builder: (context, value, child) =>
                                      value.image.isEmpty
                                          ? const CircleAvatar(
                                              radius: 50,
                                            )
                                          : CircleAvatar(
                                              radius: 50,
                                              backgroundImage: MemoryImage(
                                                  const Base64Decoder().convert(
                                                      value.image.toString())),
                                            )),
                            ),
                            actions: [
                              Form(
                                  key: context.watch<HomeProvider>().formkey,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        autocorrect: false,
                                        controller: context
                                            .watch<HomeProvider>()
                                            .namecontroller,
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
                                        controller: context
                                            .watch<HomeProvider>()
                                            .numbercontroller,
                                        autocorrect: false,
                                        decoration: const InputDecoration(
                                          fillColor: Colors.white12,
                                          filled: true,
                                          labelText: "Number",
                                          border: OutlineInputBorder(),
                                        ),
                                        keyboardType: TextInputType.phone,
                                        inputFormatters: [
                                          validate.FilteringTextInputFormatter(
                                            allow: true,
                                            RegExp(r'^[0-9]*$'),
                                          ),
                                          validate
                                              .LengthLimitingTextInputFormatter(
                                                  10)
                                        ],
                                        autovalidateMode:
                                            AutovalidateMode.disabled,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'pleas enter number';
                                          } else if (value.length < 10) {
                                            return 'required 10 digits';
                                          }
                                          return null;
                                        },
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                      ElevatedButton(
                                          onPressed: () {
                                            context
                                                .read<HomeProvider>()
                                                .validate(context);
                                          },
                                          child: const Text("Add Employee")),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                      ),
                                    ],
                                  ))
                            ],
                          );
                        });
                  },
                  child: const Text("Add new employee")),
            ),
          ),
          Container(
            height: size.height * 0.69,
            width: double.infinity,
            decoration: (BoxDecoration(
                border: Border.all(
                    width: 4, color: const Color.fromARGB(255, 0, 0, 0)),
                image: const DecorationImage(
                    image: AssetImage(
                        'assets/images/adfa32225a49b0e59a66beead6dc65a3.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.srgbToLinearGamma()))),
            child: StreamBuilder<List<model.User>>(
              stream: context.watch<HomeProvider>().readUser(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text(
                    "Somthing went wrong${snapshot.error}",
                    style: const TextStyle(color: Colors.white),
                  );
                } else if (snapshot.hasData) {
                  final user = snapshot.data;
                  return GridView(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      mainAxisExtent: 200,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    shrinkWrap: true,
                    primary: false,
                    children: user!.map(buildUser).toList(),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          )
        ],
      ),
    );
  }
}
