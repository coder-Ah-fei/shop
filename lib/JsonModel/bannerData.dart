import 'package:json_annotation/json_annotation.dart';

// user.g.dart 将在我们运行生成命令后自动生成
part 'bannerData.g.dart';

///这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()

class BannerData{
  BannerData(this.link, this.title, this.page_url, this.pic_url);

  String link;
  String title;
  String page_url;
  int pic_url;
  //不同的类使用不同的mixin即可
  factory BannerData.fromJson(Map<String, dynamic> json) => _$BannerDataFromJson(json);
  Map<String, dynamic> toJson() => _$BannerDataToJson(this);
}