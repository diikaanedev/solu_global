import 'package:flutter/material.dart';
import 'package:solu2_0/utils/constant-by-dii.dart';

class HomeButtonNavBarWidget extends StatefulWidget {
  final int intChoix;

  const HomeButtonNavBarWidget({Key? key, required this.intChoix})
      : super(key: key);
  @override
  _HomeButtonNavBarWidgetState createState() => _HomeButtonNavBarWidgetState();
}

class _HomeButtonNavBarWidgetState extends State<HomeButtonNavBarWidget> {
  late ConstantByDii cons;
  late int screenChoix;

  @override
  void initState() {
    super.initState();
    setState(() {
      cons = ConstantByDii();
      screenChoix = widget.intChoix;
    });
  }

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => Row(
          children: [
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
              child: Icon(
                Icons.home_rounded,
                size: constraints.maxWidth * .09,
                color: screenChoix == 0
                    ? cons.blanc()
                    : cons.blanc().withOpacity(.2),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/search');
              },
              child: Icon(
                Icons.search_rounded,
                size: constraints.maxWidth * .09,
                color: screenChoix == 1
                    ? cons.blanc()
                    : cons.blanc().withOpacity(.2),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/add-event');
              },
              child: Icon(
                Icons.add_circle_outline_rounded,
                size: constraints.maxWidth * .09,
                color: screenChoix == 2
                    ? cons.blanc()
                    : cons.blanc().withOpacity(.2),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/message');
              },
              child: Icon(
                Icons.message_outlined,
                size: constraints.maxWidth * .09,
                color: screenChoix == 3
                    ? cons.blanc()
                    : cons.blanc().withOpacity(.2),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: Icon(
                Icons.person,
                size: constraints.maxWidth * .09,
                color: screenChoix == 4
                    ? cons.blanc()
                    : cons.blanc().withOpacity(.2),
              ),
            ),
            Spacer(),
          ],
        ),
      );
}
