part of 'hospital_cubit.dart';

abstract class HospitalState extends Equatable {
  const HospitalState();

  @override
  List<Object> get props => [];
}

class HospitalInitial extends HospitalState {}

class HospitalLoading extends HospitalState {}

class HospitalError extends HospitalState {
  final String error;

  const HospitalError(this.error);

  @override
  List<Object> get props => [error];

  get message => null;
}

class HospitalData extends HospitalState {
  final HospitalModel data;

  const HospitalData(this.data);

  @override
  List<Object> get props => [data];
}
