// import 'dart:io';
//
// import 'package:ecommerce_app_final/services/Database.dart';
// import 'package:ecommerce_app_final/widget/Support_widget.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:random_string/random_string.dart';
//
// import 'Home_Admin.dart';
//
// class Addproducts extends StatefulWidget {
//   const Addproducts({super.key});
//
//   @override
//   State<Addproducts> createState() => _AddproductsState();
// }
//
// class _AddproductsState extends State<Addproducts> {
//   final ImagePicker _picker = ImagePicker();
//   File? SelectedImage;
//
//   TextEditingController namecontroller = new TextEditingController();
//
//
//
//   Future GetImage() async{
//     var image = await _picker.pickImage(source: ImageSource.gallery);
//     SelectedImage = File(image!.path);
//     setState(() {
//
//     });
//   }
//   UploadItem() async{
//     if(SelectedImage!=null && namecontroller.text!=" "){
//       String addId = randomAlphaNumeric(10);
//       Reference firebaseStorageRef = FirebaseStorage.instance.ref().child("BlogImage").child(addId);
//
//       final UploadTask task = firebaseStorageRef.putFile(SelectedImage!);
//       var downloadUrl = await (await task).ref.getDownloadURL();
//       Map<String,dynamic> addProduct = {
//         "Name": namecontroller.text,
//          "Image": downloadUrl,
//       };
//       await DatabaseMethods().addProduct(addProduct, value!).then((value){
//         SelectedImage=null;
//         namecontroller.text="";
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//             backgroundColor: Colors.redAccent ,
//             content: Text("Product Uploaded Successfully",style: TextStyle(fontSize: 20),)));
//       });
//     }
//   }
//
//   String? value;
//   final List<String> CategoriesItems = ['Laptop', 'TV', 'Watch', 'Headphones'];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: GestureDetector(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: Icon(Icons.arrow_back_ios_new_outlined)),
//         title: Text(
//           "Add Product",
//           style: Appwidget.SemiBoldTextFeildStyleBlack(),
//         ),
//       ),
//       body: Container(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//                 margin: EdgeInsets.only(top: 15, left: 20, bottom: 30),
//                 child: Text(
//                   "Upload the Product Image",
//                   style: Appwidget.lightTextFeildStyle(),
//                 )),
//             SelectedImage==null?
//             GestureDetector(
//               onTap: (){
//                 GetImage();
//               },
//               child: Center(
//                 child: Container(
//                   height: 170,
//                   width: 170,
//                   decoration: BoxDecoration(
//                       border: Border.all(color: Colors.black, width: 1.5),
//                       borderRadius: BorderRadius.circular(20)),
//                   child: Icon(Icons.camera_alt_outlined),
//                 ),
//               ),
//             ): Center(
//               child: Material(
//                 elevation: 4.0,
//                 borderRadius: BorderRadius.circular(20),
//                child:  Container(
//                   height: 170,
//                   width: 170,
//                   decoration: BoxDecoration(
//                       border: Border.all(color: Colors.black, width: 1.5),
//                       borderRadius: BorderRadius.circular(20)),
//                   child: ClipRRect(
//                       borderRadius: BorderRadius.circular(20),
//                       // child: Image.file(SelectedImage!,fit: BoxFit.cover,)), for Mobile run
//
//
//                 ),
//                )
//
//               ),
//             ),
//             SizedBox(height: 30,),
//             Container(
//                 margin: EdgeInsets.only(left: 20),
//                 child: Text(
//                   "Product Name",
//                   style: Appwidget.lightTextFeildStyle(),
//                 )),
//             SizedBox(
//               height: 10,
//             ),
//             Container(
//                 margin: EdgeInsets.only(left: 15, right: 15),
//                 padding: EdgeInsets.only(left: 20),
//                 decoration: BoxDecoration(
//                     color: Color(0xffd9d9ef),
//                     borderRadius: BorderRadius.circular(15)),
//                 child: TextField(
//                   controller: namecontroller,
//                   decoration: InputDecoration(border: InputBorder.none),
//                 )),
//             SizedBox(
//               height: 10,
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 10),
//               margin: EdgeInsets.only(left: 15, right: 15),
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                   color: Color(0xffd9d9ef),
//                   borderRadius: BorderRadius.circular(10)),
//               child: DropdownButtonHideUnderline(
//                 child: DropdownButton<String>(
//                   items: CategoriesItems.map((item) => DropdownMenuItem(
//                       value: item,
//                       child: Text(
//                         item,
//                         style:TextStyle(fontSize: 16),
//                       ))).toList(),
//                   onChanged: ((value) => setState(() {
//                         this.value = value;
//                       })),
//                     dropdownColor: Colors.white,
//                   hint: Text("Select Category"),
//                   iconSize: 36,
//                   icon: Icon(Icons.arrow_drop_down,color: Colors.black,),
//                   value: value,
//
//                 ),
//               ),
//             ),
//             SizedBox(height: 40,),
//             Center(child: ElevatedButton(onPressed: (){
//               UploadItem();
//             }, child: Text("Add Product" ,style: TextStyle(fontSize: 20),)))
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'dart:io';
// import 'dart:html' as html; // Add this for web
// import 'package:ecommerce_app_final/services/Database.dart';
// import 'package:ecommerce_app_final/widget/Support_widget.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:file_picker/file_picker.dart'; // Add this for web
// import 'package:random_string/random_string.dart';
//
// import 'Home_Admin.dart';
//
// class Addproducts extends StatefulWidget {
//   const Addproducts({super.key});
//
//   @override
//   State<Addproducts> createState() => _AddproductsState();
// }
//
// class _AddproductsState extends State<Addproducts> {
//   final ImagePicker _picker = ImagePicker();
//   File? selectedImage;
//   Uint8List? webImage; // Add this for web
//
//   TextEditingController nameController = TextEditingController();
//   TextEditingController priceController = TextEditingController();
//   TextEditingController detailController = TextEditingController();
//
//   Future<void> getImage() async {
//     if (kIsWeb) {
//       // For Web
//       final result = await FilePicker.platform.pickFiles(
//         type: FileType.image,
//         allowMultiple: false,
//       );
//       if (result != null) {
//         setState(() {
//           webImage = result.files.first.bytes;
//           selectedImage = File(result.files.first.name); // Dummy file for web
//         });
//       }
//     } else {
//       // For Android & iOS
//       final image = await _picker.pickImage(source: ImageSource.gallery);
//       if (image != null) {
//         setState(() {
//           selectedImage = File(image.path);
//         });
//       }
//     }
//   }
//
//   Future<void> uploadItem() async {
//     if (selectedImage != null && nameController.text.isNotEmpty) {
//       String addId = randomAlphaNumeric(10);
//       Reference firebaseStorageRef =
//       FirebaseStorage.instance.ref().child("ProductImages").child(addId);
//
//       UploadTask uploadTask;
//       if (kIsWeb) {
//         // For Web
//         uploadTask = firebaseStorageRef.putData(webImage!);
//       } else {
//         // For Android & iOS
//         uploadTask = firebaseStorageRef.putFile(selectedImage!);
//       }
//
//       var downloadUrl = await (await uploadTask).ref.getDownloadURL();
//       Map<String, dynamic> addProduct = {
//         "Name": nameController.text,
//         "Image": downloadUrl,
//         "Price": priceController.text,
//         "Product Detail": detailController.text
//       };
//
//       await DatabaseMethods().addProduct(addProduct, value!).then((value) {
//         setState(() {
//           selectedImage = null;
//           webImage = null;
//           nameController.text = "";
//           priceController.text="";
//           detailController.text="";
//         });
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           backgroundColor: Colors.redAccent,
//           content: Text(
//             "Product Uploaded Successfully",
//             style: TextStyle(fontSize: 20),
//           ),
//         ));
//       });
//     }
//   }
//
//   String? value;
//   final List<String> categoriesItems = ['Laptop', 'TV', 'Watch', 'Headphones'];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: GestureDetector(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: Icon(Icons.arrow_back_ios_new_outlined)),
//         title: Text(
//           "Add Product",
//           style: Appwidget.SemiBoldTextFeildStyleBlack(),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           margin: EdgeInsets.only(bottom: 30),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                   margin: EdgeInsets.only(top: 15, left: 20, bottom: 30),
//                   child: Text(
//                     "Upload the Product Image",
//                     style: Appwidget.lightTextFeildStyle(),
//                   )),
//               selectedImage == null && webImage == null
//                   ? GestureDetector(
//                 onTap: () {
//                   getImage();
//                 },
//                 child: Center(
//                   child: Container(
//                     height: 170,
//                     width: 170,
//                     decoration: BoxDecoration(
//                         border: Border.all(color: Colors.black, width: 1.5),
//                         borderRadius: BorderRadius.circular(20)),
//                     child: Icon(Icons.camera_alt_outlined),
//                   ),
//                 ),
//               )
//                   : Center(
//                 child: Material(
//                     elevation: 4.0,
//                     borderRadius: BorderRadius.circular(20),
//                     child: Container(
//                       height: 170,
//                       width: 170,
//                       decoration: BoxDecoration(
//                           border: Border.all(color: Colors.black, width: 1.5),
//                           borderRadius: BorderRadius.circular(20)),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(20),
//                         child: kIsWeb
//                             ? Image.memory(webImage!, fit: BoxFit.cover)
//                             : Image.file(selectedImage!, fit: BoxFit.cover),
//                       ),
//                     )),
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               Container(
//                   margin: EdgeInsets.only(left: 20),
//                   child: Text(
//                     "Product Name",
//                     style: Appwidget.lightTextFeildStyle(),
//                   )),
//               SizedBox(
//                 height: 10,
//               ),
//               Container(
//                   margin: EdgeInsets.only(left: 15, right: 15),
//                   padding: EdgeInsets.only(left: 20),
//                   decoration: BoxDecoration(
//                       color: Color(0xffd9d9ef),
//                       borderRadius: BorderRadius.circular(15)),
//                   child: TextField(
//                     controller: nameController,
//                     decoration: InputDecoration(border: InputBorder.none),
//                   )),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                   margin: EdgeInsets.only(left: 20),
//                   child: Text(
//                     "Product Price",
//                     style: Appwidget.lightTextFeildStyle(),
//                   )),
//               SizedBox(
//                 height: 10,
//               ),
//               Container(
//                   margin: EdgeInsets.only(left: 15, right: 15),
//                   padding: EdgeInsets.only(left: 20),
//                   decoration: BoxDecoration(
//                       color: Color(0xffd9d9ef),
//                       borderRadius: BorderRadius.circular(15)),
//                   child: TextField(
//                     controller: priceController,
//                     decoration: InputDecoration(border: InputBorder.none),
//                   )),
//
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                   margin: EdgeInsets.only(left: 20),
//                   child: Text(
//                     "Product Detail",
//                     style: Appwidget.lightTextFeildStyle(),
//                   )),
//               SizedBox(
//                 height: 10,
//               ),
//               Container(
//                   margin: EdgeInsets.only(left: 15, right: 15),
//                   padding: EdgeInsets.only(left: 20),
//                   decoration: BoxDecoration(
//                       color: Color(0xffd9d9ef),
//                       borderRadius: BorderRadius.circular(15)),
//                   child: TextField(
//                     maxLines: 6,
//                     controller: detailController,
//                     decoration: InputDecoration(border: InputBorder.none),
//                   )),
//
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 10),
//                 margin: EdgeInsets.only(left: 15, right: 15),
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                     color: Color(0xffd9d9ef),
//                     borderRadius: BorderRadius.circular(10)),
//                 child: DropdownButtonHideUnderline(
//                   child: DropdownButton<String>(
//                     items: categoriesItems
//                         .map((item) => DropdownMenuItem(
//                         value: item,
//                         child: Text(
//                           item,
//                           style: TextStyle(fontSize: 16),
//                         )))
//                         .toList(),
//                     onChanged: ((value) => setState(() {
//                       this.value = value;
//                     })),
//                     dropdownColor: Colors.white,
//                     hint: Text("Select Category"),
//                     iconSize: 36,
//                     icon: Icon(
//                       Icons.arrow_drop_down,
//                       color: Colors.black,
//                     ),
//                     value: value,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//               Center(
//                   child: ElevatedButton(
//                       onPressed: () {
//                         uploadItem();
//                       },
//                       child: Text(
//                         "Add Product",
//                         style: TextStyle(fontSize: 20),
//                       )))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';
import 'dart:typed_data'; // Add this for web
import 'package:ecommerce_app_final/services/Database.dart';
import 'package:ecommerce_app_final/widget/Support_widget.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart'; // Add this for web
import 'package:random_string/random_string.dart';

