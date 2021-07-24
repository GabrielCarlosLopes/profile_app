import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBar extends StatelessWidget {
  final Size size;
  const SearchBar({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0, right: 32.0),
      child: Container(
        alignment: Alignment.center,
        height: size.height * 0.08,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(14),
        ),
        child: Form(
          child: TextFormField(
            autocorrect: false,
            decoration: InputDecoration(
              hintStyle: GoogleFonts.nunitoSans(
                textStyle: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
              hintText: 'Search for a mentor',
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey[800],
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
