/// token : "477|m61BuVG5DuERKBgVVEv1MnQ1tZwZA8LTVM4I7rsN"
/// userData : {"name":"Test Account","avatar":null,"id":9,"avatar_url":"/storage/","role":"admin","contact_guid":null,"route":null,"email_signature":null,"phone":null,"email":"123@hjulfix.dk","offer_timeout":"1","dealerProductPrice":{"id":6,"dealer_id":"9","paint_10":null,"paint_20":null,"diamond_cut_10":null,"diamond_cut_20":null,"hard_damages":null,"color_match":null,"split_rim":null,"custom_product_markup":null,"created_at":"2024-10-13T11:30:05.000000Z","updated_at":"2024-10-13T11:30:05.000000Z"}}
/// permissions : {"role":"admin","abilities":["dashboard-view","planner-view","workers-view","workers-details","customers-view","dealers-view","admins-view","admins-details","admins-add","admins-edit","admins-delete","dealers-details","dealers-add","dealers-edit","sales-view","products-view","stages-view","stage-transaction-view","marketing-view","settings-view","sales-details","sales-lead-details","my-profile-view","password-view","my-account-view","pickup-requests-view","messages-view","customer-vehicles","shop-offer-create","shop-offer-view","rims-view"]}
library;

class AuthModel {
  AuthModel({String? token, UserData? userData, Permissions? permissions}) {
    _token = token;
    _userData = userData;
    _permissions = permissions;
  }

  AuthModel.fromJson(dynamic json) {
    _token = json['token'];
    _userData = json['userData'] != null
        ? UserData.fromJson(json['userData'])
        : null;
    _permissions = json['permissions'] != null
        ? Permissions.fromJson(json['permissions'])
        : null;
  }
  String? _token;
  UserData? _userData;
  Permissions? _permissions;
  AuthModel copyWith({
    String? token,
    UserData? userData,
    Permissions? permissions,
  }) => AuthModel(
    token: token ?? _token,
    userData: userData ?? _userData,
    permissions: permissions ?? _permissions,
  );
  String? get token => _token;
  UserData? get userData => _userData;
  Permissions? get permissions => _permissions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    if (_userData != null) {
      map['userData'] = _userData?.toJson();
    }
    if (_permissions != null) {
      map['permissions'] = _permissions?.toJson();
    }
    return map;
  }
}

/// role : "admin"
/// abilities : ["dashboard-view","planner-view","workers-view","workers-details","customers-view","dealers-view","admins-view","admins-details","admins-add","admins-edit","admins-delete","dealers-details","dealers-add","dealers-edit","sales-view","products-view","stages-view","stage-transaction-view","marketing-view","settings-view","sales-details","sales-lead-details","my-profile-view","password-view","my-account-view","pickup-requests-view","messages-view","customer-vehicles","shop-offer-create","shop-offer-view","rims-view"]

class Permissions {
  Permissions({String? role, List<String>? abilities}) {
    _role = role;
    _abilities = abilities;
  }

  Permissions.fromJson(dynamic json) {
    _role = json['role'];
    _abilities = json['abilities'] != null
        ? json['abilities'].cast<String>()
        : [];
  }
  String? _role;
  List<String>? _abilities;
  Permissions copyWith({String? role, List<String>? abilities}) =>
      Permissions(role: role ?? _role, abilities: abilities ?? _abilities);
  String? get role => _role;
  List<String>? get abilities => _abilities;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['role'] = _role;
    map['abilities'] = _abilities;
    return map;
  }
}

/// name : "Test Account"
/// avatar : null
/// id : 9
/// avatar_url : "/storage/"
/// role : "admin"
/// contact_guid : null
/// route : null
/// email_signature : null
/// phone : null
/// email : "123@hjulfix.dk"
/// offer_timeout : "1"
/// dealerProductPrice : {"id":6,"dealer_id":"9","paint_10":null,"paint_20":null,"diamond_cut_10":null,"diamond_cut_20":null,"hard_damages":null,"color_match":null,"split_rim":null,"custom_product_markup":null,"created_at":"2024-10-13T11:30:05.000000Z","updated_at":"2024-10-13T11:30:05.000000Z"}

class UserData {
  UserData({
    String? name,
    dynamic avatar,
    num? id,
    String? avatarUrl,
    String? role,
    dynamic contactGuid,
    dynamic route,
    dynamic emailSignature,
    dynamic phone,
    String? email,
    String? offerTimeout,
    DealerProductPrice? dealerProductPrice,
  }) {
    _name = name;
    _avatar = avatar;
    _id = id;
    _avatarUrl = avatarUrl;
    _role = role;
    _contactGuid = contactGuid;
    _route = route;
    _emailSignature = emailSignature;
    _phone = phone;
    _email = email;
    _offerTimeout = offerTimeout;
    _dealerProductPrice = dealerProductPrice;
  }

