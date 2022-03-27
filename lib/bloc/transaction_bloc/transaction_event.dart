part of 'transaction_bloc.dart';

abstract class TransactionEvent extends Equatable {
  const TransactionEvent();
}

class TransactionList extends TransactionEvent{
String StartDate ,EndDate ,CustomerId ;

TransactionList(this.StartDate, this.EndDate, this.CustomerId);
  @override
  List<Object?> get props => [StartDate, EndDate, CustomerId] ;

}

class TransactionDetail extends TransactionEvent{
  String transaction_id ;

  TransactionDetail(this.transaction_id);
  @override
  List<Object?> get props => [transaction_id] ;

}
