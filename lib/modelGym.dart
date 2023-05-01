class Gym {
  String? pocName;
  String? pocMobile;
  String? userId;
  String? gymName;
  String? address1;
  String? address2;
  String? city;
  String? state;
  String? latitude;
  String? longitude;
  String? pin;
  String? country;
  String? name;
  String? distance;
  String? distanceText;
  String? durationText;
  String? duration;
  double? rating;
  String? text1;
  String? text2;
  String? planName;
  String? coverImage;
  String? type;
  String? description;
  String? status;
  String? slug;
  String? categoryId;
  int? totalRating;
  String? isPartial;
  int? isCash;
  String? categoryName;
  int? isDiscount;

  Gym(
      {this.pocName,
        this.pocMobile,
        this.userId,
        this.gymName,
        this.address1,
        this.address2,
        this.city,
        this.state,
        this.latitude,
        this.longitude,
        this.pin,
        this.country,
        this.name,
        this.distance,
        this.distanceText,
        this.durationText,
        this.duration,
        this.rating,
        this.text1,
        this.text2,
        this.planName,
        this.coverImage,
        this.type,
        this.description,
        this.status,
        this.slug,
        this.categoryId,
        this.totalRating,
        this.isPartial,
        this.isCash,
        this.categoryName,
        this.isDiscount});

  Gym.fromJson(Map<String, dynamic> json) {
    pocName = json['poc_name'];
    pocMobile = json['poc_mobile'];
    userId = json['user_id'];
    gymName = json['gym_name'];
    address1 = json['address1'];
    address2 = json['address2'];
    city = json['city'];
    state = json['state'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    pin = json['pin'];
    country = json['country'];
    name = json['name'];
    distance = json['distance'];
    distanceText = json['distance_text'];
    durationText = json['duration_text'];
    duration = json['duration'];
    rating = json['rating']*1.0;
    text1 = json['text1'];
    text2 = json['text2'];
    planName = json['plan_name'];
    coverImage = json['cover_image'];
    type = json['type'];
    description = json['description'];
    status = json['status'];
    slug = json['slug'];
    categoryId = json['category_id'];
    totalRating = json['total_rating'];
    isPartial = json['is_partial'];
    isCash = json['is_cash'];
    categoryName = json['category_name'];
    isDiscount = json['is_discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['poc_name'] = this.pocName;
    data['poc_mobile'] = this.pocMobile;
    data['user_id'] = this.userId;
    data['gym_name'] = this.gymName;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['city'] = this.city;
    data['state'] = this.state;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['pin'] = this.pin;
    data['country'] = this.country;
    data['name'] = this.name;
    data['distance'] = this.distance;
    data['distance_text'] = this.distanceText;
    data['duration_text'] = this.durationText;
    data['duration'] = this.duration;
    data['rating'] = this.rating;
    data['text1'] = this.text1;
    data['text2'] = this.text2;
    data['plan_name'] = this.planName;
    data['cover_image'] = this.coverImage;
    data['type'] = this.type;
    data['description'] = this.description;
    data['status'] = this.status;
    data['slug'] = this.slug;
    data['category_id'] = this.categoryId;
    data['total_rating'] = this.totalRating;
    data['is_partial'] = this.isPartial;
    data['is_cash'] = this.isCash;
    data['category_name'] = this.categoryName;
    data['is_discount'] = this.isDiscount;
    return data;
  }
}
