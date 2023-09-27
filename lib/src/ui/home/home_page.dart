import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';
import '../../cons/global_const.dart';
import '../../data/reaction_video_data.dart';
import '../../ui/home/widgets/profile_photo.dart';
import '../../ui/home/widgets/sprite_painter.dart';
import 'widgets/menu_dark_tile.dart';
import 'widgets/user_photo_border_gradient.dart';
import 'widgets/bottom_video_clipper.dart';
import 'widgets/notification_top_menu.dart';
import 'widgets/workspace_selection_card.dart';
import 'widgets/photo_user_meeting.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int _selectedWorkspacePage = 0;
  int _selectedMainPage = 0;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
    );
    _startAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _controller.stop();
    _controller.reset();
    _controller.repeat(
      period: Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalConst.primaryColor,
      body: Container(
        child: Row(
          children: [
            Container(
              width: 120,
              margin: EdgeInsets.symmetric(vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Text(
                        "zoom",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Hall"),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return ProfileImageView();
                              },
                            ),
                          );
                        },
                        child: Stack(
                          children: [
                            Center(
                              child: Hero(
                                tag: "view-image",
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  margin: EdgeInsets.only(top: 10),
                                  decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black38,
                                            blurRadius: 15.0,
                                            offset: Offset(0.0, 0.75))
                                      ],
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/avatar_29952508.jpeg')),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 22,
                              top: 4,
                              child: Container(
                                height: 15,
                                width: 15,
                                margin: EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    border: Border.all(
                                        color: GlobalConst.primaryColor,
                                        width: 3),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      WorkSpaceSelectionCard(
                        isActive: _selectedWorkspacePage == 0,
                        image: "assets/images/flutter-logo.png",
                        onTap: () {
                          setState(() {
                            _selectedWorkspacePage = 0;
                          });
                        },
                      ),
                      WorkSpaceSelectionCard(
                        isActive: _selectedWorkspacePage == 1,
                        image:
                            "assets/images/dart.jpg",
                        onTap: () {
                          setState(() {
                            _selectedWorkspacePage = 1;
                          });
                        },
                      ),
                      WorkSpaceSelectionCard(
                        isActive: _selectedWorkspacePage == 2,
                        image: 'assets/images/app-technology.jpg',
                        onTap: () {
                          setState(() {
                            _selectedWorkspacePage = 2;
                          });
                        },
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        margin: EdgeInsets.only(top: 20),
                        decoration: const BoxDecoration(
                            color: Color(0xFF37D2F8),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black38,
                                  blurRadius: 15.0,
                                  offset: Offset(0.0, 0.75))
                            ],
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.settings,
                        color: Colors.white.withOpacity(0.5),
                      ),
                      onPressed: () {})
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    width: 240,
                    height: MediaQuery.of(context).size.height,
                    margin: EdgeInsets.symmetric(vertical: 30),
                    decoration: BoxDecoration(
                        color: GlobalConst.secondColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          topLeft: Radius.circular(15),
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            alignment: Alignment.center,
                            margin:
                                const EdgeInsets.only(top: 20, left: 25, right: 25),
                            child: const TextField(
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0),
                                  fillColor: Colors.white12,
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.white12,
                                  ),
                                  hintStyle: TextStyle(
                                      color: Colors.white12, fontSize: 14),
                                  focusColor: Colors.transparent,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide.none),
                                  hintText: "Search"),
                            )),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 25),
                          padding:
                              EdgeInsets.only(top: 15, bottom: 15, left: 25),
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "MAIN APP",
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(color: Colors.white24, fontSize: 12),
                          ),
                        ),
                        MenuDarkTile(
                          active: _selectedMainPage == 0,
                          onTap: () {
                            setState(() {
                              _selectedMainPage = 0;
                            });
                          },
                          icon: Icons.dashboard,
                          title: "Dashboard",
                        ),
                        MenuDarkTile(
                          active: _selectedMainPage == 1,
                          onTap: () {
                            setState(() {
                              _selectedMainPage = 1;
                            });
                          },
                          icon: Icons.access_time,
                          title: "Daily Status",
                        ),
                        MenuDarkTile(
                          active: _selectedMainPage == 2,
                          onTap: () {
                            setState(() {
                              _selectedMainPage = 2;
                            });
                          },
                          icon: Icons.border_all,
                          title: "Boards",
                        ),
                        MenuDarkTile(
                          active: _selectedMainPage == 3,
                          onTap: () {
                            setState(() {
                              _selectedMainPage = 3;
                            });
                          },
                          icon: Icons.format_list_numbered,
                          title: "RoadMaps",
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 25),
                          padding:
                              EdgeInsets.only(top: 15, bottom: 15, left: 25),
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "WORK FLOW",
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(color: Colors.white24, fontSize: 12),
                          ),
                        ),
                        MenuDarkTile(
                          active: _selectedMainPage == 4,
                          onTap: () {
                            setState(() {
                              _selectedMainPage = 4;
                            });
                          },
                          icon: Icons.tv,
                          title: "Workshops",
                        ),
                        MenuDarkTile(
                          active: _selectedMainPage == 5,
                          onTap: () {
                            setState(() {
                              _selectedMainPage = 5;
                            });
                          },
                          icon: Icons.camera_alt,
                          title: "Video Calls",
                        ),
                        MenuDarkTile(
                          active: _selectedMainPage == 6,
                          onTap: () {
                            setState(() {
                              _selectedMainPage = 6;
                            });
                          },
                          icon: Icons.filter_drama,
                          title: "Files",
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 25),
                          padding:
                              EdgeInsets.only(top: 15, bottom: 15, left: 25),
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text(
                            "SETTINGS",
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(color: Colors.white24, fontSize: 12),
                          ),
                        ),
                        MenuDarkTile(
                          active: _selectedMainPage == 7,
                          onTap: () {
                            setState(() {
                              _selectedMainPage = 7;
                            });
                          },
                          icon: Icons.people,
                          title: "Team",
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 228,
                    child: Container(
                      width: 135,
                      height: MediaQuery.of(context).size.height - 60,
                      margin: EdgeInsets.symmetric(vertical: 30),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            topLeft: Radius.circular(15),
                          )),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "TEAM",
                              style: TextStyle(color: Color(0xFFC1C5D2)),
                            ),
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            margin: EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                                color: Color(0xFFD6E4ED),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            child: Center(
                                child: Text(
                              "M",
                              style: TextStyle(
                                  color: GlobalConst.secondColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            )),
                          ),
                          Divider(),
                          SizedBox(
                            height: 25,
                          ),
                          UserPhotoBorderGradient(
                            isGradient: true,
                            firstColor: Colors.yellow,
                            secondColor: Colors.redAccent,
                            photo: "assets/images/avatar_29952508.jpeg",
                            name: "Pedro",
                          ),
                          UserPhotoBorderGradient(
                            isGradient: true,
                            firstColor: Color(0xFF37D2F8),
                            secondColor: Colors.blue,
                            photo: "assets/images/avatar_20057010.jpeg",
                            name: "Bráulio",
                          ),
                          UserPhotoBorderGradient(
                            isGradient: false,
                            firstColor: Color(0xFF37D2F8),
                            secondColor: Colors.blue,
                            photo: "assets/images/avatar_20504726.jpeg",
                            name: "Eleandro",
                          ),
                          UserPhotoBorderGradient(
                            isGradient: false,
                            firstColor: Color(0xFF37D2F8),
                            secondColor: Colors.blue,
                            photo: "assets/images/avatar_47059370.jpeg",
                            name: "Dorivaldo",
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: GlobalConst.primaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width - 471,
                      height: MediaQuery.of(context).size.height - 60,
                      margin: EdgeInsets.symmetric(vertical: 30),
                      decoration: BoxDecoration(
                          color: Color(0xFFF1F7FB),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            topLeft: Radius.circular(15),
                          )),
                      child: Container(
                        margin: EdgeInsets.only(left: 125),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              children: [
                                FlutterReactionButtonCheck(
                                  reactions: facebookReactions,
                                  initialReaction: defaultInitialReaction,
                                  selectedReaction: facebookReactions[0],
                                  onReactionChanged: (Reaction, int, bool) {},
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                const NotificationTopMenu(
                                  icon: Icons.person_outline,
                                  title: "Márcio is working today remotely",
                                  color: Colors.black,
                                ),
                                NotificationTopMenu(
                                  icon: Icons.timer,
                                  title: "Last seen Yesterday, 17:24",
                                  color: Colors.black,
                                ),
                                Spacer(),
                                NotificationTopMenu(
                                  icon: Icons.check_circle,
                                  title: "78% STATUSES DONE",
                                  color: Colors.green,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 110,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      image: DecorationImage(
                                          image: AssetImage("assets/images/avatar_29952508.jpeg")),
                                      border: Border.all(
                                          color: Colors.white, width: 5),
                                      borderRadius: BorderRadius.circular(6)),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Márcio Quimbundo",
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 70,
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 5),
                                          decoration: BoxDecoration(
                                              color: Colors.red.withOpacity(.4),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: const Text(
                                            "NO STATUS TODAY",
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 12),
                                          ),
                                        )
                                      ],
                                    ),
                                    const Text(
                                      "Software Engineer",
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    NotificationTopMenu(
                                      icon: Icons.pin_drop,
                                      title: "Angola, Luanda",
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                                Spacer(),
                                Icon(
                                  Icons.settings,
                                  color: Colors.black38,
                                  size: 16,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 30),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 8),
                                  decoration: BoxDecoration(
                                      color: Color(0xFFFF625C),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.stop,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Stop Daily Status",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              child: Stack(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 30),
                                    height: MediaQuery.of(context).size.height -
                                        330,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                              "assets/images/jir-04656537-nam.webp",
                                            ),
                                            fit: BoxFit.cover),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 30),
                                    height: MediaQuery.of(context).size.height -
                                        330,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        gradient: LinearGradient(
                                            begin:
                                                FractionalOffset.bottomCenter,
                                            end: FractionalOffset.topCenter,
                                            colors: [
                                              Colors.transparent,
                                              Colors.black.withOpacity(.6),
                                            ],
                                            stops: [
                                              0.0,
                                              1.0
                                            ])),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    child: ClipPath(
                                      child: Container(
                                        height: 110,
                                        width:
                                            MediaQuery.of(context).size.height +
                                                110,
                                        margin: EdgeInsets.only(right: 30),
                                        decoration: BoxDecoration(
                                            color: GlobalConst.primaryColor,
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(20),
                                                bottomLeft:
                                                    Radius.circular(20))),
                                      ),
                                      clipper: BottomVideoClipper(),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 20,
                                    left: 20,
                                    child: Row(
                                      children: [
                                        PhotoUserMeeting(
                                          name: "Pedro",
                                          image:
                                              "assets/images/avatar_33294549.jpeg",
                                        ),
                                        PhotoUserMeeting(
                                          name: "Bráulio",
                                          image:
                                              "assets/images/avatar_20057010.jpeg",
                                        ),
                                        PhotoUserMeeting(
                                          name: "Eleandro",
                                          image:
                                              "assets/images/avatar_20504726.jpeg",
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: 20,
                                    left: 30,
                                    child: Container(
                                      child: const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Your Daily Status for Today",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16),
                                          ),
                                          Text(
                                            "Call with Teammates",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 20,
                                    right: 70,
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "3 People",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16),
                                          ),
                                          Text(
                                            "2 missing",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 30,
                                    left: 450,
                                    child: Container(
                                      child: Text(
                                        "02:35",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 70,
                                    left: 410,
                                    child: CustomPaint(
                                      painter: SpritePainter(_controller),
                                      child: Container(
                                        width: 120,
                                        height: 120,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: Colors.transparent),
                                        child: Icon(
                                          Icons.stop,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      top: 30,
                                      left: 400,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 5),
                                        decoration: BoxDecoration(
                                            color: Color(0xFFFFD3A9),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Text(
                                          "ONLY 02:23 LEFT",
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 12),
                                        ),
                                      )),
                                  Positioned(
                                    bottom: 50,
                                    right: 100,
                                    child: Container(
                                      width: 250,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            Icons.mic,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Icon(
                                            Icons.tv,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Icon(
                                            Icons.volume_up,
                                            color: Colors.white,
                                          ),
                                          Container(
                                            height: 2,
                                            width: 90,
                                            color: Colors.white,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
