import 'package:chewie/chewie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:video_player/video_player.dart';

class Detaildash2 extends StatefulWidget {
  const Detaildash2({super.key, this.imagedocid});
  final imagedocid;

  @override
  State<Detaildash2> createState() => _Detaildash2State(imagedocid);
}

class _Detaildash2State extends State<Detaildash2> {
  //ChewieController? chewes;

  String? videonetwork;
  final imagedocid;
  _Detaildash2State(this.imagedocid);
  List<QueryDocumentSnapshot> myflatimagelist = [];
  getimagedata() async {
    final QuerySnapshot getflatimage = await FirebaseFirestore.instance
        .collection('Admin')
        .doc("Sales")
        .collection("Outgoing")
        .doc(imagedocid)
        .collection('imagelist')
        .get();
    myflatimagelist.addAll(getflatimage.docs);
  }

  getvideodata() async {
    await FirebaseFirestore.instance
        .collection('Admin')
        .doc("Sales")
        .collection("Outgoing")
        .doc(imagedocid)
        .get()
        .then((value) {
      videonetwork = value["video"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 600,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  offset: Offset(4.0, 4.0),
                  color: Colors.grey.shade200,
                  blurRadius: 10,
                  spreadRadius: 1)
            ]),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Text(
                    "Images",
                    style: GoogleFonts.mali(fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FutureBuilder(
                    future: getimagedata(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState != ConnectionState.done) {
                        return const CircularProgressIndicator(
                          color: Colors.blueAccent,
                          strokeWidth: 1,
                        );
                      } else {
                        return Container(
                          height: 200,
                          width: 500,
                          color: Color.fromARGB(0, 245, 245, 245),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: myflatimagelist.length,
                              itemBuilder: ((context, index) {
                                return Container(
                                  padding: EdgeInsets.all(10),
                                  child: InstaImageViewer(
                                    child: Container(
                                      width: 300,
                                      height: 100,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                myflatimagelist[index]
                                                    ['imageurl']),
                                            fit: BoxFit.fitWidth,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                    ),
                                  ),
                                );
                              })),
                        );
                      }
                    }),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                    "Video",
                    style: GoogleFonts.mali(fontSize: 18),
                  ),
                ),
                SizedBox(height: 10),
                FutureBuilder(
                    future: getvideodata(),
                    builder: ((context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Videoview(uri: videonetwork);
                      } else {
                        return const CircularProgressIndicator(
                          color: Colors.blueAccent,
                          strokeWidth: 1,
                        );
                      }
                    }))
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class Videoview extends StatefulWidget {
  const Videoview({super.key, this.uri});
  final uri;

  @override
  State<Videoview> createState() => _VideoviewState(uri);
}

class _VideoviewState extends State<Videoview> {
  final uri;
  _VideoviewState(this.uri);
  VideoPlayerController? videos;
  ChewieController? chewiess;
  @override
  void initState() {
    videos = VideoPlayerController.networkUrl(Uri.parse(uri));

    chewiess = ChewieController(
      aspectRatio: 16 / 9,
      videoPlayerController: videos!,
      autoInitialize: true,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return uri != ""
        ? AspectRatio(aspectRatio: 16 / 9, child: Chewie(controller: chewiess!))
        : Container(
            padding: EdgeInsets.symmetric(vertical: 12),
            width: double.infinity,
            height: 180,
            color: Color.fromARGB(207, 34, 38, 44),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              width: double.infinity,
              height: 100,
              color: Color.fromARGB(34, 233, 233, 233),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Icon(
                    Icons.info,
                    color: Colors.white,
                    size: 30,
                  ),
                  SizedBox(height: 5),
                  Text(
                    "No video provided for the given estate you may follow up with seller for more info.",
                    style: GoogleFonts.notoSansAdlam(
                        fontSize: 17,
                        color: Color.fromARGB(200, 255, 255, 255)),
                  ),
                ],
              ),
            ),
          );
  }
}
