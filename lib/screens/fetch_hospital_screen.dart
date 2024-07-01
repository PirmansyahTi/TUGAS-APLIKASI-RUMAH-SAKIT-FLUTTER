import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FetchHospitalScreen extends StatefulWidget {
  const FetchHospitalScreen({super.key});

  @override
  State<FetchHospitalScreen> createState() => _FetchHospitalScreenState();
}

class _FetchHospitalScreenState extends State<FetchHospitalScreen> {
  List<dynamic> hospitals = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchHospitalData();
  }

  Future<void> fetchHospitalData() async {
    final String provinceId = '51prop';
    final String cityId = '5171';
    final String url =
        'https://rs-bed-covid-api.vercel.app/api/get-hospitals?provinceid=$provinceId&cityid=$cityId&type=1';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      setState(() {
        hospitals = json.decode(response.body)['hospitals'];
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      throw Exception('Failed to load hospitals');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Rumah Sakit'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: hospitals.length,
              itemBuilder: (context, index) {
                final hospital = hospitals[index];
                return ListTile(
                  title: Text(hospital['name']),
                  subtitle: Text(hospital['address']),
                );
              },
            ),
    );
  }
}
