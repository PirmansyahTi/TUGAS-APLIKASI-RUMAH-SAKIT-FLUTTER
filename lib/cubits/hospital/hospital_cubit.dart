import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rumahsakit/models/hospital_model.dart';
import 'package:rumahsakit/services/hospital_service.dart';

part 'hospital_state.dart';

class HospitalCubit extends Cubit<HospitalState> {
  final HospitalService _hospitalService;

  HospitalCubit(this._hospitalService) : super(HospitalInitial());

  void loadDataHospital({
    required String province,
    required String city,
    required String type,
  }) async {
    emit(HospitalLoading());
    final result = await _hospitalService.getHospitals(
      province: province,
      city: city,
      type: type,
    );
    result.fold(
      (error) => emit(HospitalError(error)),
      (data) => emit(HospitalData(data)),
    );
  }
}
