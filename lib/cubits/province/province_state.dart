part of 'province_cubit.dart';

abstract class ProvinceState extends Equatable {
  const ProvinceState();

  @override
  List<Object> get props => [];
}

class ProvinceInitial extends ProvinceState {}

class ProvinceLoading extends ProvinceState {}

class ProvinceError extends ProvinceState {
  final String error;

  const ProvinceError(this.error);

  @override
  List<Object> get props => [error];
}

class ProvinceData extends ProvinceState {
  final ProvinceModel data;

  const ProvinceData(this.data);

  @override
  List<Object> get props => [data];
}

class CityData extends ProvinceState {
  final CityModel data;

  const CityData(this.data);

  @override
  List<Object> get props => [data];
}
