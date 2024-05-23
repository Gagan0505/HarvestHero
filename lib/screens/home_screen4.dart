import 'dart:io';
import 'package:flutter/material.dart';
import 'package:harvest_hero/components/solution.dart';
import 'package:harvest_hero/services/api_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tflite/tflite.dart';
import 'package:harvest_hero/components/custome_button.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';

class HomeScreen4 extends StatefulWidget {
  const HomeScreen4({Key? key}) : super(key: key);

  @override
  State<HomeScreen4> createState() => _HomeScreen4State();
}

class _HomeScreen4State extends State<HomeScreen4> {
  final apiService = ApiService();
  File? _selectedImage;
  bool detecting = false;
  late List _output = [];
  late String diseaseName = '';
  late String diseaseDesc = '';
  late String diseaseCauses = '';
  late String fertilizer = '';
  late String nutrients = '';
  late String management = '';
  bool isSheetVisible = false;
  bool imagePickerVisible = true;
  bool showSolution = false;
  bool descriptionAnimationCompleted = false;

  @override
  void initState() {
    super.initState();
    loadModel2();
  }

  Future<void> loadModel2() async {
    String res;
    res = (await Tflite.loadModel(
      model: "assets/tflite_tomato.tflite",
      labels: "assets/tomato_labels.txt",
    ))!;
    print('Model Loading Status: $res');
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source, imageQuality: 50);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _runModel2() async {
    setState(() {
      detecting = true;
    });

    var output = await Tflite.runModelOnImage(
      path: _selectedImage!.path,
      numResults: 10, // Number of results to show
      threshold: 0.5, // Confidence threshold
    );

    setState(() {
      imagePickerVisible = false;
      detecting = false;
      _output = output!;
      isSheetVisible = true;
      diseaseName = _output.isNotEmpty ? _output[0]['label'] : 'None';
      // Fetch disease description and Solution
      fetchDiseaseDesc();
      // fetchDiseaseSol();
    });
  }

  Future<void> fetchDiseaseDesc() async {
    // Fetch disease description
    diseaseDesc = await apiService.getDescription(diseaseName: diseaseName);
    setState(() { });
    print(diseaseDesc);
    // Fetch disease causes
  }
  

  Future<void> showSolutionWidget() async {
    setState(() {
      showSolution = true;
    });

  }

 

  void resetState() {
    setState(() {
      _selectedImage = null;
      isSheetVisible = false;
      imagePickerVisible = true;
      showSolution = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              const SizedBox(height: 20),
              imagePickerVisible
                  ? Stack(
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.23,
          decoration: BoxDecoration(
            color: const Color(0xFF6FAA2D),
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(0),
              bottomLeft: Radius.circular(
                  MediaQuery.of(context).size.height * 0.23 / 2),
              topRight: const Radius.circular(0),
              bottomRight: Radius.elliptical(
                  700 * 2 / 3, MediaQuery.of(context).size.height * 0.5 / 2),
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.2,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(0),
              bottomLeft: Radius.circular(
                  MediaQuery.of(context).size.height * 0.23 / 2),
              topRight: const Radius.circular(0),
              bottomRight: Radius.elliptical(
                  700 * 2 / 3, MediaQuery.of(context).size.height * 0.5 / 2),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(2, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  _pickImage(ImageSource.gallery);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6FAA2D),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'OPEN GALLERY',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.image,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _pickImage(ImageSource.camera);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6FAA2D),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                      Text('START CAMERA',
                          style: TextStyle(color: Colors.white)),
                    SizedBox(width: 10),
                    Icon(Icons.camera_alt, color: Colors.white)
                  ],
                ),
              ),
              const SizedBox(width: 100)
            ],
          ),
        ),
      ],
    )
                  : const SizedBox(height: 20),
              _selectedImage == null
                  ? SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Image.asset('assets/images/harvest.png'),
    )
                  : Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.all(20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.file(
          _selectedImage!,
          fit: BoxFit.cover,
        ),
      ),
    ),
              if (_selectedImage != null)
                detecting
    ? const SpinKitWave(
        color: const Color(0xFF6FAA2D),
        size: 30,
      )
    : Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
            vertical: 0, horizontal: 20),
        child: imagePickerVisible
            ? CustomButton(text: 'DETECT', onPressed: () {
                _runModel2();
              })
            : CustomButton(
       text: "DETECT ANOTHER", onPressed: resetState
              )),
            ],
          ),
          if (isSheetVisible)
            DraggableScrollableSheet(
              initialChildSize: 0.4,
              maxChildSize: 0.5,
              minChildSize: 0.1,
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: const Offset(0, 3), // changes position of shadow
      ),
    ],
                  ),
                  child: showSolution
      ? SolutionWidget(
          scrollController: scrollController,
          diseaseName: diseaseName,
          
        )
      : ListView(
          controller: scrollController,
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
                'Disease Detected: $diseaseName',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              subtitle: Text(
                'Confidence: ${_output.isNotEmpty ? (_output[0]['confidence'] * 100).toStringAsFixed(2) : 'N/A'}%',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
    ListTile(
    title: Text(
      'Disease Description',
      style: Theme.of(context).textTheme.titleLarge,
    ),
    
    subtitle: diseaseDesc.isEmpty
              ? const SpinKitWave(
                  color: const Color(0xFF6FAA2D),
                  size: 30,
                )
              : Text(
                  diseaseDesc.trim(),
                  style: const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w400,
    fontSize: 16,
                  ),
                  textAlign: TextAlign.justify,
                ),
        ),
               Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
    vertical: 0, horizontal: 20),
                child: CustomButton(
    onPressed: showSolutionWidget,
    text: "SOLUTION")),
            const SizedBox(height: 20),
            Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
    vertical: 0, horizontal: 20),
                child: CustomButton(
                  text: "SAVE",
                  onPressed: () {},
                )),
            const SizedBox(height: 100)
          ],
        ),
                );
              },
            ),
        ],
      ),
    );
  }
}
