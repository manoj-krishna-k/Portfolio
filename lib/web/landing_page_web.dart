import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manoj_krishna/components.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPageWeb extends StatefulWidget {
  const LandingPageWeb({super.key});

  @override
  State<LandingPageWeb> createState() => _LandingPageWebState();
}

class _LandingPageWebState extends State<LandingPageWeb> {
  bool aboutSelected = false;
  bool contactPage = false;
  final GlobalKey targetKeyHome = GlobalKey();
  final GlobalKey targetKeyAbout = GlobalKey();
  final GlobalKey targetKeySkills = GlobalKey();
  final GlobalKey targetKeyContact = GlobalKey();
  urlLauncher(imagepath, link) {
    return IconButton(
      icon: SvgPicture.asset(imagepath, width: 35.0, color: Colors.white),
      onPressed: () async {
        await launchUrl(Uri.parse(link));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return SelectionArea(
      child: Scaffold(
        backgroundColor: Colors.white,

        drawer: Drawer(
          backgroundColor: Color(0xff001a33),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.purpleAccent,
                radius: 72,
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage("assets/profile.jpeg"),
                ),
              ),
              SizedBox(height: 15.0),
              SansBold("Manoj Krishna K", 30),
              SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  urlLauncher(
                    "assets/instagram.svg",
                    "https://www.instagram.com/manjo_.6/",
                  ),
                  urlLauncher(
                    "assets/linkedin.svg",
                    "https://www.linkedin.com/in/manoj-krishna-852563366/",
                  ),
                ],
              ),
            ],
          ),
        ),

        appBar: AppBar(
          shadowColor: Colors.black,
          toolbarHeight: 70,
          iconTheme: IconThemeData(color: Color(0xFFE6E6E6)),

          backgroundColor: Color(0xFF001a33),
          elevation: 1.0,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Spacer(flex: 5),
              MaterialButton(
                height: 100,

                onPressed: () {
                  Scrollable.ensureVisible(
                    targetKeyHome.currentContext!,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                child: TabsWeb("Home"),
              ),
              Spacer(),
              MaterialButton(
                height: 100,

                onPressed: () {
                  Scrollable.ensureVisible(
                    targetKeyAbout.currentContext!,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                child: TabsWeb("About"),
              ),
              Spacer(),
              MaterialButton(
                height: 100,

                onPressed: () {
                  Scrollable.ensureVisible(
                    targetKeySkills.currentContext!,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                child: TabsWeb("Skills"),
              ),
              Spacer(),
              MaterialButton(
                height: 100,

                onPressed: () {
                  Scrollable.ensureVisible(
                    targetKeyContact.currentContext!,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                child: TabsWeb("Contact"),
              ),
              Spacer(),
            ],
          ),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            //First Section
            Container(
              key: targetKeyHome,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/blackBackground.png"),
                  fit: BoxFit.cover,
                ),
              ),
              height: heightDevice - 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          left: 20,
                          top: 10,
                          right: 20,
                          bottom: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.purpleAccent,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: SansBoldAni("Hello I'm", 14, Colors.white),
                      ),
                      SizedBox(height: 15.0),
                      SansBold("Manoj Krishna K", 55),
                      SizedBox(height: 5),
                      Sans("CSE student", 30),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.email, color: Colors.white),
                          Sans(" manojprof6@gmail.com", 14),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.call, color: Colors.white),
                          Sans(" +91 9344391890", 14),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.location_pin, color: Colors.white),
                          Sans(" Paramakudi, Ramnad", 14),
                        ],
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 187.0,
                    backgroundColor: Color(0xFFED9DF4),

                    child: CircleAvatar(
                      radius: 184.0,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/profile.jpeg"),
                        radius: 180.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //Second Section
            Container(
              key: targetKeyAbout,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/blackBackground.png"),
                  fit: BoxFit.cover,
                ),
              ),
              height: heightDevice / 1.4,
              child: Column(
                children: [
                  MouseRegion(
                    onEnter: (_) {
                      setState(() {
                        setState(() {
                          aboutSelected = true;
                        });
                      });
                    },
                    onExit: (_) {
                      setState(() {
                        aboutSelected = false;
                      });
                    },

                    child: SizedBox(
                      width: widthDevice / 1.1,
                      height: heightDevice / 1.7,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 150),
                        decoration: BoxDecoration(
                          color: aboutSelected
                              ? Colors.purpleAccent
                              : Colors.transparent,
                          border: Border.all(
                            color: aboutSelected
                                ? Colors.purpleAccent
                                : Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: Offset(4, 4),
                              color: aboutSelected
                                  ? Colors.purpleAccent
                                  : Colors.transparent,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,

                                border: Border.all(color: Colors.black),

                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Image.asset(
                                  "assets/about.png",
                                  height: aboutSelected ? 330 : 300,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SansBold("About Me", aboutSelected ? 40 : 30),
                                SizedBox(height: 10),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Sans(
                                      "I am a second-year Computer Science and Engineering "
                                      " undergraduate with a CGPA of 8.61, having "
                                      "\ncompleted three semesters. I have a strong "
                                      "foundation in computer science and hands-on experience\n"
                                      "in web development, with Full Stack Development as my "
                                      "career focus. I am currently learning Flutter through a \n"
                                      "Udemy course to build cross-platform applications and am "
                                      "passionate about learning new technologies, building \n"
                                      "practical projects, and creating impactful software solutions.",
                                      aboutSelected ? 15 : 14,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //Third Section
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/blackBackground.png"),
                  fit: BoxFit.cover,
                ),
              ),
              height: heightDevice / 1.1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SansBold("What I do", 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [
                      CardAni(
                        imagePath: "assets/webL.png",
                        text: "Web Development",
                        fit: BoxFit.contain,
                        reverse: true,
                      ),
                      CardAni(
                        imagePath: "assets/appdev.png",
                        text: "App Development",
                        fit: BoxFit.contain,
                        reverse: false,
                      ),
                      CardAni(
                        imagePath: "assets/backend.jpg",
                        text: "Back-end Development",
                        fit: BoxFit.contain,
                        reverse: true,
                      ),
                    ],
                  ),
                  SizedBox(height: 100),
                ],
              ),
            ),

            //threee.five - Skills
            Container(
              key: targetKeySkills,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/blackBackground.png"),
                  fit: BoxFit.cover,
                ),
              ),
              width: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 200),
                  SansBold("What I Know", 40),
                  SizedBox(height: 100),

                  //start
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      SkillCards(
                        "assets/java.png",
                        "JAVA",
                        "Strong understanding of OOP concepts, collections, and exception handling.\nDeveloped efficient logic and problem-solving solutions using Java",
                      ),
                      SizedBox(width: 100),

                      SkillCards(
                        "assets/C_logo.png",
                        "C",
                        "Solid foundation in procedural programming and memory management.\nImplemented algorithms and data structures using C.",
                      ),
                    ],
                  ),
                  SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      SkillCards(
                        "assets/c++_logo.png",
                        "C++",
                        "Experience with object-oriented programming and STL.\nApplied C++ for performance-oriented and structured programs.",
                      ),
                      SizedBox(width: 100),
                      SkillCards(
                        "assets/flutter.png",
                        "FLUTTER",
                        "Built cross-platform mobile applications with responsive UI and smooth navigation.\nImplemented state management, API integration, and custom widgets.",
                      ),
                    ],
                  ),
                  SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      SkillCards(
                        "assets/python.png",
                        "PYTHON",
                        "Wrote clean and efficient scripts for problem solving and automation.\nFamiliar with core concepts, libraries, and data handling.",
                      ),
                      SizedBox(width: 100),
                      SkillCards(
                        "assets/html.png",
                        "HTML",
                        "Created semantic, accessible, and well-structured web pages.\nEnsured clean markup for responsive and SEO-friendly layouts.",
                      ),
                    ],
                  ),
                  SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      SkillCards(
                        "assets/css.jpg",
                        "CSS",
                        "Designed responsive layouts using Flexbox and Grid.\nApplied modern styling, animations, and consistent UI themes.",
                      ),
                      SizedBox(width: 100),
                      SkillCards(
                        "assets/javascript.png",
                        "JAVASCRIPT",
                        "Implemented dynamic and interactive web functionalities.\nWorked with DOM manipulation and basic asynchronous operations.",
                      ),
                    ],
                  ),
                  SizedBox(height: 100),
                ],
              ),
            ),
            //fourth section - contact me
            AnimatedContainer(
              key: targetKeyContact,
              duration: const Duration(milliseconds: 200),
              height: heightDevice,
              decoration: BoxDecoration(color: Color(0xff0f1329)),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SansBoldAni("Contact Me", 40, Colors.white),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [
                      SizedBox(width: 200),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextForm(
                            heading: "First Name:",
                            width: 350,
                            hint: "Enter your First Name",
                          ),
                          SizedBox(height: 15),
                          TextForm(
                            heading: "Email:",
                            width: 350,
                            hint: "Enter your Email",
                          ),
                        ],
                      ),

                      Column(
                        children: [
                          TextForm(
                            heading: "Last Name:",
                            width: 350,
                            hint: "Enter your Last Name",
                          ),
                          SizedBox(height: 15),
                          TextForm(
                            heading: "Phone Number:",
                            width: 350,
                            hint: "Enter your Phone Number",
                          ),
                        ],
                      ),
                      SizedBox(width: 200),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextForm(
                        heading: "Message",
                        width: 800,
                        hint: "Enter your message",
                        maxlines: 10,
                      ),
                    ],
                  ),
                  ButtonAnimation(
                    displaytext: "your response has been submitted",
                    text: "Submit",
                  ),
                ],
              ),
            ),

            //fifth section
          ],
        ),
      ),
    );
  }
}

// 0xFFED9DF4

//
// Text(
// "Hello I'm",
// style: GoogleFonts.openSans(
// fontSize: 14,
// fontWeight: FontWeight.bold,
// ),
// ),
