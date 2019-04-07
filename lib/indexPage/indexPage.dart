import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shop/JsonModel/bannerData.dart';

class IndexPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new IndexPageWidget();
  }
}

class IndexPageWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new IndexPageState();
  }
}

class IndexPageState extends State<IndexPageWidget>{

  List<Widget> bannerPicData = List();
  List<String> bannerPicUrlList = List();
  List<BannerData> bannerDataList = List();

  @override
  void initState() {
    print("initState");
    getData();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print("void didChangeDependencies() { }");
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        body:  new Swiper(
          pagination: SwiperPagination(
              alignment: Alignment.bottomCenter,
//              margin: const EdgeInsets.fromLTRB(0, 0, 20, 10),
              builder: DotSwiperPaginationBuilder(
                  color: Colors.black54,
                  activeColor: Colors.white
              )
          ),
          controller: SwiperController(),
          scrollDirection: Axis.horizontal,
          autoplay: true,
          onTap: (index) => print('点击了第$index'),
          itemBuilder: _swiperBuilder,
          itemCount: bannerDataList.length,
//          control: new SwiperControl(),
        ),
      ),
    );
  }
  Widget _swiperBuilder(BuildContext context, int index) {
    return new Image.network(
      "http://192.168.31.49/operate/showPic/" + (bannerDataList[index].pic_url).toString(),
      fit: BoxFit.fill,
    );
  }

  void getData() async {
    var dio = Dio();
    Response response = await dio.post("http://192.168.31.49/phone/mobile/index/getBannerData?method=index");
    List list = json.decode(response.data)["banner_list"];
    List<BannerData> bannerDatas = list.map((m) => new BannerData.fromJson(m)).toList();
    setState(() {
      bannerDataList = bannerDatas;
    });
  }
}