// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movies_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MoviesModel {

 int get total; int get page; int get pages;@JsonKey(name: 'tv_shows') List<TvShows> get tvShow;
/// Create a copy of MoviesModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MoviesModelCopyWith<MoviesModel> get copyWith => _$MoviesModelCopyWithImpl<MoviesModel>(this as MoviesModel, _$identity);

  /// Serializes this MoviesModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoviesModel&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.pages, pages) || other.pages == pages)&&const DeepCollectionEquality().equals(other.tvShow, tvShow));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,page,pages,const DeepCollectionEquality().hash(tvShow));

@override
String toString() {
  return 'MoviesModel(total: $total, page: $page, pages: $pages, tvShow: $tvShow)';
}


}

/// @nodoc
abstract mixin class $MoviesModelCopyWith<$Res>  {
  factory $MoviesModelCopyWith(MoviesModel value, $Res Function(MoviesModel) _then) = _$MoviesModelCopyWithImpl;
@useResult
$Res call({
 int total, int page, int pages,@JsonKey(name: 'tv_shows') List<TvShows> tvShow
});




}
/// @nodoc
class _$MoviesModelCopyWithImpl<$Res>
    implements $MoviesModelCopyWith<$Res> {
  _$MoviesModelCopyWithImpl(this._self, this._then);

  final MoviesModel _self;
  final $Res Function(MoviesModel) _then;

/// Create a copy of MoviesModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? page = null,Object? pages = null,Object? tvShow = null,}) {
  return _then(_self.copyWith(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as int,tvShow: null == tvShow ? _self.tvShow : tvShow // ignore: cast_nullable_to_non_nullable
as List<TvShows>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _MoviesModel implements MoviesModel {
   _MoviesModel({this.total = 0, this.page = 0, this.pages = 0, @JsonKey(name: 'tv_shows') final  List<TvShows> tvShow = const []}): _tvShow = tvShow;
  factory _MoviesModel.fromJson(Map<String, dynamic> json) => _$MoviesModelFromJson(json);

@override@JsonKey() final  int total;
@override@JsonKey() final  int page;
@override@JsonKey() final  int pages;
 final  List<TvShows> _tvShow;
@override@JsonKey(name: 'tv_shows') List<TvShows> get tvShow {
  if (_tvShow is EqualUnmodifiableListView) return _tvShow;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tvShow);
}


/// Create a copy of MoviesModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MoviesModelCopyWith<_MoviesModel> get copyWith => __$MoviesModelCopyWithImpl<_MoviesModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MoviesModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MoviesModel&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.pages, pages) || other.pages == pages)&&const DeepCollectionEquality().equals(other._tvShow, _tvShow));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,page,pages,const DeepCollectionEquality().hash(_tvShow));

@override
String toString() {
  return 'MoviesModel(total: $total, page: $page, pages: $pages, tvShow: $tvShow)';
}


}

/// @nodoc
abstract mixin class _$MoviesModelCopyWith<$Res> implements $MoviesModelCopyWith<$Res> {
  factory _$MoviesModelCopyWith(_MoviesModel value, $Res Function(_MoviesModel) _then) = __$MoviesModelCopyWithImpl;
@override @useResult
$Res call({
 int total, int page, int pages,@JsonKey(name: 'tv_shows') List<TvShows> tvShow
});




}
/// @nodoc
class __$MoviesModelCopyWithImpl<$Res>
    implements _$MoviesModelCopyWith<$Res> {
  __$MoviesModelCopyWithImpl(this._self, this._then);

  final _MoviesModel _self;
  final $Res Function(_MoviesModel) _then;

/// Create a copy of MoviesModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? page = null,Object? pages = null,Object? tvShow = null,}) {
  return _then(_MoviesModel(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as int,tvShow: null == tvShow ? _self._tvShow : tvShow // ignore: cast_nullable_to_non_nullable
as List<TvShows>,
  ));
}


}


/// @nodoc
mixin _$TvShows {

@JsonKey(name: 'name') String get name; String get permalink; String get status;@JsonKey(name: 'end_date') String get endDate;@JsonKey(name: 'start_date') String get startDate; String get network;@JsonKey(name: 'image_thumbnail_path') String get imageThumbnailPath;
/// Create a copy of TvShows
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TvShowsCopyWith<TvShows> get copyWith => _$TvShowsCopyWithImpl<TvShows>(this as TvShows, _$identity);

  /// Serializes this TvShows to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TvShows&&(identical(other.name, name) || other.name == name)&&(identical(other.permalink, permalink) || other.permalink == permalink)&&(identical(other.status, status) || other.status == status)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.network, network) || other.network == network)&&(identical(other.imageThumbnailPath, imageThumbnailPath) || other.imageThumbnailPath == imageThumbnailPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,permalink,status,endDate,startDate,network,imageThumbnailPath);

@override
String toString() {
  return 'TvShows(name: $name, permalink: $permalink, status: $status, endDate: $endDate, startDate: $startDate, network: $network, imageThumbnailPath: $imageThumbnailPath)';
}


}

/// @nodoc
abstract mixin class $TvShowsCopyWith<$Res>  {
  factory $TvShowsCopyWith(TvShows value, $Res Function(TvShows) _then) = _$TvShowsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'name') String name, String permalink, String status,@JsonKey(name: 'end_date') String endDate,@JsonKey(name: 'start_date') String startDate, String network,@JsonKey(name: 'image_thumbnail_path') String imageThumbnailPath
});




}
/// @nodoc
class _$TvShowsCopyWithImpl<$Res>
    implements $TvShowsCopyWith<$Res> {
  _$TvShowsCopyWithImpl(this._self, this._then);

  final TvShows _self;
  final $Res Function(TvShows) _then;

/// Create a copy of TvShows
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? permalink = null,Object? status = null,Object? endDate = null,Object? startDate = null,Object? network = null,Object? imageThumbnailPath = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,permalink: null == permalink ? _self.permalink : permalink // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,network: null == network ? _self.network : network // ignore: cast_nullable_to_non_nullable
as String,imageThumbnailPath: null == imageThumbnailPath ? _self.imageThumbnailPath : imageThumbnailPath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _TvShows implements TvShows {
   _TvShows({@JsonKey(name: 'name') this.name = '', this.permalink = '', this.status = '', @JsonKey(name: 'end_date') this.endDate = '', @JsonKey(name: 'start_date') this.startDate = '', this.network = '', @JsonKey(name: 'image_thumbnail_path') this.imageThumbnailPath = ''});
  factory _TvShows.fromJson(Map<String, dynamic> json) => _$TvShowsFromJson(json);

@override@JsonKey(name: 'name') final  String name;
@override@JsonKey() final  String permalink;
@override@JsonKey() final  String status;
@override@JsonKey(name: 'end_date') final  String endDate;
@override@JsonKey(name: 'start_date') final  String startDate;
@override@JsonKey() final  String network;
@override@JsonKey(name: 'image_thumbnail_path') final  String imageThumbnailPath;

/// Create a copy of TvShows
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TvShowsCopyWith<_TvShows> get copyWith => __$TvShowsCopyWithImpl<_TvShows>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TvShowsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TvShows&&(identical(other.name, name) || other.name == name)&&(identical(other.permalink, permalink) || other.permalink == permalink)&&(identical(other.status, status) || other.status == status)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.network, network) || other.network == network)&&(identical(other.imageThumbnailPath, imageThumbnailPath) || other.imageThumbnailPath == imageThumbnailPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,permalink,status,endDate,startDate,network,imageThumbnailPath);

