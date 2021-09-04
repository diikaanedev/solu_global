import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event/devices/phone/widget/add-event-pick-default-widget-phone.dart';
import 'package:event/devices/phone/widget/type-events-search-home-widget-phone.dart';
import 'package:event/utils/constant-by-dii.dart';
import 'package:event/utils/constant-collection-by-dii.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:image_picker/image_picker.dart';

class AddScreenPhone extends StatefulWidget {
  @override
  _AddScreenPhoneState createState() => _AddScreenPhoneState();
}

class _AddScreenPhoneState extends State<AddScreenPhone> {
  late Size size;
  int i = 0;
  int j = 0;
  bool isFree = true;
  String urlChoix =
      'https://sound2kill4.com/wp-content/uploads/2016/11/events.jpg';
  String titreEvent = '';
  String lieuxEvent = '';
  String priceEvent = '0';
  String categorieEvent = '';
  String descriptionEvent = '';
  final _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  late File image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        j = -1;
        image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101)))!;
    // ignore: unnecessary_null_comparison
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (picked != null && picked != selectedTime)
      setState(() {
        selectedTime = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorByDii.blanc(),
        elevation: .0,
        centerTitle: true,
        title: Text(
          'Créer votre événement',
          style: TextStyle(
              color: ColorByDii.noir(),
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
        iconTheme: IconThemeData(color: ColorByDii.noir()),
      ),
      backgroundColor: ColorByDii.blanc(),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
          ),
          Positioned(
              top: size.height * .01,
              child: Container(
                height: size.height * .05,
                width: size.width,
                child: LayoutBuilder(
                  builder: (context, constraints) => Row(
                    children: [
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            i = 0;
                          });
                        },
                        child: Container(
                          width: constraints.maxWidth * .48,
                          child: TypeEventsSearchHomeWidgetPhone(
                              text: 'Information de l\'événement',
                              isValid: i == 0),
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            i = 1;
                          });
                        },
                        child: Container(
                          width: constraints.maxWidth * .2,
                          child: TypeEventsSearchHomeWidgetPhone(
                              text: 'Additionnal', isValid: i == 1),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              )),
          Positioned(
              top: size.height * .08,
              child: Container(
                height: size.height,
                // color: ColorByDii.gris(),
                width: size.width,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      i == 0
                          ? Container(
                              child: Column(
                              children: [
                                Card(
                                  elevation: 2,
                                  child: Container(
                                    height: size.height * .06,
                                    width: size.width * .8,
                                    child: Center(
                                      child: TextFormField(
                                        showCursor: true,
                                        cursorColor: ColorByDii.gris(),
                                        initialValue: titreEvent,
                                        onChanged: (value) => setState(() {
                                          titreEvent = value;
                                        }),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            errorStyle: TextStyle(
                                              color: Colors.red,
                                            ),
                                            hintText:
                                                '\t\tTitre de l\'événement',
                                            hintStyle: TextStyle(
                                              color: ColorByDii.gris(),
                                            )),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * .02,
                                ),
                                Container(
                                  height: size.height * .06,
                                  width: size.width * .8,
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () => _selectDate(context),
                                        child: Card(
                                          child: Container(
                                            width: size.width * .3,
                                            height: size.height * .05,
                                            child: Row(
                                              children: [
                                                Spacer(),
                                                Icon(
                                                  Icons.calendar_today,
                                                  size: 24,
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Text(
                                                  ' Date ',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Spacer(),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      Card(
                                        child: Container(
                                          width: size.width * .3,
                                          child: Center(
                                            child: Text(
                                              ' ${selectedDate.day} ${ColorByDii.getMois(selectedDate.month)} ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w200,
                                                  color: ColorByDii.gris()),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * .02,
                                ),
                                Container(
                                  height: size.height * .06,
                                  width: size.width * .8,
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () => _selectTime(context),
                                        child: Card(
                                          child: Container(
                                            width: size.width * .3,
                                            height: size.height * .05,
                                            child: Row(
                                              children: [
                                                Spacer(),
                                                Icon(
                                                  Icons.timeline,
                                                  size: 24,
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Text(
                                                  ' Time ',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Spacer(),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      Card(
                                        child: Container(
                                          width: size.width * .3,
                                          child: Center(
                                            child: Text(
                                              ' ${selectedTime.hour} h - ${selectedTime.hour + 2} h ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w200,
                                                  color: ColorByDii.gris()),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * .02,
                                ),
                                Card(
                                  elevation: 2,
                                  child: Container(
                                    height: size.height * .06,
                                    width: size.width * .8,
                                    child: Center(
                                      child: TextFormField(
                                        showCursor: true,
                                        initialValue: lieuxEvent,
                                        cursorColor: ColorByDii.gris(),
                                        onChanged: (value) => setState(() {
                                          lieuxEvent = value;
                                        }),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            errorStyle: TextStyle(
                                              color: Colors.red,
                                            ),
                                            hintText:
                                                '\t\Lieux de l\'événement',
                                            hintStyle: TextStyle(
                                              color: ColorByDii.gris(),
                                            )),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * .02,
                                ),
                                Card(
                                  elevation: 2,
                                  child: Container(
                                    // height: size.height * .06,
                                    width: size.width * .8,
                                    child: Center(
                                      child: TextFormField(
                                        maxLines: 5,
                                        showCursor: true,
                                        cursorColor: ColorByDii.gris(),
                                        onChanged: (value) => setState(() {
                                          descriptionEvent = value;
                                        }),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            errorStyle: TextStyle(
                                              color: Colors.red,
                                            ),
                                            hintText:
                                                '\t\Description de l\'événement',
                                            hintStyle: TextStyle(
                                              color: ColorByDii.gris(),
                                            )),
                                      ),
                                    ),
                                  ),
                                ),
                                Card(
                                  elevation: 1,
                                  shadowColor: ColorByDii.blanc(),
                                  child: Container(
                                    height: size.height * .2,
                                    child: Column(
                                      children: [
                                        Spacer(),
                                        Container(
                                          // height: size.height * .05,
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: size.width * .05,
                                              ),
                                              Text(
                                                'Image',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Spacer(),
                                              Text(
                                                j == 0
                                                    ? 'Concert.jpg'
                                                    : j == 1
                                                        ? 'Conférence.jpg'
                                                        : j == 2
                                                            ? 'Cinéma.jpg'
                                                            : j == 3
                                                                ? 'Casting.jpg'
                                                                : '${image.path.split('/')[image.path.split('/').length - 1]}',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                              SizedBox(
                                                width: size.width * .05,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: size.height * .02,
                                        ),
                                        Container(
                                          height: size.height * .13,
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: size.width * .05,
                                              ),
                                              GestureDetector(
                                                onTap: getImage,
                                                child: Container(
                                                  height: size.height * .05,
                                                  width: size.height * .05,
                                                  decoration: BoxDecoration(
                                                      color: ColorByDii.noir(),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  child: Center(
                                                    child: Icon(
                                                      Icons.add,
                                                      color: ColorByDii.blanc(),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: size.width * .1,
                                              ),
                                              Container(
                                                width: size.width * .7,
                                                height: size.height * .1,
                                                child: ListView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  physics:
                                                      BouncingScrollPhysics(),
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () => setState(() {
                                                        j = 0;
                                                        urlChoix =
                                                            'https://sound2kill4.com/wp-content/uploads/2016/11/events.jpg';
                                                      }),
                                                      child: Container(
                                                        height:
                                                            size.height * .1,
                                                        width: size.width * .3,
                                                        child: AddEventPickDefaultWidgetPhone(
                                                            isActive: j == 0,
                                                            url:
                                                                'https://sound2kill4.com/wp-content/uploads/2016/11/events.jpg'),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: size.width * .05,
                                                    ),
                                                    GestureDetector(
                                                        onTap: () =>
                                                            setState(() {
                                                              j = 1;
                                                              urlChoix =
                                                                  'https://mylifeproject.org/wp-content/uploads/2020/07/new_statesman_events.jpg';
                                                            }),
                                                        child: Container(
                                                          height:
                                                              size.height * .1,
                                                          width:
                                                              size.width * .3,
                                                          child: AddEventPickDefaultWidgetPhone(
                                                              isActive: j == 1,
                                                              url:
                                                                  'https://mylifeproject.org/wp-content/uploads/2020/07/new_statesman_events.jpg'),
                                                        )),
                                                    SizedBox(
                                                      width: size.width * .05,
                                                    ),
                                                    GestureDetector(
                                                        onTap: () =>
                                                            setState(() {
                                                              j = 2;
                                                              urlChoix =
                                                                  'https://res.cloudinary.com/scentre-group-au/image/fetch/c_fill,q_auto,g_faces:auto,w_2500,h_1071,f_auto/https://images.ctfassets.net/zzgnkgna3r3g/jArDmclPIiwdsSOkfgqfC/c4ab49a61b4285db23682cf8a0c9c54f/Scentreconnect_Event_Cinemas_-_AU_master';
                                                            }),
                                                        child: Container(
                                                          height:
                                                              size.height * .1,
                                                          width:
                                                              size.width * .3,
                                                          child: AddEventPickDefaultWidgetPhone(
                                                              isActive: j == 2,
                                                              url:
                                                                  'https://res.cloudinary.com/scentre-group-au/image/fetch/c_fill,q_auto,g_faces:auto,w_2500,h_1071,f_auto/https://images.ctfassets.net/zzgnkgna3r3g/jArDmclPIiwdsSOkfgqfC/c4ab49a61b4285db23682cf8a0c9c54f/Scentreconnect_Event_Cinemas_-_AU_master'),
                                                        )),
                                                    SizedBox(
                                                      width: size.width * .05,
                                                    ),
                                                    GestureDetector(
                                                        onTap: () =>
                                                            setState(() {
                                                              j = 3;
                                                              urlChoix =
                                                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJgJhzi5-9avMLyehqK9YYUkz9SrAeSk0vrWN78eW52iSiTZV8FvNkN03MyXy2UEDqInI&usqp=CAU';
                                                            }),
                                                        child: Container(
                                                          height:
                                                              size.height * .1,
                                                          width:
                                                              size.width * .3,
                                                          child: AddEventPickDefaultWidgetPhone(
                                                              isActive: j == 3,
                                                              url:
                                                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJgJhzi5-9avMLyehqK9YYUkz9SrAeSk0vrWN78eW52iSiTZV8FvNkN03MyXy2UEDqInI&usqp=CAU'),
                                                        )),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ))
                          : Container(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: size.height * .05,
                                  ),
                                  Card(
                                    // color: Colors.black,
                                    child: Container(
                                      // height: size.height * .1,
                                      color: Colors.transparent,
                                      width: size.width * .8,
                                      child: Center(
                                          child: DropdownButton(
                                        underline: Container(),
                                        value: categorieEvent,
                                        hint: Container(
                                            width: size.width * .7,
                                            child: new Text(
                                                'Choisir une categorie')),
                                        items: <String>[
                                          '',
                                          'concert',
                                          'conference',
                                          'exposition',
                                          'sport'
                                        ].map((String value) {
                                          return new DropdownMenuItem<String>(
                                            value: value,
                                            child: Container(
                                                width: size.width * .7,
                                                child: new Text(value == ''
                                                    ? 'Choisir une categorie'
                                                    : value)),
                                          );
                                        }).toList(),
                                        onChanged: (c) {
                                          setState(() {
                                            categorieEvent = c as String;
                                          });
                                        },
                                      )),
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * .03,
                                  ),
                                  Container(
                                    height: size.height * .06,
                                    width: size.width * .8,
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () =>
                                              setState(() => isFree = false),
                                          child: Card(
                                            child: Container(
                                              width: size.width * .3,
                                              height: size.height * .05,
                                              child: Row(
                                                children: [
                                                  Spacer(),
                                                  Icon(
                                                    Icons.circle,
                                                    color: isFree
                                                        ? ColorByDii.blanc()
                                                        : ColorByDii.noir(),
                                                    size: 24,
                                                  ),
                                                  SizedBox(
                                                    width: 4,
                                                  ),
                                                  Text(
                                                    ' Payant ',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Spacer(),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        GestureDetector(
                                          onTap: () =>
                                              setState(() => isFree = true),
                                          child: Card(
                                            child: Container(
                                              width: size.width * .3,
                                              height: size.height * .05,
                                              child: Row(
                                                children: [
                                                  Spacer(),
                                                  Icon(
                                                    Icons.circle,
                                                    color: !isFree
                                                        ? ColorByDii.blanc()
                                                        : ColorByDii.noir(),
                                                    size: 24,
                                                  ),
                                                  SizedBox(
                                                    width: 4,
                                                  ),
                                                  Text(
                                                    ' Gratuit ',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Spacer(),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * .03,
                                  ),
                                  Card(
                                    elevation: 2,
                                    child: Container(
                                      height: size.height * .06,
                                      width: size.width * .8,
                                      child: Center(
                                        child: TextFormField(
                                          showCursor: true,
                                          cursorColor: ColorByDii.gris(),
                                          onChanged: (value) => setState(() {
                                            priceEvent = value;
                                          }),
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              errorStyle: TextStyle(
                                                color: Colors.red,
                                              ),
                                              hintText:
                                                  '\t\Prix de l\'événement',
                                              hintStyle: TextStyle(
                                                color: ColorByDii.gris(),
                                              )),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                      SizedBox(
                        height: size.height * .01,
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: ColorByDii.noir()),
                            onPressed: () async {
                              var id = FirebaseAuth.instance.currentUser!.uid;

                              if (j == -1) {
                              } else {
                                if (titreEvent == '' ||
                                    lieuxEvent == '' ||
                                    descriptionEvent == '' &&
                                        categorieEvent == '') {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          backgroundColor: ColorByDii.noir(),
                                          content: Row(
                                            children: [
                                              Text(
                                                  'Veuillez remplir tous les champs'),
                                              SizedBox(
                                                width: size.width * .2,
                                              ),
                                              CircularProgressIndicator(
                                                backgroundColor:
                                                    ColorByDii.noir(),
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                            Color>(
                                                        ColorByDii.blanc()),
                                              )
                                            ],
                                          )));
                                } else {
                                  FirebaseFirestore.instance
                                      .collection(EVENEMENTS_COLLECTION)
                                      .add({
                                    id: {
                                      "titre": titreEvent,
                                      "date": selectedDate.toString(),
                                      "time": selectedTime.hour,
                                      "lieux": lieuxEvent,
                                      "description":
                                          "La présentation que vous écrivez pour votre listing d’évènement devrait toujours refléter cela. Les gens ont ainsi plus de facilité à s’identifier à vous et vous voient moins comme un simple vendeur.",
                                      "image": urlChoix,
                                      "idUser": id,
                                      "isFree": isFree ? '1' : '0',
                                      "price": priceEvent,
                                      "categorie": categorieEvent
                                    }
                                  });

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          backgroundColor: ColorByDii.noir(),
                                          content: Row(
                                            children: [
                                              Text('Processing Data'),
                                              SizedBox(
                                                width: size.width * .2,
                                              ),
                                              CircularProgressIndicator(
                                                backgroundColor:
                                                    ColorByDii.noir(),
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                            Color>(
                                                        ColorByDii.blanc()),
                                              )
                                            ],
                                          )));
                                }
                              }
                            },
                            child:
                                Container(child: Text('Créer un événement ')),
                          )),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
