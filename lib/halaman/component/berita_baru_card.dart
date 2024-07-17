import 'package:flutter/material.dart';

Widget beritaBaruCard(
  context,
  String gambarBerita,
  String judul,
  String penulis,
  onTap,
) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(15.0),
    child: Ink(
      child: SizedBox(
        width: double.infinity,
        height: 80.0,
        child: Row(
          children: [
            Container(
              height: 80.0,
              width: 80.0,
              decoration: BoxDecoration(
                color: Color(0xFFBDBDBD),
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  gambarBerita,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      judul,
                      style: TextStyle(
                        color: Color(0xFF1A434E),
                        fontFamily: "Mulish",
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2, // Set the maximum number of lines to 2
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "By",
                        style: TextStyle(
                          color: Color(0xFF95A6AA),
                          fontFamily: "Mulish",
                          fontSize: 12.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        penulis,
                        style: TextStyle(
                          color: Color(0xFF1A434E),
                          fontFamily: "Mulish",
                          fontSize: 12.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
