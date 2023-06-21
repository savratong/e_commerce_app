import 'package:flutter/material.dart';

class ItemColorCard extends StatelessWidget {
  const ItemColorCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        children: [
          SizedBox(
            height: 80,
            width: 70,
            child: Image.network(
              "https://st.mngbcn.com/rcs/pics/static/T4/fotos/outfit/S20/47094393_40-99999999_01.jpg?ts=1673336292325&imwidth=544&imdensity=2",
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 70,
            child: Center(
              child: Text(
                "White",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
