import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyCoolApp());
}

class MyCoolApp extends StatefulWidget {
  @override
  _MyCoolAppState createState() => _MyCoolAppState();
}

class _MyCoolAppState extends State<MyCoolApp> {
  bool isDarkTheme = false; // Theme toggle state
  String userName = ''; // Holds the user's name
  int counter = 0; // Counter value
  File? _image; // Stores the selected image

  @override
  void initState() {
    super.initState();
    _loadThemePreference();
  }

  Future<void> _loadThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkTheme = prefs.getBool('isDarkTheme') ?? false;
    });
  }

  Future<void> _saveThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkTheme', isDarkTheme);
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Advanced Cool UI App'),
          actions: [
            IconButton(
              icon: Icon(isDarkTheme ? Icons.dark_mode : Icons.light_mode),
              onPressed: () {
                setState(() {
                  isDarkTheme = !isDarkTheme;
                  _saveThemePreference();
                });
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Welcome Message
                Text(
                  'Welcome to the Advanced Cool UI App!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),

                // TextField for User Input
                TextField(
                  onChanged: (value) {
                    setState(() {
                      userName = value;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your name',
                  ),
                ),
                SizedBox(height: 20),

                // Display User Info on a Card
                Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          'User Info',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text('Name: ${userName.isEmpty ? 'Unknown' : userName}'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Counter Feature
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          counter--;
                        });
                      },
                      icon: Icon(Icons.remove),
                    ),
                    Text(
                      '$counter',
                      style: TextStyle(fontSize: 20),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          counter++;
                        });
                      },
                      icon: Icon(Icons.add),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Image Picker
                ElevatedButton(
                  onPressed: _pickImage,
                  child: Text('Pick an Image'),
                ),
                if (_image != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Image.file(
                      _image!,
                      height: 150,
                      width: 150,
                    ),
                  ),
                SizedBox(height: 20),

                // Navigate to New Screen
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondScreen(),
                      ),
                    );
                  },
                  child: Text('Go to Second Screen'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: Text(
          'Welcome to the second screen!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
