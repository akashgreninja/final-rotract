import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rotaract_website/person.dart';
import 'package:rotaract_website/services/Database.dart';
import 'package:rotaract_website/services/sharedPref.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:rotaract_website/insta_logo.dart';

import '../footer.dart';

class Board extends StatefulWidget {
  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  ScrollController _scrollController;
  double _opacity = 0;
  double _scrollPosition = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  List _isHovering = [false, false, false, false, false, false, false];
  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  List<official> officials = [
    official(
        "Ananya Shree",
        "President",
        "https://www.linkedin.com/in/ananya-shree-6a39941a7/",
        "ananya.18699@gmail.com",
        "ananya.shreee",



        "ananya.jpg"),
    official(
        "Rohan Verma",
        "Immediate Past President",
        "https://www.linkedin.com/mwlite/in/rohan-verma-13978b16b",
        "vrohan607@gmail.com",
        "rohanverma99",
        "rohan.jpeg"),
    official(
        "Amisha Raj",
        "Vice-President",
        "http://linkedin.com/in/amisha-raj-3675a51b0",
        "amisharaj.ar@gmail.com",
        "amisha.raj",
        "amisha.jpg"),
    official(
        "Chandan V",
        "Secretary",
        "https://www.linkedin.com/in/chandan-venu-9a4b36190",
        "venuchandan21@gmail.com",
        "Chandan_venu",
        "chandan.jpg"),
    official(
        "Mansi S.J.",
        "Joint Secretary",
        null,
        "sjmansi06@gmail.com",
        "mansi.sj_",
        "mansi.jpg"),
    official(
        "Prasanna Bhagat",
        "Treasurer",
        "https://www.linkedin.com/in/prasanna-bhagat-aba949156/",
        "bhagatharshit10@gmail.com",
        "__harshitbhagat__",
        "Prasanna1.jpg"),
    official(
        "Sri Devi",
        "Sergeant At Arms",
        "https://www.linkedin.com/in/sridevi-bs-0a93611b6",
        "sridevibs2014@gmail.com",
        "sri_042",
        "sridevi.jpg"),
    official(
        "Mayank Karnatak", "Joint Sergeant At Arms", null,
        "maxopk13@gmail.com", "mayank_k_1301", "mayank.jpg"

    ),
    official(
        "Yashaswi",
        "Club Designer",
        null,
        "yashaswisingh47@gmail.com",
        "__yashaswi__0413",
        "Yashaswi.jpg"),
    official("Akash Uday",
        "Web Service Director",
        null,
        "akashuhulekal@gmail.com",
        "Ak_uh@13",
        "AkashUday.jpg"),
    official(
        "Akshay P Bhagwat",
        "International Service Director",
        null,
        "bhagwataky02@gmail.com",
        "_akshay_bhagwat_",
        "Akshay.jpeg"

    ),
    official(
        "KishanKumar Patel",
        "Media Lead",
        "https://www.linkedin.com/in/kishankumar-patel-3045001b7",
        "kp151162002@gmail.com",
        "key._.sun",
        "kishan.jpeg"),
    official(
        "Sumedha Joshi",
        "Community Service Director",
        "linkedIn.com/in/sumedha-joshi-490a1b190",
        "sumedhajoshi25@gmail.com",
        "sumedhajoshi_",
        "Sumedha.JPG"),
    official(
        "Divyam Nitin Vyast",
        "Club Service Director",
        "https://www.linkedin.com/in/divyam-nitin-vyas-633843210",
        "divyamnvyas@gmail.com",
        "div.vyas",
        "Divyam3.jpg"),
    official(
        "Nikhil Kumar",
        "Club Media Director",
        "https://www.linkedin.com/in/nikhil-kumar-43a487220",
        "nikhilnikki214@gmail.com",
        "nikhilmdb",
        "NIKHIL.jpg"),
    official(
        "Arpita Annigeri",
        "Public Relations Director",
        null,
        "arpitaannigeri0@gmail.com",
        "arpita.annigeri",
        "Arpita.jpg"),
    official(
        "Aatmika Mishra",
        "Editorial",
        null,
        "aatmikamishra2711@gmail.com",
        "aatmikamishr",
        "Aatmika5.jpg"),
    official("Anushka Thakur ", "Editorial", "https://www.linkedin.com/in/anushka-thakur-231419201", "thakuranushka8459@gmail.com ",
        "thakur_anushka0212", "Anushka.jpg"),
    official("Likitha M", "Editorial", "https://www.linkedin.com/in/likitha-m-678a08203", "likithamuthukumar@gmail.com",
        "likitha_muthu_kumar", "Likitha.jpg"),
    official("Swathy.K.J", "Editorial", null,
        "swathy080901@gmail.com", "@_s.kj_", "Swathy.jpg"),
    official(
        "Koushal M Shastry",
        "Event-Co-ordinator",
        null,
        "koushalmshastry15@gmail.com",
        "Koushalmshastry",
        "koushal.jpg"),
    official(
        "Manognya Lokesh Reddy",
        "Event Co-ordinator",
        null,
        "manognya.l2003@gmail.com",
        "captain_chaos_86_",
        "Manognya.jpeg"),
    official(
        "Prerana G.P ",
        "Event Co-ordinator",
        "http://www.linkedin.com/in/prerana-gp",
        "gpprerana18@gmail.com ",
        "prerana_g.p ",
        "Prerana.jpg"),
    official(
        "SUNAINA G P ",
        "Event Co-ordinator",
        null,
        "gpsunaina@gmail.com  ",
        "gpsunaina  ",
        "Sunaina.jpg"),
    official(
        "Shashank Bhat",
        "Club Photographer",
        null,
        "shashankbhat2002@gmail.com ",
        "_.trappedinpixels._ ",
        "Shashank.jpg"),



  ];
  var screenSize;
  List<Widget> Cards_mobile() {
    final DarkThemeProvider themeChange =
        Provider.of<DarkThemeProvider>(context);
    return officials.map((e) {
      return Card(
        elevation: 8,
        child: InkWell(
          child: Container(
            height: screenSize.height * 0.5,
            width: screenSize.width - 32,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: screenSize.height * 0.3,
                  width: screenSize.width - 32,
                  child: Stack(children: [
                    Container(
                      color: Colors.blue,
                    ),
                    Image.asset('rcbit/' + e.pic,
                        scale: 0.002, fit: BoxFit.fill),
                  ]),
                ),
                // SizedBox(
                //   width: screenSize.width*0.01,
                // ),
                Padding(
                  padding: EdgeInsets.all(screenSize.height * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "Rtr. ${e.name}",
                        style: GoogleFonts.montserrat(
                            fontSize: 26,
                            color: themeChange.darkTheme
                                ? Colors.orange[400]
                                : Colors.grey[900]),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.01,
                      ),
                      Text(
                        e.Designation,
                        style: GoogleFonts.montserrat(
                            fontSize: 22, color: Colors.grey[600]),
                      ),
                      SizedBox(height: screenSize.height * 0.02),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: [
                          InkWell(
                            child: Container(
                              child: Image.network(
                                  'https://www.freepnglogos.com/download/2428',
                                  fit: BoxFit.cover),
                              height: screenSize.height * 0.05,
                              width: screenSize.height * 0.05,
                            ),
                            onTap: () {
                              _launchURL(
                                  "https://www.instagram.com/${e.insta}");
                            },
                            hoverColor: Colors.transparent,
                          ),
                          SizedBox(
                            width: screenSize.width * 0.02,
                          ),
                          e.linkedIn == null
                              ? SizedBox(width: 0)
                              : InkWell(
                                  child: Container(
                                    child: Image.network(
                                        'https://www.freepnglogos.com/download/1841',
                                        fit: BoxFit.cover),
                                    height: screenSize.height * 0.05,
                                  ),
                                  onTap: () {
                                    _launchURL(e.linkedIn);
                                  },
                                  hoverColor: Colors.transparent,
                                ),
                          SizedBox(
                            width: screenSize.width * 0.02,
                          ),
                          InkWell(
                            child: Container(
                              child: Image.network(
                                  'https://www.freepnglogos.com/download/9983',
                                  fit: BoxFit.cover),
                              height: screenSize.height * 0.05,
                            ),
                            onTap: () {
                              _launchURL(e.email);
                            },
                            hoverColor: Colors.transparent,
                          ),
                          SizedBox(
                            width: screenSize.width * 0.02,
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }).toList();
  }

  List<Column> Cards_desktop() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return officials.map((e) {
      return Column(
        children: [
          Card(
            elevation: 8,
            child: InkWell(
              child: Container(
                height: screenSize.height * 0.3,
                width: screenSize.width * 0.6,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      height: screenSize.height * 0.3,
                      width: screenSize.width * 0.2,
                      child: CircleAvatar(
                        radius: 80,
                        backgroundImage: ExactAssetImage(
                          'rcbit/${e.pic}',
                          scale: 0.002,
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   width: screenSize.width*0.01,
                    // ),
                    Padding(
                      padding: EdgeInsets.all(screenSize.height * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Rtr. ${e.name}",
                                style: GoogleFonts.monda(
                                    fontSize: 26,
                                    color: themeChange.darkTheme
                                        ? Colors.orange[400]
                                        : Colors.grey[900]),
                              ),
                              SizedBox(
                                height: screenSize.height * 0.01,
                              ),
                              Text(
                                e.Designation,
                                style: GoogleFonts.montserrat(
                                    fontSize: 22,
                                    color: themeChange.darkTheme
                                        ? Colors.blue[400].withOpacity(0.6)
                                        : Colors.grey[600]),
                              ),
                            ],
                          ),
                          SizedBox(height: screenSize.height * 0.02),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                child: Container(
                                  child: Image.network(
                                      'https://www.freepnglogos.com/download/2428',
                                      fit: BoxFit.cover),
                                  height: screenSize.height * 0.05,
                                  width: screenSize.height * 0.05,
                                ),
                                onTap: () {
                                  _launchURL(
                                      "https://www.instagram.com/${e.insta}");
                                },
                                hoverColor: Colors.transparent,
                              ),
                              SizedBox(
                                width: screenSize.width * 0.02,
                              ),
                              e.linkedIn == null
                                  ? SizedBox(width: 0)
                                  : InkWell(
                                      child: Container(
                                        child: Image.network(
                                            'https://www.freepnglogos.com/download/1841',
                                            fit: BoxFit.cover),
                                        height: screenSize.height * 0.05,
                                      ),
                                      onTap: () {
                                        _launchURL(e.linkedIn);
                                      },
                                      hoverColor: Colors.transparent,
                                    ),
                              SizedBox(
                                width: screenSize.width * 0.02,
                              ),
                              InkWell(
                                child: Container(
                                  child: Image.network(
                                      'https://www.freepnglogos.com/download/9983',
                                      fit: BoxFit.cover),
                                  height: screenSize.height * 0.05,
                                ),
                                onTap: () {
                                  _launchURL("mailto:${e.email}");
                                },
                                hoverColor: Colors.transparent,
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: screenSize.height * 0.04)
        ],
      );
    }).toList();
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      _scrollListener();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    bool isScreenSmall = screenSize.width < 800;
    _opacity = _scrollPosition < screenSize.height * 0.4 ? 0.75 : 1;
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: isScreenSmall
          ? AppBar(
              title: Image.asset(
                'title_logo.png',
                fit: BoxFit.contain,
                height: screenSize.height * 0.08,
              ),
              backgroundColor: Colors.grey.withOpacity(_opacity),
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, screenSize.height * 0.15),
              child: Card(
                elevation: 10,
                color: Colors.grey[900].withOpacity(_opacity),
                child: Container(
                  color: Colors.grey[900].withOpacity(_opacity),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: screenSize.width * 0.1),
                    child: Row(
                      children: [
                        Image.asset('title_logo.png', height: 250.0),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/');
                                },
                                onHover: (ishoverd) {
                                  setState(() {
                                    _isHovering[0] = ishoverd;
                                  });
                                },
                                child: Text(
                                  'Home',
                                  style: TextStyle(
                                      color: _isHovering[0]
                                          ? Colors.pink
                                          : Colors.orange,
                                      fontFamily: 'Montserrat',
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(width: screenSize.width / 20),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/events');
                                },
                                onHover: (ishoverd) {
                                  setState(() {
                                    _isHovering[1] = ishoverd;
                                  });
                                },
                                child: Text(
                                  'Events',
                                  style: TextStyle(
                                      color: _isHovering[1]
                                          ? Colors.pink
                                          : Colors.orange,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(width: screenSize.width / 20),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/rotary');
                                },
                                onHover: (ishoverd) {
                                  setState(() {
                                    _isHovering[2] = ishoverd;
                                  });
                                },
                                child: Text(
                                  'Rotary',
                                  style: TextStyle(
                                      color: _isHovering[2]
                                          ? Colors.pink
                                          : Colors.orange,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(width: screenSize.width / 20),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/board');
                                },
                                onHover: (ishoverd) {
                                  setState(() {
                                    _isHovering[3] = ishoverd;
                                  });
                                },
                                child: Text(
                                  'Board',
                                  style: TextStyle(
                                      color: _isHovering[3]
                                          ? Colors.pink
                                          : Colors.orange,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                              SizedBox(width: screenSize.width / 20),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/contact_us');
                                },
                                onHover: (ishoverd) {
                                  setState(() {
                                    _isHovering[4] = ishoverd;
                                  });
                                },
                                child: Text(
                                  'Contact Us',
                                  style: TextStyle(
                                      color: _isHovering[4]
                                          ? Colors.pink
                                          : Colors.orange,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            ],
                          ),
                        ),
                        themeChange.isSignedIn
                            ? DropdownButton<String>(
                                // value: themeChange.username!=null && !themeChange.username.isEmpty?themeChange.username:'Loading',
                                iconSize: 0,
                                value: "DashBoard",
                                elevation: 8,
                                underline: Container(
                                  height: 2,
                                  color: Colors.transparent,
                                ),
                                onChanged: (val) {
                                  setState(() {
                                    if (val.compareTo("Sign Out") == 0) {
                                      Database("", "", "", "", "", "")
                                          .signOut();
                                      themeChange.username = "";
                                      themeChange.email = "";
                                      themeChange.isSignedIn = false;
                                    } else if (val.compareTo("DashBoard") == 0)
                                      Navigator.pushNamed(
                                          context, '/dashboard');
                                  });
                                },
                                style: GoogleFonts.montserrat(
                                  color: Colors.orange,
                                ),
                                items: <String>[
                                  'DashBoard',
                                  'Sign Out'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              )
                            : Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      _launchURL(
                                          'https://rzp.io/l/rotaractRegistration');
                                    },
                                    onHover: (val) {
                                      setState(() {
                                        _isHovering[5] = val;
                                      });
                                    },
                                    child: Text(
                                      "Register",
                                      style: GoogleFonts.openSans(
                                          fontWeight: FontWeight.w400,
                                          color: _isHovering[5]
                                              ? Colors.pink
                                              : Colors.orange,
                                          fontSize: 17),
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenSize.width * 0.01,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, '/login');
                                    },
                                    onHover: (val) {
                                      setState(() {
                                        _isHovering[6] = val;
                                      });
                                    },
                                    child: Text(
                                      "Log In",
                                      style: GoogleFonts.openSans(
                                          fontWeight: FontWeight.w400,
                                          color: _isHovering[6]
                                              ? Colors.pink
                                              : Colors.orange,
                                          fontSize: 17),
                                    ),
                                  ),
                                ],
                              ),
                        SizedBox(width: screenSize.width * 0.01),
                        IconButton(
                          icon: Icon(Icons.brightness_medium,
                              color: themeChange.darkTheme
                                  ? Colors.white
                                  : Colors.grey[400]),
                          onPressed: () {
                            themeChange.darkTheme = !themeChange.darkTheme;
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
      drawer: isScreenSmall
          ? Drawer(
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    child: Column(
                      children: [
                        Image.asset('assets/title_logo.png',
                            height: 120.0, width: 250.0, scale: 0.1),
                        Text('Rotaract Club of BIT'),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: themeChange.darkTheme
                            ? Colors.grey[400]
                            : Colors.grey[900],
                        shape: BoxShape.rectangle),
                  ),
                  ListTile(
                    title: Text('Home'),
                    leading: Icon(Icons.home),
                    onTap: () {
                      Navigator.pushNamed(context, '/');
                    },
                  ),
                  ListTile(
                    title: Text('Rotary'),
                    leading: Icon(Icons.settings),
                    onTap: () {
                      Navigator.pushNamed(context, '/rotary');
                    },
                  ),
                  ListTile(
                    title: Text('Events'),
                    leading: Icon(Icons.calendar_today),
                    onTap: () {
                      Navigator.pushNamed(context, '/events');
                    },
                  ),
                  ListTile(
                    title: Text('Board'),
                    leading: Icon(Icons.people, color: Colors.orange),
                    onTap: () {
                      Navigator.pushNamed(context, '/board');
                    },
                  ),
                  ListTile(
                    title: Text('Contact us'),
                    leading: Icon(Icons.contact_mail),
                    onTap: () {
                      Navigator.pushNamed(context, '/contact_us');
                    },
                  ),
                  themeChange.isSignedIn
                      ? Column(
                          children: [
                            ListTile(
                              title: Text('DashBoard'),
                              leading: Icon(Icons.person),
                              onTap: () {
                                Navigator.pushNamed(context, '/dashboard');
                              },
                            ),
                            ListTile(
                              title: Text('Sign Out'),
                              leading: Image.network(
                                  'https://img.icons8.com/fluent-systems-regular/24/000000/exit.png'),
                              onTap: () {
                                Database("", "", "", "", "", "").signOut();
                                themeChange.username = "";
                                themeChange.email = "";
                                themeChange.isSignedIn = false;
                              },
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            ListTile(
                              title: Text('Register'),
                              leading: Icon(Icons.person_add),
                              onTap: () {
                                _launchURL(
                                    'https://rzp.io/l/rotaractRegistration');
                              },
                            ),
                            ListTile(
                              title: Text('Log In'),
                              leading: Icon(Icons.person),
                              onTap: () {
                                Navigator.pushNamed(context, '/login');
                              },
                            ),
                          ],
                        ),
                ],
              ),
            )
          : null,
      backgroundColor: Theme.of(context).backgroundColor,

      body: Stack(
        children: [
          Center(
            child: Opacity(
              opacity: 0.4,
              child: themeChange.darkTheme
                  ? Image.asset('rcbit_logo.png')
                  : Image.asset('blue_rcbit_logo.png'),
            ),
          ),
          SingleChildScrollView(
            controller: _scrollController,
            child: Container(
              // color: Theme.of(context).backgroundColor,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: isScreenSmall
                            ? screenSize.height * 0.3
                            : screenSize.height * 0.45,
                        width: screenSize.width,
                        child: Image.asset(
                            themeChange.darkTheme
                                ? 'celeberation_image.webp'
                                : 'celeberation_image_orange.webp',
                            fit: isScreenSmall ? BoxFit.fill : BoxFit.cover),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: screenSize.height * 0.05,
                        horizontal: isScreenSmall
                            ? screenSize.width * 0.04
                            : screenSize.width * 0.1),
                    child: isScreenSmall
                        ? Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Our Board Members',
                                style: GoogleFonts.montserrat(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: themeChange.darkTheme
                                        ? Colors.grey[400]
                                        : Colors.grey[900]),
                              ),
                              SizedBox(
                                height: screenSize.height * 0.08,
                              ),
                              Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: Cards_mobile())
                            ],
                          )
                        : Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Our Board Members',
                                style: GoogleFonts.montserrat(
                                    fontSize: 40, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: screenSize.height * 0.08,
                              ),
                              Column(
                                children: Cards_desktop(),
                              )
                            ],
                          ),
                  ),
                  Footer(),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: isScreenSmall
          ? FloatingActionButton(
              backgroundColor:
                  themeChange.darkTheme ? Colors.grey : Colors.black12,
              onPressed: () {
                themeChange.darkTheme = !themeChange.darkTheme;
              },
              child: Icon(Icons.brightness_medium,
                  color:
                      themeChange.darkTheme ? Colors.white : Colors.grey[800]),
            )
          : null,
    );
  }
}
