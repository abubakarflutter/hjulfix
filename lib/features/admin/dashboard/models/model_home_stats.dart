class ModelHomeStats {
  ModelHomeStats({
      TotalNotStarted? totalNotStarted, 
      TotalOnGoing? totalOnGoing, 
      TotalReady? totalReady, 
      Delivered? delivered, 
      Offers? offers,}){
    _totalNotStarted = totalNotStarted;
    _totalOnGoing = totalOnGoing;
    _totalReady = totalReady;
    _delivered = delivered;
    _offers = offers;
}

  ModelHomeStats.fromJson(dynamic json) {
    _totalNotStarted = json['total_not_started'] != null ? TotalNotStarted.fromJson(json['total_not_started']) : null;
    _totalOnGoing = json['total_on_going'] != null ? TotalOnGoing.fromJson(json['total_on_going']) : null;
    _totalReady = json['total_ready'] != null ? TotalReady.fromJson(json['total_ready']) : null;
    _delivered = json['delivered'] != null ? Delivered.fromJson(json['delivered']) : null;
    _offers = json['offers'] != null ? Offers.fromJson(json['offers']) : null;
  }
  TotalNotStarted? _totalNotStarted;
  TotalOnGoing? _totalOnGoing;
  TotalReady? _totalReady;
  Delivered? _delivered;
  Offers? _offers;
ModelHomeStats copyWith({  TotalNotStarted? totalNotStarted,
  TotalOnGoing? totalOnGoing,
  TotalReady? totalReady,
  Delivered? delivered,
  Offers? offers,
}) => ModelHomeStats(  totalNotStarted: totalNotStarted ?? _totalNotStarted,
  totalOnGoing: totalOnGoing ?? _totalOnGoing,
  totalReady: totalReady ?? _totalReady,
  delivered: delivered ?? _delivered,
  offers: offers ?? _offers,
);
  TotalNotStarted? get totalNotStarted => _totalNotStarted;
  TotalOnGoing? get totalOnGoing => _totalOnGoing;
  TotalReady? get totalReady => _totalReady;
  Delivered? get delivered => _delivered;
  Offers? get offers => _offers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_totalNotStarted != null) {
      map['total_not_started'] = _totalNotStarted?.toJson();
    }
    if (_totalOnGoing != null) {
      map['total_on_going'] = _totalOnGoing?.toJson();
    }
    if (_totalReady != null) {
      map['total_ready'] = _totalReady?.toJson();
    }
    if (_delivered != null) {
      map['delivered'] = _delivered?.toJson();
    }
    if (_offers != null) {
      map['offers'] = _offers?.toJson();
    }
    return map;
  }

}

/// total : 50
/// sent : 23
/// seen : 17
/// accepted : 15
/// rejected : 0

class Offers {
  Offers({
      num? total, 
      num? sent, 
      num? seen, 
      num? accepted, 
      num? rejected,}){
    _total = total;
    _sent = sent;
    _seen = seen;
    _accepted = accepted;
    _rejected = rejected;
}

  Offers.fromJson(dynamic json) {
    _total = json['total'];
    _sent = json['sent'];
    _seen = json['seen'];
    _accepted = json['accepted'];
    _rejected = json['rejected'];
  }
  num? _total;
  num? _sent;
  num? _seen;
  num? _accepted;
  num? _rejected;
Offers copyWith({  num? total,
  num? sent,
  num? seen,
  num? accepted,
  num? rejected,
}) => Offers(  total: total ?? _total,
  sent: sent ?? _sent,
  seen: seen ?? _seen,
  accepted: accepted ?? _accepted,
  rejected: rejected ?? _rejected,
);
  num? get total => _total;
  num? get sent => _sent;
  num? get seen => _seen;
  num? get accepted => _accepted;
  num? get rejected => _rejected;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = _total;
    map['sent'] = _sent;
    map['seen'] = _seen;
    map['accepted'] = _accepted;
    map['rejected'] = _rejected;
    return map;
  }

}

/// daily : {"sales":0,"rims":0}
/// weekly : {"sales":0,"rims":0}
/// monthly : {"sales":0,"rims":0}
/// yearly : {"sales":"76089.00","rims":"32"}

class Delivered {
  Delivered({
      Daily? daily, 
      Weekly? weekly, 
      Monthly? monthly, 
      Yearly? yearly,}){
    _daily = daily;
    _weekly = weekly;
    _monthly = monthly;
    _yearly = yearly;
}

  Delivered.fromJson(dynamic json) {
    _daily = json['daily'] != null ? Daily.fromJson(json['daily']) : null;
    _weekly = json['weekly'] != null ? Weekly.fromJson(json['weekly']) : null;
    _monthly = json['monthly'] != null ? Monthly.fromJson(json['monthly']) : null;
    _yearly = json['yearly'] != null ? Yearly.fromJson(json['yearly']) : null;
  }
  Daily? _daily;
  Weekly? _weekly;
  Monthly? _monthly;
  Yearly? _yearly;
Delivered copyWith({  Daily? daily,
  Weekly? weekly,
  Monthly? monthly,
  Yearly? yearly,
}) => Delivered(  daily: daily ?? _daily,
  weekly: weekly ?? _weekly,
  monthly: monthly ?? _monthly,
  yearly: yearly ?? _yearly,
);
  Daily? get daily => _daily;
  Weekly? get weekly => _weekly;
  Monthly? get monthly => _monthly;
  Yearly? get yearly => _yearly;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_daily != null) {
      map['daily'] = _daily?.toJson();
    }
    if (_weekly != null) {
      map['weekly'] = _weekly?.toJson();
    }
    if (_monthly != null) {
      map['monthly'] = _monthly?.toJson();
    }
    if (_yearly != null) {
      map['yearly'] = _yearly?.toJson();
    }
    return map;
  }

}

