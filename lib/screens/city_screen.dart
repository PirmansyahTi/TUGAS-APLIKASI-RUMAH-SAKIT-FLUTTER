import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/hospital/hospital_cubit.dart';
import '../cubits/province/province_cubit.dart';
import '../services/hospital_service.dart';
import '../services/province_service.dart';
import 'hospital_screen.dart';

class CityScreen extends StatefulWidget {
  const CityScreen(
      {super.key, required this.province, required this.proviceName});
  final String province;
  final String proviceName;

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  final ProvinceCubit _provinceCubit = ProvinceCubit(
    ProvinceService(),
  );

  @override
  void initState() {
    _provinceCubit.loadDataCity(province: widget.province);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kota/Kab di ${widget.proviceName}'),
      ),
      body: BlocBuilder<ProvinceCubit, ProvinceState>(
        bloc: _provinceCubit,
        builder: (context, state) {
          if (state is CityData) {
            return ListView.builder(
              itemCount: state.data.cities?.length ?? 0,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (context) => HospitalCubit(HospitalService()),
                          child: HospitalScreen(
                            province: widget.province,
                            city: state.data.cities?[index].id ?? "",
                            cityName: state.data.cities?[index].name ?? "",
                          ),
                        ),
                      ),
                    );
                  },
                  title: Text(state.data.cities?[index].name ?? ""),
                );
              },
            );
          }
          return const Center(
            child: Text('Loading Data'),
          );
        },
      ),
    );
  }
}
