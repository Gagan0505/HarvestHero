

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:harvest_hero/components/custome_button.dart';
import '../services/api_service.dart';

class SolutionWidget extends StatefulWidget {
  SolutionWidget({
    Key? key,
    required this.scrollController,
    required this.diseaseName,
    
  }) : super(key: key);

  final ScrollController scrollController;
  final String diseaseName;
  final ApiService apiService = ApiService();

  @override
  State<SolutionWidget> createState() => _SolutionWidgetState();
}

class _SolutionWidgetState extends State<SolutionWidget> {
  late String fertilizer = '';
  late String nutrients = '';
  late String management = '';

  @override
  void initState() {
    super.initState();
    fetchSolutionInfo();
  }

  Future<void> fetchSolutionInfo() async {
    try {
      // Fetch fertilizer
      fertilizer = await widget.apiService.getFertilizer(diseaseName: widget.diseaseName);
      // Fetch nutrients
      nutrients = await widget.apiService.getNutrients(diseaseName: widget.diseaseName);
      // Fetch management
      management = await widget.apiService.getManagement(diseaseName: widget.diseaseName);
      setState(() {});
      print(fertilizer);
    } catch (error) {
      print('Error fetching solution info: $error');
      // Handle error accordingly
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: widget.scrollController,
      children: [
        Center(
          child: Container(
            height: 5,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.grey,
            ),
          ),
        ),
        ListTile(
          title: Text(
            'Solution for ${widget.diseaseName}',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        ListTile(
          title: Text(
            'Fertilizers Required',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          subtitle: fertilizer.isEmpty
              ? const SpinKitWave(
                  color: Colors.green,
                  size: 30,
                )
              : Text(
                  fertilizer.trim(),
                  style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  ),
                  textAlign: TextAlign.justify,
                ),
        ),
        ListTile(
          title: Text(
            'Supplements Required',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          subtitle: nutrients.isEmpty
              ? const SpinKitWave(
                  color: Colors.green,
                  size: 30,
                )
              : Text(
                  nutrients.trim(),
                  style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  ),
                  textAlign: TextAlign.justify,
                ),
        ),
        ListTile(
          title: Text(
            'Crop Management',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          subtitle: management.isEmpty
              ? const SpinKitWave(
                  color: Colors.green,
                  size: 30,
                )
              : Text(
                  management.trim(),
                  style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  ),
                  textAlign: TextAlign.justify,
                ),
        ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
        //   child: CustomButton(
        //     text: 'DESCRIPTION',
        //     onPressed: () {
              
        //     },
        //   ),
        // ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
        //   child: CustomButton(
        //     text: 'SAVE',
        //     onPressed: () {},
        //   ),
        // ),
      ],
    );
  }
}
