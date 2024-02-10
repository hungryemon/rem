// ignore_for_file: prefer_null_aware_operators

import 'dart:convert';

MyProfileResponse myProfileResponseFromJson(String str) =>
    MyProfileResponse.fromJson(json.decode(str));

String myProfileResponseToJson(MyProfileResponse data) =>
    json.encode(data.toJson());

class MyProfileResponse {
  int? code;
  String? status;
  String? msg;
  CurrentUserData? data;

  MyProfileResponse({
    this.code,
    this.status,
    this.msg,
    this.data,
  });

  factory MyProfileResponse.fromJson(Map<String, dynamic> json) =>
      MyProfileResponse(
        code: json["code"],
        status: json["status"],
        msg: json["msg"],
        data: json["data"] == null
            ? null
            : CurrentUserData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "msg": msg,
        "data": data?.toJson(),
      };
}

class CurrentUserData {
  String name;
  String? nameEnglish;
  String nickname;
  dynamic designationMain;
  dynamic designationSub;
  int? ratingSum;
  int? ratingCount;
  String? username;
  String email;
  String emailMsisdn;
  String phone;
  String phoneExtra;
  String photoUrl;
  String avatarUrl;
  String? signatureUrl;
  bool? emailVerified;
  bool? phoneVerified;
  int role;
  bool? hasBundleCourse;
  dynamic fcm;
  dynamic dob;
  dynamic location;
  dynamic nid;
  String? bio;
  dynamic about;
  DateTime? lastLogin;
  int countEnroll;
  int? countFreeEnroll;
  int? countAssessmentEnroll;
  dynamic fcmToken;
  bool? isActive;
  dynamic rank;
  bool? isRecruiter;
  bool? isAffiliate;
  bool? onTalent;
  String id;
  int? countPurchase;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? idx;
  UserPreference? preference;
  List<dynamic>? achievements;
  List<dynamic>? tags;
  List<dynamic>? reviews;
  List<dynamic>? companies;

  CurrentUserData({
    this.name = '',
    this.nameEnglish,
    this.nickname = '',
    this.designationMain,
    this.designationSub,
    this.ratingSum,
    this.ratingCount,
    this.username,
    this.email = '',
    this.hasBundleCourse,
    this.emailMsisdn = '',
    this.phone = '',
    this.photoUrl = '',
    this.phoneExtra = '',
    this.avatarUrl = '',
    this.signatureUrl,
    this.emailVerified,
    this.phoneVerified,
    this.role = 0,
    this.fcm,
    this.dob,
    this.location,
    this.nid,
    this.bio,
    this.about,
    this.lastLogin,
    this.countEnroll = 0,
    this.countFreeEnroll,
    this.countAssessmentEnroll,
    this.fcmToken,
    this.isActive,
    this.rank,
    this.isRecruiter,
    this.isAffiliate,
    this.onTalent,
    this.id = '',
    this.countPurchase,
    this.createdAt,
    this.updatedAt,
    this.idx,
    this.preference,
    this.achievements,
    this.tags,
    this.reviews,
    this.companies,
  });

