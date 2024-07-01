import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rumahsakit/models/city_model.dart';
import 'package:rumahsakit/models/province_model.dart';
import 'package:rumahsakit/services/province_service.dart';

part 'province_state.dart';

class ProvinceCubit extends Cubit<ProvinceState> {
  final ProvinceService _provinceService;

  ProvinceCubit(this._provinceService) : super(ProvinceInitial());

  void loadDataProvince() async {
    emit(ProvinceLoading());
    final result = await _provinceService.getProvinces();
    result.fold(
      (error) => emit(ProvinceError(error)),
      (data) => emit(ProvinceData(data)),
    );
  }

  void loadDataCity({required String province}) async {
    emit(ProvinceLoading());
    final result = await _provinceService.getCities(province: province);
    result.fold(
      (error) => emit(ProvinceError(error)),
      (data) => emit(CityData(data)),
    );
  }
}
