import 'dart:convert';

import 'package:demobloc/model/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

abstract class TransactionRepository {
  Future<TransactionModel?> getTransation
      (String StartDate , String EndDate , String CustomerId) ;
}

class TransactionDataRepository extends TransactionRepository{
  @override
  Future<TransactionModel?> getTransation(String StartDate,
      String EndDate, String CustomerId) async {

    try {
      var url = "https://fintexi.in/AndroidAPI/getTransactionById";

      var map =  Map() ;
      map["StartDate"] = StartDate;
      map["CustomerId"] = CustomerId;
      map["EndDate"] = EndDate;
      print("map>>>>>> ${map.toString()}");
      final response = await http.post(Uri.parse(url),
        body: map,
      ) ;
      print("response>>>>>> ${response.body}");
      final root = jsonDecode(response.body);
      if (root['Status']) {
        return TransactionModel.fromJson(json.decode(response.body)) ;
      } else {
        return null ;
      }

    }catch(e){
      print('$e');
    }
    throw UnimplementedError();


  }

}