@override
String toString() {
  return 'TvShows(name: $name, permalink: $permalink, status: $status, endDate: $endDate, startDate: $startDate, network: $network, imageThumbnailPath: $imageThumbnailPath)';
}


}

/// @nodoc
abstract mixin class _$TvShowsCopyWith<$Res> implements $TvShowsCopyWith<$Res> {
  factory _$TvShowsCopyWith(_TvShows value, $Res Function(_TvShows) _then) = __$TvShowsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'name') String name, String permalink, String status,@JsonKey(name: 'end_date') String endDate,@JsonKey(name: 'start_date') String startDate, String network,@JsonKey(name: 'image_thumbnail_path') String imageThumbnailPath
});




}
/// @nodoc
class __$TvShowsCopyWithImpl<$Res>
    implements _$TvShowsCopyWith<$Res> {
  __$TvShowsCopyWithImpl(this._self, this._then);

  final _TvShows _self;
  final $Res Function(_TvShows) _then;

/// Create a copy of TvShows
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? permalink = null,Object? status = null,Object? endDate = null,Object? startDate = null,Object? network = null,Object? imageThumbnailPath = null,}) {
  return _then(_TvShows(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,permalink: null == permalink ? _self.permalink : permalink // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,network: null == network ? _self.network : network // ignore: cast_nullable_to_non_nullable
as String,imageThumbnailPath: null == imageThumbnailPath ? _self.imageThumbnailPath : imageThumbnailPath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
