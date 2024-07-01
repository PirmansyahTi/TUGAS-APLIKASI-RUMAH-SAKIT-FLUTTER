import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rumahsakit/cubits/province/province_cubit.dart';
import 'package:rumahsakit/cubits/hospital/hospital_cubit.dart';
import 'package:rumahsakit/services/hospital_service.dart';
import 'services/province_service.dart';
import 'screens/slpashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProvinceCubit(
            ProvinceService(),
          ),
        ),
        BlocProvider(
          create: (context) => HospitalCubit(HospitalService()),
        ),
      ],
      child: MaterialApp(
        title: 'Aplikasi Rumah Sakit',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