/// sales : "76089.00"
/// rims : "32"

class Yearly {
  Yearly({
      String? sales, 
      String? rims,}){
    _sales = sales;
    _rims = rims;
}

  Yearly.fromJson(dynamic json) {
    _sales = json['sales'];
    _rims = json['rims'];
  }
  String? _sales;
  String? _rims;
Yearly copyWith({  String? sales,
  String? rims,
}) => Yearly(  sales: sales ?? _sales,
  rims: rims ?? _rims,
);
  String? get sales => _sales;
  String? get rims => _rims;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sales'] = _sales;
    map['rims'] = _rims;
    return map;
  }

}

/// sales : 0
/// rims : 0

class Monthly {
  Monthly({
      num? sales, 
      num? rims,}){
    _sales = sales;
    _rims = rims;
}

  Monthly.fromJson(dynamic json) {
    _sales = json['sales'];
    _rims = json['rims'];
  }
  num? _sales;
  num? _rims;
Monthly copyWith({  num? sales,
  num? rims,
}) => Monthly(  sales: sales ?? _sales,
  rims: rims ?? _rims,
);
  num? get sales => _sales;
  num? get rims => _rims;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sales'] = _sales;
    map['rims'] = _rims;
    return map;
  }

}

/// sales : 0
/// rims : 0

class Weekly {
  Weekly({
      num? sales, 
      num? rims,}){
    _sales = sales;
    _rims = rims;
}

  Weekly.fromJson(dynamic json) {
    _sales = json['sales'];
    _rims = json['rims'];
  }
  num? _sales;
  num? _rims;
Weekly copyWith({  num? sales,
  num? rims,
}) => Weekly(  sales: sales ?? _sales,
  rims: rims ?? _rims,
);
  num? get sales => _sales;
  num? get rims => _rims;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sales'] = _sales;
    map['rims'] = _rims;
    return map;
  }

}

/// sales : 0
/// rims : 0

class Daily {
  Daily({
      num? sales, 
      num? rims,}){
    _sales = sales;
    _rims = rims;
}

  Daily.fromJson(dynamic json) {
    _sales = json['sales'];
    _rims = json['rims'];
  }
  num? _sales;
  num? _rims;
Daily copyWith({  num? sales,
  num? rims,
}) => Daily(  sales: sales ?? _sales,
  rims: rims ?? _rims,
);
  num? get sales => _sales;
  num? get rims => _rims;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sales'] = _sales;
    map['rims'] = _rims;
    return map;
  }

}

/// rims : "1"
/// sales : "672.00"

class TotalReady {
  TotalReady({
      String? rims, 
      String? sales,}){
    _rims = rims;
    _sales = sales;
}

  TotalReady.fromJson(dynamic json) {
    _rims = json['rims'];
    _sales = json['sales'];
  }
  String? _rims;
  String? _sales;
TotalReady copyWith({  String? rims,
  String? sales,
}) => TotalReady(  rims: rims ?? _rims,
  sales: sales ?? _sales,
);
  String? get rims => _rims;
  String? get sales => _sales;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rims'] = _rims;
    map['sales'] = _sales;
    return map;
  }

}

/// rims : "3"
/// sales : "7096.00"

class TotalOnGoing {
  TotalOnGoing({
      String? rims, 
      String? sales,}){
    _rims = rims;
    _sales = sales;
}

  TotalOnGoing.fromJson(dynamic json) {
    _rims = json['rims'];
    _sales = json['sales'];
  }
  String? _rims;
  String? _sales;
TotalOnGoing copyWith({  String? rims,
  String? sales,
}) => TotalOnGoing(  rims: rims ?? _rims,
  sales: sales ?? _sales,
);
  String? get rims => _rims;
  String? get sales => _sales;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rims'] = _rims;
    map['sales'] = _sales;
    return map;
  }

}

/// rims : "5"
/// sales : "12392.00"

class TotalNotStarted {
  TotalNotStarted({
      String? rims, 
      String? sales,}){
    _rims = rims;
    _sales = sales;
}

  TotalNotStarted.fromJson(dynamic json) {
    _rims = json['rims'];
    _sales = json['sales'];
  }
  String? _rims;
  String? _sales;
TotalNotStarted copyWith({  String? rims,
  String? sales,
}) => TotalNotStarted(  rims: rims ?? _rims,
  sales: sales ?? _sales,
);
  String? get rims => _rims;
  String? get sales => _sales;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rims'] = _rims;
    map['sales'] = _sales;
    return map;
  }

}