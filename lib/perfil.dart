import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perfil_page/config.dart';

import 'package:perfil_page/model/user.dart';
import 'package:provider/provider.dart';

class Perfil extends StatefulWidget {
  final User user;
  Perfil({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  ThemeChanger? themeChanger;

  @override
  Widget build(BuildContext context) {
    themeChanger = Provider.of<ThemeChanger>(context, listen: false);

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: size.height * .45,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(widget.user.photo),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(23.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.orange[300],
                              child: IconButton(
                                padding: EdgeInsets.only(left: 8),
                                onPressed: () => Navigator.pop(context),
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: themeChanger?.isDark()
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: size.height * .45,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: themeChanger?.isDark()
                        ? Colors.grey[800]
                        : Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22),
                      topRight: Radius.circular(22),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.user.name,
                          style:
                              Theme.of(context).textTheme.headline6?.copyWith(
                                    fontSize: 26,
                                  ),
                        ),
                        Text(
                          widget.user.lenguage,
                          style: GoogleFonts.nunitoSans(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),
                        Text(
                          widget.user.description,
                          style:
                              Theme.of(context).textTheme.headline6?.copyWith(
                                    fontSize: 14,
                                    color: themeChanger?.isDark()
                                        ? Colors.white
                                        : Colors.grey[800],
                                  ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: size.width * 0.2,
                              decoration: BoxDecoration(
                                color: themeChanger?.isDark()
                                    ? Colors.grey[600]
                                    : Colors.grey[300],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  '\$${widget.user.value.toInt()}/h',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.copyWith(
                                        fontSize: 16,
                                        color: themeChanger?.isDark()
                                            ? Colors.white
                                            : Colors.grey[800],
                                      ),
                                ),
                              ),
                            ),
                            Container(
                              width: size.width * 0.2,
                              decoration: BoxDecoration(
                                color: themeChanger?.isDark()
                                    ? Colors.grey[600]
                                    : Colors.grey[300],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                    ),
                                    Text(
                                      widget.user.ranking.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          ?.copyWith(
                                            fontSize: 16,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: size.width * 0.2,
                              height: size.height * 0.06,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: themeChanger?.isDark()
                                      ? Colors.white
                                      : Colors.grey[800],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () {
                                  setState(
                                    () {
                                      widget.user.liked = !widget.user.liked;
                                    },
                                  );
                                },
                                child: Icon(
                                  widget.user.liked
                                      ? Icons.favorite
                                      : Icons.favorite_outline,
                                  color: Colors.orange,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.005),
                        Container(
                          width: size.width,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.orange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              textStyle: const TextStyle(
                                fontSize: 17,
                              ),
                            ),
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Get lesson!',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    ?.copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
