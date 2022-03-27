import 'dart:convert';

import 'package:demobloc/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/profile/profile_bloc.dart';
import '../model/profile_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  late ProfileModel userData  ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              print(">>>>>>>>>>>> ${state}");
              if (state is ProfileLoader) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is ProfileSucess) {
                print(">>>>>>>>>>>>state.model ${json.encode(state.model)}");
                userData = state.model ;
              }
              return
                ListView(
                  children: <Widget>[
                    Container(
                      height: 250,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.red, Colors.deepOrange.shade300],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          stops: [0.5, 0.9],
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.red.shade300,
                                minRadius: 35.0,
                                child: Icon(
                                  Icons.call,
                                  size: 30.0,
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  await showDialog(
                                      context: context,
                                      builder: (_) => ImageDialog(userData.data.avatar)
                                  );
                                  //test
                                },
                                child: CircleAvatar(
                                  backgroundColor: Colors.white70,
                                  minRadius: 60.0,
                                  child: CircleAvatar(
                                    radius: 50.0,
                                    backgroundImage:
                                    NetworkImage('${userData.data.avatar}'),
                                  ),
                                ),
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.red.shade300,
                                minRadius: 35.0,
                                child: Icon(
                                  Icons.message,
                                  size: 30.0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${userData.data.firstName} ${userData.data.lastName} ',
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),

                        ],
                      ),
                    ),

                    Container(
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              'Email',
                              style: TextStyle(
                                color: Colors.deepOrange,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              '${userData.data.email}',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white
                              ),
                            ),
                          ),
                          Divider(),

                        ],
                      ),
                    )
                  ],
                );

            },
          )),
    );
  }


}

class ImageDialog extends StatelessWidget {
  String avatar;
  ImageDialog(this.avatar);
  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
          width: 200,
          height: 200,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network (avatar ,fit: BoxFit.cover, ),
          ),

        )

      // child: Container(
      //   width: 200,
      //   height: 200,
      //   decoration: BoxDecoration(
      //       image: DecorationImage(
      //           image: ExactAssetImage('assets/tamas.jpg'),
      //           fit: BoxFit.cover
      //       )
      //   ),
      // ),
    );
  }
}
