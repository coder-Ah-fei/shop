import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shop/JsonModel/bannerData.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  List<BannerData> bannerDataList = List();

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //假如设计稿是按Pixel2的尺寸设计的(Pixel2 1440*2880)
    ScreenUtil.instance = ScreenUtil(width: 1440, height: 2880)..init(context);
    return Container(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            //banner图
            Container(
              width: MediaQuery.of(context).size.width,
              height: 250.0,
              child: new Swiper(
                pagination: SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                        color: Colors.black54,
                        activeColor: Colors.white
                    )
                ),
                scrollDirection: Axis.horizontal,
                autoplay: true,
                onTap: (index) => print('点击了第$index'),
                itemBuilder: _swiperBuilder,
                itemCount: bannerDataList.length,
              ),
            ),

            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("adsafdsa"),
                    Container(
                      width: ScreenUtil.getInstance().setWidth(360),
                      decoration: new BoxDecoration(
                        border: new Border.all(width: 2.0, color: Colors.red),
                        color: Colors.grey,
                        borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
                        image: new DecorationImage(
                          image: new NetworkImage('http://h.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=0d023672312ac65c67506e77cec29e27/9f2f070828381f30dea167bbad014c086e06f06c.jpg'),
                          centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                        ),
                      ),
                      padding: const EdgeInsets.all(8.0),
                      alignment: Alignment.center,
                      child: new Text('Hello World',
                          style: Theme.of(context).textTheme.display1.copyWith(color: Colors.black)),
                      transform: new Matrix4.rotationZ(0.3),
                    ),
                    Container(
                      width: ScreenUtil.getInstance().setWidth(360),
                      decoration: new BoxDecoration(
                        border: new Border.all(width: 2.0, color: Colors.red),
                        color: Colors.grey,
                        borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
                        image: new DecorationImage(
                          image: new NetworkImage('http://h.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=0d023672312ac65c67506e77cec29e27/9f2f070828381f30dea167bbad014c086e06f06c.jpg'),
                          centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                        ),
                      ),
                      padding: const EdgeInsets.all(8.0),
                      alignment: Alignment.center,
                      child: new Text('Hello World',
                          style: Theme.of(context).textTheme.display1.copyWith(color: Colors.black)),
                      transform: new Matrix4.rotationZ(0.3),
                    ),
                  ],
                ),

                Container(
                  margin: const EdgeInsets.all(0),
                  color: Color.fromARGB(120, 120, 225, 0),
                  width: ScreenUtil.getInstance().setWidth(1080),
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      const Text('I\'m dedicating every day to you'),
                      const Text('Domestic life was never quite my style'),
                      const Text('When you smile, you knock me out, I fall apart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                    ],
                  ),
                ),
//                Container(
//                  child: Text("bbbb"),
//                ),
              ],
            ),

          ],
        )
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