  UserData.fromJson(dynamic json) {
    _name = json['name'];
    _avatar = json['avatar'];
    _id = json['id'];
    _avatarUrl = json['avatar_url'];
    _role = json['role'];
    _contactGuid = json['contact_guid'];
    _route = json['route'];
    _emailSignature = json['email_signature'];
    _phone = json['phone'];
    _email = json['email'];
    _offerTimeout = json['offer_timeout'];
    _dealerProductPrice = json['dealerProductPrice'] != null
        ? DealerProductPrice.fromJson(json['dealerProductPrice'])
        : null;
  }
  String? _name;
  dynamic _avatar;
  num? _id;
  String? _avatarUrl;
  String? _role;
  dynamic _contactGuid;
  dynamic _route;
  dynamic _emailSignature;
  dynamic _phone;
  String? _email;
  String? _offerTimeout;
  DealerProductPrice? _dealerProductPrice;
  UserData copyWith({
    String? name,
    dynamic avatar,
    num? id,
    String? avatarUrl,
    String? role,
    dynamic contactGuid,
    dynamic route,
    dynamic emailSignature,
    dynamic phone,
    String? email,
    String? offerTimeout,
    DealerProductPrice? dealerProductPrice,
  }) => UserData(
    name: name ?? _name,
    avatar: avatar ?? _avatar,
    id: id ?? _id,
    avatarUrl: avatarUrl ?? _avatarUrl,
    role: role ?? _role,
    contactGuid: contactGuid ?? _contactGuid,
    route: route ?? _route,
    emailSignature: emailSignature ?? _emailSignature,
    phone: phone ?? _phone,
    email: email ?? _email,
    offerTimeout: offerTimeout ?? _offerTimeout,
    dealerProductPrice: dealerProductPrice ?? _dealerProductPrice,
  );
  String? get name => _name;
  dynamic get avatar => _avatar;
  num? get id => _id;
  String? get avatarUrl => _avatarUrl;
  String? get role => _role;
  dynamic get contactGuid => _contactGuid;
  dynamic get route => _route;
  dynamic get emailSignature => _emailSignature;
  dynamic get phone => _phone;
  String? get email => _email;
  String? get offerTimeout => _offerTimeout;
  DealerProductPrice? get dealerProductPrice => _dealerProductPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['avatar'] = _avatar;
    map['id'] = _id;
    map['avatar_url'] = _avatarUrl;
    map['role'] = _role;
    map['contact_guid'] = _contactGuid;
    map['route'] = _route;
    map['email_signature'] = _emailSignature;
    map['phone'] = _phone;
    map['email'] = _email;
    map['offer_timeout'] = _offerTimeout;
    if (_dealerProductPrice != null) {
      map['dealerProductPrice'] = _dealerProductPrice?.toJson();
    }
    return map;
  }
}

/// id : 6
/// dealer_id : "9"
/// paint_10 : null
/// paint_20 : null
/// diamond_cut_10 : null
/// diamond_cut_20 : null
/// hard_damages : null
/// color_match : null
/// split_rim : null
/// custom_product_markup : null
/// created_at : "2024-10-13T11:30:05.000000Z"
/// updated_at : "2024-10-13T11:30:05.000000Z"

class DealerProductPrice {
  DealerProductPrice({
    num? id,
    String? dealerId,
    dynamic paint10,
    dynamic paint20,
    dynamic diamondCut10,
    dynamic diamondCut20,
    dynamic hardDamages,
    dynamic colorMatch,
    dynamic splitRim,
    dynamic customProductMarkup,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _dealerId = dealerId;
    _paint10 = paint10;
    _paint20 = paint20;
    _diamondCut10 = diamondCut10;
    _diamondCut20 = diamondCut20;
    _hardDamages = hardDamages;
    _colorMatch = colorMatch;
    _splitRim = splitRim;
    _customProductMarkup = customProductMarkup;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  DealerProductPrice.fromJson(dynamic json) {
    _id = json['id'];
    _dealerId = json['dealer_id'];
    _paint10 = json['paint_10'];
    _paint20 = json['paint_20'];
    _diamondCut10 = json['diamond_cut_10'];
    _diamondCut20 = json['diamond_cut_20'];
    _hardDamages = json['hard_damages'];
    _colorMatch = json['color_match'];
    _splitRim = json['split_rim'];
    _customProductMarkup = json['custom_product_markup'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _dealerId;
  dynamic _paint10;
  dynamic _paint20;
  dynamic _diamondCut10;
  dynamic _diamondCut20;
  dynamic _hardDamages;
  dynamic _colorMatch;
  dynamic _splitRim;
  dynamic _customProductMarkup;
  String? _createdAt;
  String? _updatedAt;
  DealerProductPrice copyWith({
    num? id,
    String? dealerId,
    dynamic paint10,
    dynamic paint20,
    dynamic diamondCut10,
    dynamic diamondCut20,
    dynamic hardDamages,
    dynamic colorMatch,
    dynamic splitRim,
    dynamic customProductMarkup,
    String? createdAt,
    String? updatedAt,
  }) => DealerProductPrice(
    id: id ?? _id,
    dealerId: dealerId ?? _dealerId,
    paint10: paint10 ?? _paint10,
    paint20: paint20 ?? _paint20,
    diamondCut10: diamondCut10 ?? _diamondCut10,
    diamondCut20: diamondCut20 ?? _diamondCut20,
    hardDamages: hardDamages ?? _hardDamages,
    colorMatch: colorMatch ?? _colorMatch,
    splitRim: splitRim ?? _splitRim,
    customProductMarkup: customProductMarkup ?? _customProductMarkup,
    createdAt: createdAt ?? _createdAt,
    updatedAt: updatedAt ?? _updatedAt,
  );
  num? get id => _id;
  String? get dealerId => _dealerId;
  dynamic get paint10 => _paint10;
  dynamic get paint20 => _paint20;
  dynamic get diamondCut10 => _diamondCut10;
  dynamic get diamondCut20 => _diamondCut20;
  dynamic get hardDamages => _hardDamages;
  dynamic get colorMatch => _colorMatch;
  dynamic get splitRim => _splitRim;
  dynamic get customProductMarkup => _customProductMarkup;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['dealer_id'] = _dealerId;
    map['paint_10'] = _paint10;
    map['paint_20'] = _paint20;
    map['diamond_cut_10'] = _diamondCut10;
    map['diamond_cut_20'] = _diamondCut20;
    map['hard_damages'] = _hardDamages;
    map['color_match'] = _colorMatch;
    map['split_rim'] = _splitRim;
    map['custom_product_markup'] = _customProductMarkup;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