import 'Home_Admin.dart';

class Addproducts extends StatefulWidget {
  const Addproducts({super.key});

  @override
  State<Addproducts> createState() => _AddproductsState();
}

class _AddproductsState extends State<Addproducts> {
  final ImagePicker _picker = ImagePicker();
  File? selectedImage;
  Uint8List? webImage; // Add this for web

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController detailController = TextEditingController();

  Future<void> getImage() async {
    if (kIsWeb) {
      // For Web
      final result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );
      if (result != null) {
        setState(() {
          webImage = result.files.first.bytes;
          selectedImage = File(result.files.first.name); // Dummy file for web
        });
      }
    } else {
      // For Android & iOS
      final image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          selectedImage = File(image.path);
        });
      }
    }
  }

  Future<void> uploadItem() async {
    if ((selectedImage != null || webImage != null) && nameController.text.isNotEmpty) {
      String addId = randomAlphaNumeric(10);
      Reference firebaseStorageRef = FirebaseStorage.instance
          .ref()
          .child("ProductImages")
          .child(addId);

      UploadTask uploadTask;
      if (kIsWeb) {
        // For Web
        uploadTask = firebaseStorageRef.putData(webImage!);
      } else {
        // For Android & iOS
        uploadTask = firebaseStorageRef.putFile(selectedImage!);
      }

      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL(); // This retrieves the correct URL
      Map<String, dynamic> addProduct = {
        "Name": nameController.text,
        "Image": downloadUrl, // Storing the correct download URL
        "Price": priceController.text,
        "Product Detail": detailController.text
      };

      await DatabaseMethods().addProduct(addProduct, value!).then((value) {
        setState(() {
          selectedImage = null;
          webImage = null;
          nameController.clear();
          priceController.clear();
          detailController.clear();
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            "Product Uploaded Successfully",
            style: TextStyle(fontSize: 20),
          ),
        ));
      });
    }
  }

  String? value;
  final List<String> categoriesItems = ['Laptop', 'TV', 'Watch', 'Headphones'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_new_outlined)),
        title: Text(
          "Add Product",
          style: Appwidget.SemiBoldTextFeildStyleBlack(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(top: 15, left: 20, bottom: 30),
                  child: Text(
                    "Upload the Product Image",
                    style: Appwidget.lightTextFeildStyle(),
                  )),
              selectedImage == null && webImage == null
                  ? GestureDetector(
                onTap: () {
                  getImage();
                },
                child: Center(
                  child: Container(
                    height: 170,
                    width: 170,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1.5),
                        borderRadius: BorderRadius.circular(20)),
                    child: Icon(Icons.camera_alt_outlined),
                  ),
                ),
              )
                  : Center(
                child: Material(
                    elevation: 4.0,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 170,
                      width: 170,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(20)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: kIsWeb
                            ? Image.memory(webImage!, fit: BoxFit.cover)
                            : Image.file(selectedImage!, fit: BoxFit.cover),
                      ),
                    )),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    "Product Name",
                    style: Appwidget.lightTextFeildStyle(),
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  padding: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      color: Color(0xffd9d9ef),
                      borderRadius: BorderRadius.circular(15)),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(border: InputBorder.none),
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    "Product Price",
                    style: Appwidget.lightTextFeildStyle(),
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  padding: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      color: Color(0xffd9d9ef),
                      borderRadius: BorderRadius.circular(15)),
                  child: TextField(
                    controller: priceController,
                    decoration: InputDecoration(border: InputBorder.none),
                  )),

              SizedBox(
                height: 20,
              ),
              Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    "Product Detail",
                    style: Appwidget.lightTextFeildStyle(),
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  padding: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      color: Color(0xffd9d9ef),
                      borderRadius: BorderRadius.circular(15)),
                  child: TextField(
                    maxLines: 6,
                    controller: detailController,
                    decoration: InputDecoration(border: InputBorder.none),
                  )),

              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.only(left: 15, right: 15),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xffd9d9ef),
                    borderRadius: BorderRadius.circular(10)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    items: categoriesItems
                        .map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(fontSize: 16),
                        )))
                        .toList(),
                    onChanged: ((value) => setState(() {
                      this.value = value;
                    })),
                    dropdownColor: Colors.white,
                    hint: Text("Select Category"),
                    iconSize: 36,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                    ),
                    value: value,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                  child: ElevatedButton(
                      onPressed: () {
                        uploadItem();
                      },
                      child: Text(
                        "Add Product",
                        style: TextStyle(fontSize: 20),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}


