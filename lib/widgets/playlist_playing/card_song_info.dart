import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class SongCardInfo extends StatelessWidget {
  const SongCardInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        //set border radius more than 50% of height and width to make circle
      ),
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 14, 24, 14),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 69,
                  height: 69,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/song_1_image.png"),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Song 1",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                        Text("Singer 1",
                            style: TextStyle(
                                color: Color(0xffB8BEC1),
                                fontSize: 12,
                                fontWeight: FontWeight.w600))
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.headphones_outlined,
                              size: 16,
                              color: Color(0xffB8BEC1),
                            ),
                            Text("24k",
                                style: TextStyle(color: Color(0xffB8BEC1))),
                          ],
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.favorite_border,
                              size: 16,
                              color: Color(0xffB8BEC1),
                            ),
                            Text("24k",
                                style: TextStyle(color: Color(0xffB8BEC1))),
                          ],
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
            Row(
              children: [
                Container(
                  width: 69,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        "Album",
                        style: TextStyle(color: Color(0xffB8BEC1)),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        "Musician",
                        style: TextStyle(color: Color(0xffB8BEC1)),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        "Genre",
                        style: TextStyle(color: Color(0xffB8BEC1)),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        "Publish",
                        style: TextStyle(color: Color(0xffB8BEC1)),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        "Produced",
                        style: TextStyle(color: Color(0xffB8BEC1)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      "Album",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      "Musician 1",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      "K POP",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      "00/00/0000",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      "Production house 1",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