  factory CurrentUserData.fromJson(Map<String, dynamic>? json) =>
      CurrentUserData(
        name: json?["name"] ?? '',
        nameEnglish: json?["name_english"],
        nickname: json?["nickname"] ?? '',
        designationMain: json?["designation_main"],
        designationSub: json?["designation_sub"],
        ratingSum: json?["rating_sum"],
        ratingCount: json?["rating_count"],
        username: json?["username"],
        email: json?["email"] ?? '',
        emailMsisdn: json?["email_msisdn"] ?? '',
        phone: json?["phone"] ?? '',
        phoneExtra: json?["phone_extra"] ?? '',
        photoUrl: json?["photo_url"] ?? '',
        avatarUrl: json?["avatar_url"] ?? '',
        signatureUrl: json?["signature_url"],
        emailVerified: json?["email_verified"],
        phoneVerified: json?["phone_verified"],
        role: json?["role"] ?? '',
        hasBundleCourse: json?["has_bundle_course"],
        fcm: json?["fcm"],
        dob: json?["dob"],
        location: json?["location"],
        nid: json?["nid"],
        bio: json?["bio"],
        about: json?["about"],
        lastLogin: json?["last_login"] == null
            ? null
            : DateTime.parse(json?["last_login"]),
        countEnroll: json?["count_enroll"] ?? 0,
        countFreeEnroll: json?["count_free_enroll"],
        countAssessmentEnroll: json?["count_assessment_enroll"],
        fcmToken: json?["fcm_token"],
        isActive: json?["is_active"],
        rank: json?["rank"],
        isRecruiter: json?["is_recruiter"],
        isAffiliate: json?["is_affiliate"],
        onTalent: json?["on_talent"],
        id: json?["_id"] ?? '',
        countPurchase: json?["count_purchase"],
        createdAt: json?["createdAt"] == null
            ? null
            : DateTime.parse(json?["createdAt"]),
        updatedAt: json?["updatedAt"] == null
            ? null
            : DateTime.parse(json?["updatedAt"]),
        idx: json?["idx"],
        preference: json?["preference"] == null
            ? null
            : UserPreference.fromJson(json?["preference"]),
        achievements: json?["achievements"] == null
            ? []
            : List<dynamic>.from(json?["achievements"]!.map((x) => x)),
        tags: json?["tags"] == null
            ? []
            : List<dynamic>.from(json?["tags"]!.map((x) => x)),
        reviews: json?["reviews"] == null
            ? []
            : List<dynamic>.from(json?["reviews"]!.map((x) => x)),
        companies: json?["companies"] == null
            ? []
            : List<dynamic>.from(json?["companies"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "name_english": nameEnglish,
        "nickname": nickname,
        "designation_main": designationMain,
        "designation_sub": designationSub,
        "rating_sum": ratingSum,
        "rating_count": ratingCount,
        "username": username,
        "email": email,
        "email_msisdn": emailMsisdn,
        "phone": phone,
        "phone_extra": phoneExtra,
        "photo_url": photoUrl,
        "avatar_url": avatarUrl,
        "signature_url": signatureUrl,
        "email_verified": emailVerified,
        "phone_verified": phoneVerified,
        "role": role,
        "has_bundle_course": hasBundleCourse,
        "fcm": fcm,
        "dob": dob,
        "location": location,
        "nid": nid,
        "bio": bio,
        "about": about,
        "last_login": lastLogin?.toIso8601String(),
        "count_enroll": countEnroll,
        "count_free_enroll": countFreeEnroll,
        "count_assessment_enroll": countAssessmentEnroll,
        "fcm_token": fcmToken,
        "is_active": isActive,
        "rank": rank,
        "is_recruiter": isRecruiter,
        "is_affiliate": isAffiliate,
        "on_talent": onTalent,
        "_id": id,
        "count_purchase": countPurchase,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "idx": idx,
        "preference": preference?.toJson(),
        "achievements": achievements == null
            ? []
            : List<dynamic>.from(achievements!.map((x) => x)),
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "reviews":
            reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x)),
        "companies": companies == null
            ? []
            : List<dynamic>.from(companies!.map((x) => x)),
      };
}

class UserPreference {
  Category? category;
  Language? language;
  bool? isDarkTheme;

  UserPreference({
    this.category,
    this.language,
    this.isDarkTheme,
  });

  factory UserPreference.fromJson(Map<String, dynamic> json) => UserPreference(
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        language: json["language"] == null
            ? null
            : Language.fromJson(json["language"]),
        isDarkTheme: json["is_dark_theme"],
      );

  Map<String, dynamic> toJson() => {
        "category": category?.toJson(),
        "language": language?.toJson(),
        "is_dark_theme": isDarkTheme,
      };
}

class Language {
  String? languageCode;
  String? countryCode;

  Language({
    this.languageCode,
    this.countryCode,
  });

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        languageCode: json['language_code'],
        countryCode: json['country_code'],
      );

  Map<String, dynamic> toJson() => {
        "language_code": languageCode,
        "country_code": countryCode,
      };
}

class Category {
  String? id;
  String? slug;

  Category({
    this.id,
    this.slug,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "slug": slug,
      };
}
