import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:solu2_0/ui-phone/widget/add-post-widget-icon-text-phone.dart';
import 'package:solu2_0/utils/constant-by-dii.dart';

class AddPostWidgetPhone extends StatefulWidget {
  @override
  _AddPostWidgetPhoneState createState() => _AddPostWidgetPhoneState();
}

class _AddPostWidgetPhoneState extends State<AddPostWidgetPhone> {
  late ConstantByDii cons;

  @override
  void initState() {
    super.initState();
    setState(() {
      cons = ConstantByDii();
    });
  }

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => Column(
          children: [
            SizedBox(
              height: constraints.maxHeight * .02,
            ),
            Container(
              height: constraints.maxHeight * .1,
              child: Row(
                children: [
                  SizedBox(
                    width: constraints.maxWidth * .05,
                  ),
                  CircleAvatar(
                    backgroundColor: cons.gris(),
                    backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRg901L4yBxZC83UJuA-Tb3W3gokGaxUm61gw&usqp=CAU'),
                  ),
                  SizedBox(
                    width: constraints.maxWidth * .03,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Spacer(),
                        Container(child: Text('diikaanedev')),
                        Spacer(),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: constraints.maxHeight * .3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  cursorColor: cons.noir(),
                  autofocus: true,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'Qu\'est ce qui se passe , diikaanedev ?',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Container(
              height: constraints.maxHeight * .1,
              child: Row(
                children: [
                  Spacer(),
                  Container(
                    width: constraints.maxWidth * .45,
                    child: Column(
                      children: [
                        Spacer(),
                        Container(
                          height: constraints.maxHeight * .045,
                          child: AddPOstWidgetIconTextPhone(
                              iconData: Icons.image_rounded, text: 'Gallery'),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: cons.gris()),
                        ),
                        Spacer(),
                        Container(
                          height: constraints.maxHeight * .045,
                          child: AddPOstWidgetIconTextPhone(
                              iconData: Icons.pin_drop_outlined,
                              text: 'Location'),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: cons.gris()),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: constraints.maxWidth * .45,
                    child: Column(
                      children: [
                        Spacer(),
                        Container(
                          height: constraints.maxHeight * .045,
                          child: AddPOstWidgetIconTextPhone(
                              iconData: Icons.link, text: 'Attachement'),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: cons.gris()),
                        ),
                        Spacer(),
                        Container(
                          height: constraints.maxHeight * .045,
                          child: AddPOstWidgetIconTextPhone(
                              iconData: Icons.person_add,
                              text: 'Inviter des amies'),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: cons.gris()),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  Spacer(),
                ],
              ),
            )
          ],
        ),
      );
}
