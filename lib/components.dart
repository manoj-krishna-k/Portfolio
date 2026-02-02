import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class TabsWeb extends StatefulWidget {
  final title;
  const TabsWeb(this.title, {super.key});

  @override
  State<TabsWeb> createState() => _TabsWebState();
}

class _TabsWebState extends State<TabsWeb> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          selected = true;
        });
      },
      onExit: (_) {
        setState(() {
          selected = false;
        });
      },
      child: AnimatedDefaultTextStyle(
        curve: Curves.easeIn,
        duration: Duration(milliseconds: 100),
        style: selected
            ? GoogleFonts.roboto(
                shadows: [
                  Shadow(color: Colors.tealAccent, offset: Offset(0, -5)),
                ],
                color: Colors.transparent,
                fontSize: 22.0,

                decoration: TextDecoration.underline,
                decorationThickness: 2,
                decorationColor: Color(0xFF000033),
              )
            : GoogleFonts.roboto(color: Colors.white, fontSize: 20.0),

        child: Text(widget.title),
      ),
    );
  }
}

class SansBold extends StatelessWidget {
  final text;
  final size;
  const SansBold(this.text, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}

class Sans extends StatelessWidget {
  final text;
  final size;

  const Sans(this.text, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(fontSize: size, color: Colors.white),
    );
  }
}

class SansBoldAni extends StatelessWidget {
  final text;
  final size;
  final color;
  const SansBoldAni(this.text, this.size, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}

class TextForm extends StatelessWidget {
  final heading;
  final width;
  final hint;
  final maxlines;
  const TextForm({
    Key? key,
    @required this.heading,
    @required this.width,
    @required this.hint,
    this.maxlines,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SansBoldAni(heading, 14, Colors.white),
        SizedBox(height: 5, width: 5),

        Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: SizedBox(
            width: width,
            child: TextFormField(
              style: const TextStyle(
                color: Colors.white, // color of typed text
                fontSize: 14,
              ),
              maxLines: maxlines == null ? 1 : maxlines,
              decoration: InputDecoration(
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightGreenAccent),
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  borderSide: BorderSide(color: Colors.teal),
                ),
                hintText: hint,
                hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              validator: (text) {
                if (RegExp(
                  "\\bManoj krishna k\\b",
                  caseSensitive: false,
                ).hasMatch(text.toString())) {
                  return "Match Found";
                }
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
          ),
        ),
      ],
    );
  }
}

class CardAni extends StatefulWidget {
  final imagePath;
  final text;
  final fit;
  final reverse;

  const CardAni({super.key, this.imagePath, this.text, this.fit, this.reverse});

  @override
  State<CardAni> createState() => _CardAniState();
}

class _CardAniState extends State<CardAni> with SingleTickerProviderStateMixin {
  late AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 4),
  )..repeat();

  late Animation<Offset> _animation = Tween(
    begin: widget.reverse == true ? Offset(0, 0.08) : Offset(0.0, 0),
    end: widget.reverse == true ? Offset(0, 0) : Offset(0, 0.08),
  ).animate(_controller);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,

      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            isSelected = true;
          });
        },
        onExit: (_) {
          setState(() {
            isSelected = false;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeIn,

          decoration: BoxDecoration(
            color: isSelected ? Colors.purpleAccent : Color(0xFF001a33),
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: Colors.purpleAccent),

            boxShadow: [
              BoxShadow(
                color: Colors.purpleAccent,
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(4, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: AnimatedContainer(
              curve: Curves.easeIn,
              duration: const Duration(seconds: 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedContainer(
                    duration: const Duration(seconds: 3),
                    child: Image.asset(
                      widget.imagePath,
                      height: 400,
                      fit: widget.fit == null ? null : widget.fit,
                    ),
                  ),
                  SizedBox(height: 10),
                  SansBoldAni(widget.text, 14, Colors.white),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonAnimation extends StatefulWidget {
  final text;
  final displaytext;
  const ButtonAnimation({super.key, this.text, this.displaytext});

  @override
  State<ButtonAnimation> createState() => _ButtonAnimationState();
}

class _ButtonAnimationState extends State<ButtonAnimation> {
  late bool submitted = false;
  late String displaytext = "";
  bool isHover = false;
  Color color = Colors.purpleAccent;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MouseRegion(
          onEnter: (_) {
            setState(() {
              color = Colors.tealAccent;
              isHover = true;
            });
          },
          onExit: (_) {
            setState(() {
              color = Colors.purpleAccent;
              isHover = false;
            });
          },
          child: AnimatedSize(
            duration: const Duration(milliseconds: 200),
            child: MaterialButton(
              onPressed: () {
                setState(() {
                  submitted = true;
                  displaytext = widget.displaytext;
                });
              },
              color: color,
              height: isHover ? 70 : 60,
              minWidth: isHover ? 180 : 170,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                widget.text,
                style: GoogleFonts.oswald(
                  fontSize: isHover ? 25 : 23,
                  color: isHover ? Colors.black : Colors.white,
                ),
              ),
            ),
          ),
        ),

        Text(
          displaytext,
          style: GoogleFonts.poppins(
            fontSize: 11,
            color: Colors.lightGreenAccent,
          ),
        ),
      ],
    );
  }
}

class SkillCards extends StatefulWidget {
  final String imagepath;
  final String title;
  final String paragraph;
  final int? imageHeight;

  SkillCards(
    this.imagepath,
    this.title,
    this.paragraph, {
    this.imageHeight,
    super.key,
  });

  @override
  State<SkillCards> createState() => _SkillCardsState();
}

class _SkillCardsState extends State<SkillCards> with TickerProviderStateMixin {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) async {
        setState(() {
          isSelected = true;
        });
      },
      onExit: (_) {
        setState(() {
          isSelected = false;
        });
      },

      child: AnimatedContainer(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: isSelected ? Colors.purpleAccent : Colors.white,
          border: Border.all(color: Colors.purpleAccent),
          borderRadius: BorderRadius.all(Radius.circular(40)),
          boxShadow: [
            BoxShadow(
              color: Colors.purpleAccent,
              blurRadius: 10,
              spreadRadius: 0,
              offset: Offset(4, 4),
            ),
          ],
        ),
        child: AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: isSelected
                ? Container(
                    width: 770,
                    height: 105,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(widget.imagepath, height: 80),
                          ),
                        ),
                        SizedBox(width: 50),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title,
                              style: GoogleFonts.openSans(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: isSelected ? Colors.white : Colors.black,
                              ),
                            ),
                            Text(
                              widget.paragraph,
                              style: GoogleFonts.openSans(
                                fontSize: 14,

                                color: isSelected ? Colors.white : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : Container(
                    width: 150,
                    height: 50,
                    child: Center(
                      child: Text(
                        widget.title,
                        style: GoogleFonts.openSans(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

// width: 750,
// height: 125,
