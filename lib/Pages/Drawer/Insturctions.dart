import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pulse_social/modules/bullet_list.dart';
import 'package:pulse_social/Pages/Utils/video_player.dart';
import 'package:camera/camera.dart';

List<CameraDescription> cameras;

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
}

class Insturctions extends StatefulWidget {
  const Insturctions({super.key});

  @override
  State<Insturctions> createState() => _InsturctionsState();
}

class _InsturctionsState extends State<Insturctions> {
  File? _selectedImage;

  bool isWorking = false;
  String result = "";
  CameraController cameraController;
  CameraImage imgCamera;

  initCamera(){
    cameraController = CameraController(cameras[0], ResolutionPreset.medium);
    cameraController.initialize().then((value){
    if (!mounted){
      return;
    }
    setState(() {
      cameraController.startImageStream((imagesFromStream)=> 
        {
       if(!isWorking){
         isWorking =true,
         imgCamera = imagesFromStream,
       }
      });
    });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        toolbarHeight: 60,
        title: const Text(
          "I N S T R U C T I O N S",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 43, 151, 239),

        //automaticallyImplyLeading: false,
        // Using this removes the back button from the AppBar
      ),
      body: SafeArea(
        child: Stack(
          children: [
            //Container for the Video playback
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: Container(
                width: 500,
                height: 250,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                child: SamplePlayer(key: UniqueKey()),
              ),
            ),

            //Container for the Text Button "Search Photos"

            Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 680),
                child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: const Size(250, 65)),
                  child: const Text(
                    'Search Photos',
                    style: TextStyle(color: Colors.black87, fontSize: 30),
                  ),
                  onPressed: () {
                    _pickImageFromGallery();
                  },
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),
            _selectedImage != null
                ? Image.file(_selectedImage!)
                : const Text("Please select and image"),
            Padding(
              padding: const EdgeInsets.only(top: 290, left: 20, right: 20),
              child: Container(
                height: 390,
                decoration: BoxDecoration(
                    color: Colors.blue[300],
                    borderRadius: BorderRadius.circular(14)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        BulletList(const [
                          'Mount the provided lens to the mobile camera.',
                          'Change the camera mode to pro.',
                          'Set the aperture value to f/8 and iso value to ~100. ',
                          'Keep the camera approximately 1cm away from the eye.'
                              'The user is advised to click the photo in good lighting conditions and not to use mobile flash.'
                        ]),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            //Container for the Text "How to take good sample"

            Container(
              alignment: Alignment.center,
              child: const Padding(
                padding: EdgeInsets.only(bottom: 155),
                child: Text(
                  "How to take good sample",
                  style: TextStyle(
                    fontSize: 28,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(0, -9),
                      )
                    ],
                    color: Colors.transparent,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.black,
                    decorationThickness: 1,
                    decorationStyle: TextDecorationStyle.double,
                  ),
                ),
              ),
            ),
            // Move the setState method to a proper location
            // For example, you can move it inside the onPressed callback of the TextButton widget
          ],
        ),
      ),
    );
  }

  Future _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(
      () {
        _selectedImage = File(returnedImage!.path);
      },
    );
  }
}
