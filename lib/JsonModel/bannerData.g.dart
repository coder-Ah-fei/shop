// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bannerData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerData _$BannerDataFromJson(Map<String, dynamic> json) {
  return BannerData(json['link'] as String, json['title'] as String,
      json['page_url'] as String, json['pic_url'] as int);
}

Map<String, dynamic> _$BannerDataToJson(BannerData instance) =>
    <String, dynamic>{
      'link': instance.link,
      'title': instance.title,
      'page_url': instance.page_url,
      'pic_url': instance.pic_url
    };
