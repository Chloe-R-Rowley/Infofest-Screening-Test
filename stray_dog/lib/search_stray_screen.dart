import 'package:flutter/material.dart';
import 'package:stray_dog/dogs.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMMMd();

class SearchStrayScreen extends StatefulWidget {
  const SearchStrayScreen({required this.dogList, super.key});
  final List<Dogs> dogList;

  @override
  State<SearchStrayScreen> createState() => SearchStrayScreenState();
}

class SearchStrayScreenState extends State<SearchStrayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _globalKey,
      appBar: AppBar(
        title: const Text("Stray Dogs"),
        backgroundColor: const Color(0x99fbc711),
      ),
      body: ListView.builder(
          itemCount: widget.dogList.length,
          itemBuilder: (ctx, index) {
            Dogs dog = widget.dogList[index];
            return Card(
              elevation: 5,
              child: widget.dogList.isNotEmpty
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.file(
                          dog.img!,
                          height: 200,
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Text("Date:"),
                                  Text(formatter.format(dog.date)),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text("Gender:"),
                                  Text(dog.gender),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text("Size"),
                                  Text(dog.size),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  const Text("Action :"),
                                  Text(
                                    dog.action,
                                    softWrap: true,
                                    maxLines:
                                        2, // Set the maximum number of lines to wrap.
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  : const Text("No Dogs recorded"),
            );
          }),
    );
  }
}
