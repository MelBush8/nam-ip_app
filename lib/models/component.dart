import 'package:nam_ip_museum/models/perma_period.dart';
import 'package:nam_ip_museum/models/type_component.dart';

class Component {
  late int id;
  late String name;
  late String descFr;
  late String descEn;
  late String descNL;
  late String logo;
  late int date;
  late TypeComponent type;
  late PermaPeriod? period;

  Component({required this.id, required this.name, required this.descFr, required this.descEn, required this.descNL,
    required this.logo, required this.date, required this.type});

  Component.fromMap(Map map) {
    id = map["ID"];
    name = map["Nom"];
    descFr = map["DescFR"];
    descEn = map["DescEN"];
    descNL = map["DescNL"] ?? "";
    logo = map["logo"];
    date = map["Annee"];
    type = convertStringToTypeComponent(map["TYPE"]);
    period = convertStringToPermaPeriod(map["PERIODE"]);
  }

  @override
  String toString() {
    return '$name, $descFr';
  }

  static TypeComponent convertStringToTypeComponent(String type) {
    switch (type.toLowerCase()) {
      case 'micro':
        return TypeComponent.micro;
      case 'os':
        return TypeComponent.os;
      case 'cpu':
        return TypeComponent.cpu;
      case 'ihm':
        return TypeComponent.ihm;
      case 'app':
        return TypeComponent.app;
      case 'machine':
        return TypeComponent.machine;
      case 'org':
        return TypeComponent.org;
      case 'event':
        return TypeComponent.event;
      case 'error':

      default:
        return TypeComponent.error;
    }
  }

  static PermaPeriod? convertStringToPermaPeriod(String? period) {
    switch (period?.toLowerCase()) {
      case 'micro':
        return PermaPeriod.micro;
      case 'meca':
        return PermaPeriod.meca;
      case 'mainframe':
        return PermaPeriod.mainframe;
      case 'mini':
        return PermaPeriod.mini;
      case 'moderne':
        return PermaPeriod.moderne;
      default:
        return null;
    }
  }
}