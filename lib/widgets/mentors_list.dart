import 'package:flutter/material.dart';
import 'package:perfil_page/constants.dart';

import 'package:perfil_page/model/user.dart';
import 'package:perfil_page/perfil.dart';

class MentorsList extends StatefulWidget {
  final Size size;
  const MentorsList({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  _MentorsListState createState() => _MentorsListState();
}

class _MentorsListState extends State<MentorsList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height * 0.3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: mentors.length,
        itemBuilder: (context, index) {
          final user = mentors[index];

          return perfilCard(user);
        },
      ),
    );
  }

  GestureDetector perfilCard(User user) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Perfil(
              user: user,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(left: 32),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          elevation: 8,
          child: Column(
            children: [
              Container(
                height: 150,
                width: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      user.photo,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: 140,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.name,
                          style:
                              Theme.of(context).textTheme.headline6?.copyWith(
                                    fontSize: 14,
                                  ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              user.lenguage,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 12,
                                  ),
                                  Text(
                                    user.ranking.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        ?.copyWith(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '\$${user.value.toInt()}/h',
                          style:
                              Theme.of(context).textTheme.headline6?.copyWith(
                                    fontSize: 12,
                                  ),
                        ),
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
