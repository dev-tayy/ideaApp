import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SlidableContainer extends StatefulWidget {
  final String username;
  //final String ideaTitle;
  //final String ideaText;
  const SlidableContainer(
      {Key key, this.username})
      : super(key: key);

  @override
  _SlidableContainerState createState() => _SlidableContainerState();
}

class _SlidableContainerState extends State<SlidableContainer> {
  bool onTapHeartIcon = false;
  bool onTapBookmarkIcon = false;
  bool onTapContainer = false;


  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      direction: Axis.horizontal,
      actionExtentRatio: 0.2,
      secondaryActions: <Widget>[
        IconSlideAction(
          icon: onTapHeartIcon
              ? FontAwesomeIcons.solidHeart
              : FontAwesomeIcons.heart,
          color: Color(0xFF161616),
          foregroundColor: onTapHeartIcon ? Colors.red : Colors.white,
          onTap: () {
            setState(() {
              onTapHeartIcon = !onTapHeartIcon;
            });
          },
        ),
        IconSlideAction(
          icon: FontAwesomeIcons.commentAlt,
          color: Color(0xFF161616),
        ),
        IconSlideAction(
          decoration: BoxDecoration(
            color: Color(0xFF161616),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
            ),
          ),
          icon: onTapBookmarkIcon ? Icons.bookmark : Icons.bookmark_border,
          color: Color(0xFF303030),
          foregroundColor: onTapBookmarkIcon ? Colors.blue : Colors.white,
          onTap: () {
            setState(() {
              onTapBookmarkIcon = !onTapBookmarkIcon;
            });
          },
        ),
      ],
      child: GestureDetector(
        onTap: () {
          setState(() {
            onTapContainer = !onTapContainer;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          decoration: BoxDecoration(
            color: Color(0xFF161616),
            borderRadius: onTapContainer
                ? BorderRadius.circular(10.0)
                : BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    topRight: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                  ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '@${widget.username}',
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        fontSize: 25.0,
                        height: 1.5,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.attach_file,
                    size: 25,
                  ),
                ],
              ),
              SizedBox(height: 5.0),
              Text(
                'ideaTitle',
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 23.0,
                    height: 1.5,
                  ),
                ),
              ),
              Text(
                'ideaText',
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                      fontSize: 19.0, height: 1.5, fontWeight: FontWeight.w200),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
