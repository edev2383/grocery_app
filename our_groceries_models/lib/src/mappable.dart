abstract class Mappable {
  Map<String, dynamic> toMap();
  dynamic fromMap(Map<String, dynamic> json);
}
