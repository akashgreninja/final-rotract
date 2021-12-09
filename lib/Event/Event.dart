import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rotaract_website/event.dart';
import 'package:rotaract_website/footer.dart';
import 'package:rotaract_website/services/Database.dart';
import 'package:rotaract_website/services/sharedPref.dart';

import 'package:url_launcher/url_launcher.dart';

class Event extends StatefulWidget {
  @override
  _EventState createState() => _EventState();
}

class _EventState extends State<Event> {
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

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      _scrollListener();
    });
    super.initState();
  }

  List<Event_detail> events = [
    
    Event_detail(
        "Run_for_hunger(1).jpeg",
        "RUN FOR HUNGER",
        DateTime(2020, 10,10),
        "Professional Service",
        "We the Rotaract Club of Bangalore B.I.T. organised the event Run For Hunger and the The event was an initiative to feed the underprivileged group of individuals who struggle to fill their stomach on a daily basis. This event was conducted on 10/10/2021 in Bangalore institute of technology. It was a community service project and a total of 190 participants took part. The main objective of the event was to provide atleast one proper nutritious meal to around 2500 needy ones with the funds that were raised . RUN FOR HUNGER was successfully organised and executed.  Rotaract Club of Bangalore B.I.T. is honoured to have been part of this initiative in eradicating hunger. Even though it may seem like a small step, by working together we can get rid our country's poverty   "),
    Event_detail(
        "Treaking.jpg",
        "The Megatrek V5.0",
        DateTime(2020, 09, 12),
        "International/Professional Service",


       " This event was conducted on 24/10/2021 at Hutridurga betta It was an International/Professional service project and a total of 1800 people many enthusiastic participants took part in the trek. The buses left the campus at 7:15 A.M. and reached Hutridurga betta at 10 A.M. We started our trek gradually, after few kilometers of the trek, breakfast was served and we started with the second part "
         " The slope was steep and the participants were patient and majority of them made it to the "
          "top. The view from the top was mesmerizing. Then we had to trail down the hill to get back to"
           " the place where the lunch was served. After the tiring trek and the delicious lunch, a"
         "felicitation ceremony was held in order to encourage all the clubs which joined hands and"
        "took part in the trek. After the ceremony, the participants were guided back to their buses by"
          "the organizers and we finally reached our campus back at 7:45 P.M. The entire trek was amazing and very well organized." ),

    Event_detail(
        "Canopy.jpg",
        "The Canopy of Hope",
        DateTime(2020, 09, 12),
        "Community Service",
        "This event was conducted on 14/11/2021 in J.P nagar and Jayanagar"

      "3rd block. This event was a Community service project and 6 people took part in it. The"
  "women workers at these construction sites often carry their babies with them to work, but it"
      "becomes difficult for them to look after their kids in between their working hours. Hence, this"
      "initiative was taken, so that the women can take care of their children when they work. The"
      "canopies were given to the mothers, so that her children could sleep soundly next to her"
  "while she works and she won't have to worry about her baby being uncomfortable. Rotaract"
  "Club of Bangalore B.I.T. is grateful to have been a part of this project. The beautiful smiles of"
      "the kids have encouraged us to work towards bringing happiness and spreading love in this"
  "world in the form of services to the community and humanity. We look forward to"
  "participating in many such projects and events."),
    // Event_detail("bgt.jpeg", "BGT", DateTime(2020,9,12), "Community Service", "Rotaract Club of Bangalore B.I.T. organized BIT's Got Talent on 19th October 2019. All the students participated enthusiastically and showed some amazing skills. We were delighted to witness plethora of talents and we wholeheartedly appreciate everyone who participated in the event. We were immensely honoured to have Rtn. Rahul Raghavan, Rtr. Pooja Girish and Dhanush as our judges and we congratulate our winner PRATUYSH SINHA, 1st runner up OVAIS KAREEM and BHAVESH PRASAD and 2nd runner up SAHANA."),
    Event_detail(
        "Book_donation.jpg",
        "Book donation",
        DateTime(2020, 9, 12),
        "Community Service",
        "We make a living by what we get; we make a life by what we give ."
      "Giving is not just about making a donation. It's also about making a difference. Rotaract Club"
      "of Bangalore B.I.T. organized a book donation event 'SHARE TO CARE', on the account of"
    "children’s day. This event was conducted on 24/11/2021 at Sajjan rao school, VV Puram. It"
     "was a community service project. The motive of this event was to spread the joy of reading"
      "among underprivileged children. No one has ever become poor by giving. We rise by lifting"
      "others, so we took a step forward to donate books for a good cause. We donated books like"
      "magazines, novels, story books, general knowledge books, and other stationary stuffs (pen,"
      "pencil, pencil box etc.). We got around 100+ books and a good stock of stationary items."),
    //Event_detail(
    //     "abacus.jpeg",
    //     "Abacus",
    //     DateTime(2020, 9, 12),
    //     "Community Service",
    //     "Rotaract Club of Bangalore B.I.T. in association with our parent Rotary, Rotary Bangalore South East and Anusiri Academy organized the Annual Abacus Competition on 12th January at Bangalore Institute of Technology. The event commenced with zeal and around 500 students from various schools across Bangalore participated in the event. The team of RCBIT along with its dedicated volunteers ensured smooth flow of the event and made it a success. Other than Abacus, events such as drawing, chess, rubik\'s cube, painting and calligraphy also took place. Altogether, the team had a great time conducting the event and interacting with the students."),
    // Event_detail(
    //     "pratibha.JPG",
    //     "Pratibha",
    //     DateTime(2020, 9, 12),
    //     "Community Service",
    //     "Rotaract District Council 3190 in association with Rotaract Club of Bangalore B.I.T. and Rotaract Club of Presidency College conducted an event Pratibha-2k19 on 26th of October at Kuvempu Kalakshetra. \"Pratibha\" is a cultural fest that provided a great platform to government school children to showcase their talents. It comprised of several events like singing, dance, drama, pot painting, face-painting, mehendi, rangoli, mono-acting etc. The school children were trained in their respective genre. The event ended with prize distribution ceremony for the children. All together, the event was filled with plethora of cultural performances by Government school children and loads of fun activities."),
    // Event_detail(
    //     "bgt.jpeg",
    //     "BGT",
    //     DateTime(2020, 9, 12),
    //     "Professional Service",
    //     "Rotaract Club of Bangalore B.I.T. organized BIT's Got Talent on 19th October 2019. All the students participated enthusiastically and showed some amazing skills. We were delighted to witness plethora of talents and we wholeheartedly appreciate everyone who participated in the event. We were immensely honoured to have Rtn. Rahul Raghavan, Rtr. Pooja Girish and Dhanush as our judges and we congratulate our winner PRATUYSH SINHA, 1st runner up OVAIS KAREEM and BHAVESH PRASAD and 2nd runner up SAHANA."),
  ];
  bool isScreenSmall = false;
  var screenSize;
  List<Column> getEventDetails() {
    return events
        .map((e) => Column(
              children: [
                Column(
                  //column to contain info of event
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Image.asset(e.pic),
                      height: isScreenSmall
                          ? screenSize.height * 0.2
                          : screenSize.height * 0.8,
                      width: isScreenSmall
                          ? screenSize.width * 0.95
                          : screenSize.width * 0.7,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //column to contain text information of event
                      children: [
                        Text(
                          e.name,
                          textAlign: TextAlign.start,
                          style: GoogleFonts.montserrat(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          //category
                          e.category,
                          style: GoogleFonts.robotoCondensed(
                              fontSize: 25, color: Colors.orange),
                        ),
                        // Text(
                        //    "${e.dateTime.day}-${e.dateTime.month}-${e.dateTime.year}",
                        //   style: GoogleFonts.montserrat(
                        //       fontSize: 20,
                        //       color: Colors.pink,
                        //       fontWeight: FontWeight.bold
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: screenSize.height*0.05,
                        // ),
                        Center(
                          child: Text(
                            e.description,
                            style: GoogleFonts.poppins(
                                fontSize: 26, color: Colors.grey[700]),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                    height: isScreenSmall
                        ? screenSize.height * 0.07
                        : screenSize.height * 0.1),
              ],
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    isScreenSmall = MediaQuery.of(context).size.width < 640.0;
    screenSize = MediaQuery.of(context).size;
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
              child: Padding(
                padding: EdgeInsets.only(top: 8.0),
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
                                        decoration: TextDecoration.underline,
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
                                    ),
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
                                      } else if (val.compareTo("DashBoard") ==
                                          0)
                                        Navigator.pushNamed(
                                            context, '/dashboard');
                                    });
                                  },
                                  style: GoogleFonts.montserrat(
                                    color: Colors.orange,
                                  ),
                                  items: <String>['DashBoard', 'Sign Out']
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
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
                    leading: Icon(Icons.calendar_today, color: Colors.orange),
                    onTap: () {
                      Navigator.pushNamed(context, '/events');
                    },
                  ),
                  ListTile(
                    title: Text('Board'),
                    leading: Icon(Icons.people),
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
                  ? Image.asset('roarlikeone.png')
                  : Image.asset('roarlikeone.png'),
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
                        //child: Image.asset(
                            //themeChange.darkTheme
                               // ? 'celeberation_image.webp'
                               // : 'celeberation_image_orange.webp',
                           // fit: isScreenSmall ? BoxFit.fill : BoxFit.cover),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: isScreenSmall
                            ? screenSize.height * 0.01
                            : screenSize.height * 0.1,
                        horizontal:
                            isScreenSmall ? 16 : screenSize.width * 0.2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: getEventDetails(),
                        ),
                      ],
                    ),
                  ),
                  Footer()
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
