import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'package:path/path.dart';
import 'dart:core';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  static const routeName = '/get-started';

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  File? selectedImage;
  var responseString;
  var responseData;
  var drugName;

  void getImage() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    ) as PickedFile;

    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
    }
  }

  Future getResult(File imageFile) async {
    var stream =
        new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    // get file length
    var length = await imageFile.length();

    // string to uri
    var uri = Uri.parse("http://207.154.218.143/uploadfile/");

    // create multipart request
    var request = http.MultipartRequest("POST", uri);

    // multipart that takes file
    var multipartFile = http.MultipartFile('file', stream, length,
        filename: basename(imageFile.path));

    request.files.add(multipartFile);

    var response = await request.send();

    responseData = await response.stream.toBytes();
    responseString = String.fromCharCodes(responseData);
    print(responseString);

    return responseString;

    // var result = response.stream.transform(utf8.decoder).listen((value) {
    //   prediction = json.decode(value);
    //   // print(prediction);
    //   // symptoms = prediction['symptoms'];
    //   // print(symptoms);
    //   // for (var i = 0; i < symptoms.length; i++) {
    //   //   print(symptoms[i]['drug']);
    //   // }
    // });

    // print(result);

    // listen for response
  }

  @override
  Widget build(BuildContext context) {
    void loadResult() async {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Drug Analysis'),
              content: FutureBuilder(
                  future: getResult(selectedImage!),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var data = json.decode(snapshot.data);
                      return ListView.builder(
                        itemCount: data['symptoms'].length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Text("Drug name - ${data['symptoms'][index]['drug']}"),
                              Text("Symptom - ${data['symptoms'][index]['symptoms'][0]}"),
                            ],
                          );
                        },
                      );
                    } else {
                      return const Text('Loading...!!!!');
                    }
                  }),
            );
          });
      //
    }

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        title: const Text(
          'Get Started',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: 200,
                  height: 200,
                  margin: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                      image: DecorationImage(
                          image: selectedImage == null
                              ? const AssetImage(
                                  'assets/images/defaultimage.png')
                              : FileImage(selectedImage!) as ImageProvider)),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                height: 40,
                width: 120,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                  onPressed: () {
                    getImage();
                  },
                  child: const Text(
                    'Choose File',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                height: 40,
                width: 120,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 11, 72, 121)),
                  onPressed: loadResult,
                  child: const Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                  child: responseString == null
                      ? Column()
                      : Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          child: Column(
                            children: [
                              responseString['symptoms'].map((e) {
                                return Text(e['drug']);
                              })
                            ],
                          ),
                        ))
            ]),
      ),
    );
  }
}
