import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:video_player/video_player.dart';
import 'colors.dart' as color;

class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key}) : super(key: key);

  @override
  _VideoInfoState createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {

  List videoinfo = [];
  bool _playArea = false;
  bool _isPlaying = false;
  bool _disposed = false;
  int _isPlayingIndex = -1;
  VideoPlayerController? _controller;

  _initData() async { await DefaultAssetBundle.of(context)
        .loadString("json/videoinfo.json")
        .then((value) {
          setState(() {
            videoinfo = json.decode(value);
          });
        });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _disposed =true;
    _controller?.pause();
    _controller?.dispose();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: _playArea==false? BoxDecoration(
            gradient: LinearGradient(colors: [
          color.AppColor.gradientFirst,
          color.AppColor.gradientSecond,
        ], begin: const FractionalOffset(0.0, 0.4), end: Alignment.topRight)):BoxDecoration(
          color: color.AppColor.gradientSecond
        ),
        child: Column(
          children: [
            _playArea==false?Container(
              padding: EdgeInsets.only(top: 70, left: 30, right: 30),
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bài luyện tập tại nhà",
                    style: TextStyle(
                        fontSize: 25,
                        color: color.AppColor.secondPageTitleColor),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "",
                    style: TextStyle(
                        fontSize: 25,
                        color: color.AppColor.secondPageTitleColor),
                  ),
                ],
              ),
            ):Container(
            child: Column(
              children: [
                Container(

                  padding: const EdgeInsets.only(top: 25, left: 30, right: 30),
                ),
                _playView(context),
                _controllView(context),
              ],
            ),
          ),
            Expanded(child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(70))),
              child: Column(
                children: [
                  SizedBox(
                    height: 28,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 28,
                      ),
                      Text(
                        "Bài luyện tập",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: color.AppColor.circuitsColor,
                        ),
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Expanded(child: _listView())
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
   _controllView(BuildContext context){
    final noMute = (_controller?.value?.volume??0)>0;
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      color: color.AppColor.gradientSecond,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0.0, 0.0),
                      blurRadius: 4.0,
                      color: Color.fromARGB(50, 0, 0, 0)
                    )
                  ]
                ),
                child: Icon(
                  noMute? Icons.volume_up:
                  Icons.volume_off,
                  color: Colors.white,
                ),
              ),
            ),
            onTap: (){
              if(noMute){
                _controller!.setVolume(0);
              }
              else{
                _controller!.setVolume(1.0);
              }
              setState(() {

              });
            },
          ),
          FlatButton(
              onPressed: () async {
                final index = _isPlayingIndex-1;
                if(index >=0 && videoinfo.length >=0){
                  _initalizeVideo(index);
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Không còn video trên danh sách'),
                    ),
                  );
                }
              },
              child: Icon(Icons.fast_rewind,
              size: 36,
              color: Colors.white,)
          ),
          FlatButton(
              onPressed: () async {
                if(_isPlaying){
                  setState(() {
                    _isPlaying=false;
                  });
                  _controller!.pause();
                }else {
                  setState(() {
                    _isPlaying=true;
                  });
                  _controller!.play();
                }
              },
              child: Icon( _isPlaying? Icons.pause : Icons.play_arrow,
                size: 36,
                color: Colors.white,)
          ),
          FlatButton(
              onPressed: () async {
                final index = _isPlayingIndex+1;
                if(index <= videoinfo.length-1){
                  _initalizeVideo(index);
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Không còn video trên danh sách'),
                    ),
                  );
                }
              },
              child: Icon(Icons.fast_forward,
                size: 36,
                color: Colors.white,)
          )
        ],
      ),
    );
  }
   _playView(BuildContext context){
    final controller = _controller;
    if(controller!=null&&controller.value.isInitialized){
      return AspectRatio(
        aspectRatio: 3/2,
        child: VideoPlayer(controller),
      );
    }else{
      return AspectRatio(
          aspectRatio: 16/9,
          child: Center(child: Text("Loading....",
          style: TextStyle(
            fontSize: 20
          ),)));
    }
  }

  var _onUpdateControllerTime;
  void _onControllerUpdate() async{
    if(_disposed){
      return ;
    }
    _onUpdateControllerTime = 0;
    final now = DateTime.now().microsecondsSinceEpoch;
    if(_onUpdateControllerTime > now){

      return ;
    }
    _onUpdateControllerTime = now +500;
    final controller = _controller;
    if(controller==null){
      debugPrint("controller is null");
      return;
    }
    if(!controller.value.isInitialized){
      debugPrint("controller can not be init");
      return;
    }
    final playing = controller.value.isPlaying;
    _isPlaying=playing;
  }
  _initalizeVideo(int index) async {
    final controller = VideoPlayerController.network(videoinfo[index]["videoUrl"]);
    final old = _controller;
    _controller = controller;
    if (old!=null){
      old.removeListener(_onControllerUpdate);
      old.pause();
    }
    setState(() {
    });
    controller..initialize().then((_){
      old!.dispose();
      _isPlayingIndex = index;
      controller.addListener(_onControllerUpdate);
      controller.play();
      setState(() {
      });
    });
  }
  _ontapvideo(int index) async {
    _initalizeVideo(index);
  }
  _listView(){
    return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
        itemCount: videoinfo.length,
        itemBuilder: (_, int index) {
          return GestureDetector(
            onTap: (){
              _ontapvideo(index);
              debugPrint(index.toString());
              setState(() {
                if(_playArea==false){
                  _playArea=true;
                }
              });
            },
            child: _buildCard(index),
          );
        });
  }
  _buildCard(int index){
    return Container(
      height: 135,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(
                            videoinfo[index]["thumbnail"]
                        ),
                        fit: BoxFit.cover
                    )
                ),
              ),
              SizedBox(width: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    videoinfo[index]["title"],
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: EdgeInsets.only(top: 3),
                    child: Text(
                      videoinfo[index]["time"],
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 20,),
          Row(

            children: [
              Container(
                alignment: Alignment.center,
                width: 80,
                height: 20,
                decoration: BoxDecoration(
                    color: Color(0xffeaeefc),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Text(
                  "Bắt đầu",
                  style: TextStyle(
                      color: Color(0xff839fed)
                  ),
                ),
              ),
              Row(
                children: [
                  for (int i =0; i <70 ; i++)
                    i.isEven? Container(
                      height: 1,
                      width: 3,
                      decoration: BoxDecoration(
                          color: Color(0xff839fed),
                          borderRadius: BorderRadius.circular(2)
                      ),
                    ):Container(
                      height: 1,
                      width: 3,
                      color: Colors.white,
                    ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
