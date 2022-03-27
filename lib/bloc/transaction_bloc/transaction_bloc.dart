import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demobloc/model/transaction_model.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

import '../../repo/transaction_repo.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  // TransactionBloc(TransactionState initialState) : super(getTransactions());

  var repo  = GetIt.I.get<TransactionRepository>() ;

  TransactionBloc() : super(TransactionInitial()){
  on<TransactionList>(getTransactions);
  }

Future<FutureOr<void>> getDetail(TransactionList event , Emitter<TransactionState> emit ) async {}

  Future<FutureOr<void>> getTransactions(
      TransactionList event, Emitter<TransactionState> emit) async {

    try{
      emit(TransactionLoading()) ;
      final model = await repo.getTransation(event.StartDate, event.EndDate, event.CustomerId) ;
      if(model==null){
        emit(TransactionFailed("Api error")) ;
      }else{
        emit(TransactionSucess(model)) ;
      }
    }catch(e){
      emit(TransactionFailed(e.toString())) ;
    }
  }
}


