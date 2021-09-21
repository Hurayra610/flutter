import 'package:flutter/material.dart';  

void main() => runApp(const MyApp());  
  
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override  
  Widget build(BuildContext context) {  
    const appTitle = 'E-Pro';  
    return MaterialApp(  
      title: appTitle,  
      home: Scaffold(  
        drawer: const Drawer(),
        appBar: AppBar(
          backgroundColor: Color(hexToColor("#1770A9")),
          title: const Text("Home Page"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                // do something
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                // do something
              },
            ),
          ],
        ),
        body: const MyCustomForm(),  
      ),  
    );  
  }  
}  
// Create a Form widget.  
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);
  
  @override  
  MyCustomFormState createState() {  
    return MyCustomFormState();  
  }  
}  
// Create a corresponding State class, which holds data related to the form.  
class MyCustomFormState extends State<MyCustomForm> {   
  final _formKey = GlobalKey<FormState>();  
  
  @override  
  Widget build(BuildContext context) {   
    return SingleChildScrollView(
      child: Form(  
        key: _formKey,  
        child: Column(  
          crossAxisAlignment: CrossAxisAlignment.start,  
          children: <Widget>[  
            TextFormField(  
              decoration: const InputDecoration(  
                icon: Icon(Icons.person),  
                hintText: 'Enter your full name',  
                labelText: 'Name',  
              ),   
            ),  
            TextFormField(  
              decoration: const InputDecoration(  
                icon: Icon(Icons.phone),  
                hintText: 'Enter a phone number',  
                labelText: 'Phone',  
              ),    
            ),
            TextFormField(  
              decoration: const InputDecoration(  
                icon: Icon(Icons.location_city),  
                hintText: 'Enter your location',  
                labelText: 'Location',  
              ),    
            ),
            TextFormField(  
              decoration: const InputDecoration(  
                icon: Icon(Icons.price_change),  
                hintText: 'Enter price',  
                labelText: 'Price',  
              ),    
            ),  
            TextFormField(  
              decoration: const InputDecoration(  
                icon: Icon(Icons.rate_review_outlined),  
                hintText: 'Enter product rating',  
                labelText: 'Rating',  
              ),   
            ),
            
            Container(  
                padding: const EdgeInsets.only(left: 170.0, top: 60.0),  
                child: ElevatedButton(  
                  child: const Text('Submit'),  
                  onPressed: () {    
                    ScaffoldMessenger.of(context)  
                        .showSnackBar( const SnackBar(content: Text('Data is in processing.')));  
                  },  
                )),  
          ],  
        ),  
      ),
    );  
  }  
}  

int hexToColor(String hexcolorCode) {
  String color = "0xff" + hexcolorCode;
  String hexColor = color.replaceAll("#", "");
  int colorCode = int.parse(hexColor);
  return colorCode;
}