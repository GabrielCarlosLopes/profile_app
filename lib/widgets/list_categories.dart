import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListCategories extends StatefulWidget {
  final Size size;
  const ListCategories({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  _ListCategoriesState createState() => _ListCategoriesState();
}

class _ListCategoriesState extends State<ListCategories> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: Container(
        height: widget.size.height * 0.06,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            button('Business', () {}, true),
            button('English', () {}, false),
            button('Health', () {}, false),
            button('Math', () {}, false),
          ],
        ),
      ),
    );
  }

  Container button(String name, VoidCallback fun, bool selected) {
    return Container(
      width: widget.size.width * 0.3,
      margin: EdgeInsets.only(left: 32.0, right: 5.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: selected ? Colors.orange : Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17.0),
          ),
          textStyle: const TextStyle(
            fontSize: 14,
          ),
        ),
        onPressed: fun,
        child: Text(
          name,
          style: GoogleFonts.nunitoSans(
            textStyle: TextStyle(
              color: selected ? Colors.white : Colors.grey[700],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
