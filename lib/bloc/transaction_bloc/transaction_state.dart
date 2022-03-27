part of 'transaction_bloc.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();
}

class TransactionInitial extends TransactionState {
  @override
  List<Object> get props => [];
}
class TransactionLoading extends TransactionState {
  @override
  List<Object> get props => [];
}

class TransactionSucess extends TransactionState {
  final TransactionModel transModel ;
  const TransactionSucess(this.transModel);
  @override
  List<Object> get props => [transModel];
}

class TransactionFailed extends TransactionState {
  String error ;
  TransactionFailed(this.error);
  @override
  List<Object> get props => [error];
}