import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rumahsakit/cubits/hospital/hospital_cubit.dart';

import 'slpashscreen.dart';

class HospitalScreen extends StatefulWidget {
  const HospitalScreen({
    super.key,
    required this.province,
    required this.city,
    required this.cityName,
  });

  final String province;
  final String city;
  final String cityName;

  @override
  State<HospitalScreen> createState() => _HospitalScreenState();
}

class _HospitalScreenState extends State<HospitalScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HospitalCubit>().loadDataHospital(
          province: widget.province,
          city: widget.city,
          type: '1',
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RS di ${widget.cityName}'),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<HospitalCubit, HospitalState>(
              builder: (context, state) {
                if (state is HospitalLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is HospitalError) {
                  return Center(
                    child: Text('Error: ${state.message}'),
                  );
                } else if (state is HospitalData) {
                  if (state.data.hospitals?.isEmpty ?? true) {
                    return const Center(
                      child: Text(''),
                    );
                  }
                  return ListView.builder(
                    itemCount: state.data.hospitals?.length ?? 0,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state.data.hospitals?[index].name ?? ""),
                        subtitle:
                            Text(state.data.hospitals?[index].address ?? ""),
                      );
                    },
                  );
                }
                return const Center(
                  child: Text('Unknown state'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RumH'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                'Sehat itu bukan suatu kemewahan. Sehat itu murah, tetapi menjadi mahal ketika sehat telah berubah menjadi sakit.'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => SplashScreen()),
                  (Route<dynamic> route) => false,
                );
              },
              child: Text('Kembali ke Menu Utama'),
            ),
          ],
        ),
      ),
    );
  }
}
