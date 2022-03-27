import 'package:demobloc/bloc/profile/profile_bloc.dart';
import 'package:demobloc/model/transaction_model.dart';
import 'package:demobloc/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/transaction_bloc/transaction_bloc.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  var list = [];
  bool loadData = true;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: BlocBuilder<TransactionBloc, TransactionState>(
        builder: (context, state) {
          print(">>>>>>>>>>>> ${state}");
          if (state is TransactionLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is TransactionSucess) {
            list.addAll(state.transModel.data);
            print("list>>>>>>>>>>>> ${list.length}");
          }
          return
            ListView.separated(
              itemBuilder: (BuildContext, index){
                return ListTile(
                  leading: CircleAvatar(backgroundImage: NetworkImage("https://picsum.photos/200/300"),),
                  title: Text("${list[index].productName}"),
                  subtitle: Text("${list[index].transactionId}"),
                );
              },
              separatorBuilder: (BuildContext,index)
              {
                return Divider(height: 1);
              },
              itemCount: list.length,
              shrinkWrap: true,
              padding: EdgeInsets.all(5),
              scrollDirection: Axis.vertical,
              controller: _scrollController
                ..addListener(() {
                  if (_scrollController.offset ==
                      _scrollController.position.maxScrollExtent) {
                    print("load next page") ;

                    BlocProvider.of<ProfileBloc>(context)
                        .add(GetProfile("1")) ;

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (c) => const ProfileScreen())) ;

                  }
                })
            );
        },
      )),
    );
  }
}
