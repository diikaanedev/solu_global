import 'package:flutter/material.dart';
import 'package:solu2_0/ui-phone/widget/comment-post-widget.dart';
import 'package:solu2_0/ui-phone/widget/enregistre-post-widget.dart';
import 'package:solu2_0/ui-phone/widget/favorie-post-widget.dart';
import 'package:solu2_0/ui-phone/widget/share-post-widget.dart';
import 'package:solu2_0/utils/constant-by-dii.dart';

class PostHomeSocialLinkWidget extends StatefulWidget {
  @override
  _PostHomeSocialLinkWidgetState createState() =>
      _PostHomeSocialLinkWidgetState();
}

class _PostHomeSocialLinkWidgetState extends State<PostHomeSocialLinkWidget> {
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
        builder: (context, constraints) => Stack(
          children: [
            Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              // color: cons.rose(),
            ),
            Positioned(
                top: constraints.maxHeight * .02,
                left: constraints.maxHeight * .05,
                child: Container(
                  height: constraints.maxHeight * .12,
                  width: constraints.maxHeight * .12,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://www.wallpapertip.com/wmimgs/141-1418814_bhojpuri-actress-hd-wallpaper-photo-image-sanchita-banerjee.jpg'),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(constraints.maxHeight),
                    // borderRadius: BorderRadius.circular(8),
                    color: cons.noir(),
                  ),
                )),
            Positioned(
                top: constraints.maxHeight * .02,
                left: constraints.maxHeight * .18,
                child: Container(
                  height: constraints.maxHeight * .12,
                  width: constraints.maxWidth * .5,
                  child: Column(
                    children: [
                      Spacer(),
                      Container(
                        width: constraints.maxWidth * .5,
                        child: Text(
                          'diikaanedev',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: cons.gris(),
                              fontSize: constraints.maxHeight * .04),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                )),
            Positioned(
                top: constraints.maxHeight * .02,
                right: constraints.maxHeight * .05,
                child: Container(
                  child: Icon(
                    Icons.more_vert_outlined,
                    size: constraints.maxHeight * .07,
                  ),
                )),
            Positioned(
                top: constraints.maxHeight * .15,
                left: constraints.maxWidth * .05,
                child: Container(
                  height: constraints.maxHeight * .7,
                  width: constraints.maxWidth * .9,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://cherrypulp.com/content/uploads/2019/06/cherry-pulp-articles-banques-images-gratuites.jpg'),
                          fit: BoxFit.cover),
                      boxShadow: [BoxShadow(color: cons.gris(), blurRadius: 2)],
                      borderRadius: BorderRadius.circular(8)),
                )),
            Positioned(
                bottom: 0,
                child: Container(
                  height: constraints.maxHeight * .15,
                  width: constraints.maxWidth,
                  child: Row(
                    children: [
                      SizedBox(
                        width: constraints.maxWidth * .07,
                      ),
                      Container(
                        width: constraints.maxWidth * .2,
                        height: constraints.maxHeight * .15,
                        child: FavoriePostWidget(),
                      ),
                      Container(
                        width: constraints.maxWidth * .2,
                        height: constraints.maxHeight * .15,
                        child: CommentPostWidget(),
                      ),
                      // Container(
                      //   width: constraints.maxWidth * .2,
                      //   height: constraints.maxHeight * .15,
                      //   child: SharePostWidget(),
                      // ),
                      Spacer(),
                      Container(
                        width: constraints.maxWidth * .2,
                        height: constraints.maxHeight * .15,
                        child: EnregistrePostWidget(),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      );
}
