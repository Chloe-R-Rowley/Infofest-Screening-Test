import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:stray_dog/button.dart';
import 'package:intl/intl.dart';
import 'package:stray_dog/dogs.dart';
import 'package:stray_dog/search_stray_screen.dart';

final formatter = DateFormat.yMMMd();

class SpotStrayScreen extends StatefulWidget {
  const SpotStrayScreen({super.key});

  @override
  State<SpotStrayScreen> createState() => SpotStrayScreenState();
}

void isPressed() {}

class SpotStrayScreenState extends State<SpotStrayScreen> {
  List<Dogs> dogList = [];

  String _action = 'Adopted';
  List<String> actionRadioOptions = [
    'No action taken',
    'I brought it to an animal shelter',
    'I have informed the competent muncipality / local police',
    'I am taking it to a vet or animal clinic',
    'Adopted',
    'In foster Shelter or family'
  ];

  String _size = "Unknown";
  String _microchip = 'I dont know';
  bool isChecked = false;
  String _selectedOption = 'N/A'; // Default selected option

  List<String> genderRadioOptions = ['N/A', 'Male', 'Female'];
  List<String> sizeRadioOptions = [
    'Unknown',
    'X-Small (1-5 kg)',
    'Small (5-15 kg)',
    'Medium (15-25 kg)',
    'Large (>25 kg)'
  ];
  List<String> microchipRadioOptions = [
    'It has',
    'It doesnt have',
    'I dont know'
  ];

  File? _imageFile;

  Future<void> _takePhoto() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);

    if (image == null) return;

    setState(() {
      _imageFile = File(image.path);
    });
  }

  Future<void> _pickPhoto() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) return;

    setState(() {
      _imageFile = File(image.path);
    });
  }

  DateTime? selectedDate;
  void datePressed() async {
    final DateTime now = DateTime.now();
    final DateTime firstDate = DateTime(now.year - 1, now.month, now.day);
    final datePicked = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    setState(() {
      selectedDate = datePicked;
    });
  }

  void onCharacteristic() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.cancel_sharp),
                ),
                const SizedBox(
                  width: 110,
                ),
                const Text(
                  "Filters",
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const Divider(),
            Expanded(
              child: ListView(
                children: [
                  const Text("Gender"),
                  for (String option in genderRadioOptions)
                    RadioListTile(
                      title: Text(option),
                      value: option,
                      groupValue: _selectedOption,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedOption = newValue!;
                        });
                      },
                    ),
                  const SizedBox(height: 16.0),
                  const Text("Microchip"),
                  for (String option in microchipRadioOptions)
                    RadioListTile(
                      title: Text(option),
                      value: option,
                      groupValue: _microchip,
                      onChanged: (newValue) {
                        setState(() {
                          _microchip = newValue!;
                        });
                      },
                    ),
                  const SizedBox(height: 16.0),
                  const Text("Size"),
                  for (String option in sizeRadioOptions)
                    RadioListTile(
                      title: Text(option),
                      value: option,
                      groupValue: _size,
                      onChanged: (newValue) {
                        setState(() {
                          _size = newValue!;
                        });
                      },
                    ),
                ],
              ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Delete Selection")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Add Filters")),
              ],
            )
            // ElevatedButton(
            //   onPressed: () {
            //     // You can perform any action here based on the selected value
            //     print("Selected Option: $_selectedOption");
            //     Navigator.pop(context); // Close the bottom sheet
            //   },
            //   child: Text('OK'),
            // ),
          ],
        ),
      ),
    );
  }

  void onActionTaken() {
    showModalBottomSheet(
        context: context,
        builder: (ctx) => Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.cancel_sharp),
                      ),
                      const SizedBox(
                        width: 65,
                      ),
                      const Text(
                        "Actions Taken",
                        style: TextStyle(fontSize: 24),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  const Divider(),
                  Expanded(
                    child: ListView(children: [
                      const Text("Actions"),
                      for (String option in actionRadioOptions)
                        RadioListTile(
                          title: Text(option),
                          value: option,
                          groupValue: _action,
                          onChanged: (value) {
                            setState(() {
                              _action = value!;
                            });
                          },
                        ),
                    ]),
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          onPressed: () {},
                          child: const Text("Add Actions Taken")),
                    ],
                  )
                ],
              ),
            ));
  }

  void dataSend() {
    setState(() {
      Dogs newDog = Dogs(
          date: selectedDate!,
          img: _imageFile,
          gender: _selectedOption,
          size: _size,
          action: _action);
      dogList.add(newDog);
    });
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SearchStrayScreen(
                  dogList: dogList,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _globalKey,
      appBar: AppBar(
        title: const Text("New Post"),
        actions: [
          ElevatedButton(
              onPressed: dataSend,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber, foregroundColor: Colors.white),
              child: const Text("Post"))
        ],
        backgroundColor: const Color(0xfffffcf3),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              color: const Color(0xfffffcf3),
              height: 350,
              child: ListView(
                children: [
                  _imageFile != null
                      ? Image.file(
                          _imageFile!,
                          height: 200,
                        )
                      : const Text('No Image'),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Expanded(
              child: Card(
                color: const Color(0xfffffcf3),
                elevation: 5,
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                margin: const EdgeInsets.only(top: 5),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Button(
                        buttonName: "Take a Photo",
                        top: 16,
                        bottom: 8,
                        function: _takePhoto,
                      ),
                      Button(
                          buttonName: "Upload a photo from your phone",
                          top: 8,
                          bottom: 8,
                          function: _pickPhoto),
                      Button(
                          buttonName: selectedDate == null
                              ? "Add Date"
                              : formatter.format(selectedDate!),
                          top: 8,
                          bottom: 8,
                          function: datePressed),
                      Button(
                          buttonName: "Characteristics",
                          top: 8,
                          bottom: 8,
                          function: onCharacteristic),
                      Button(
                          buttonName: "Actions taken",
                          top: 8,
                          bottom: 8,
                          function: onActionTaken),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
