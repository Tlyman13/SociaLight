import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ActivityModel extends Equatable {
  String? name;

  ActivityModel(
      {
        required this.name,
        });

  ActivityModel.fromJson(Map<dynamic, dynamic>? map) {
    if (map == null) {
      return;
    }
    name = map['name'];
  }
  toJson() {
    return {
      'name': name,
    };
  }

  ActivityModel copyWith({
    String? name,
  }) {
    return ActivityModel(
      name: name ?? this.name,
    );
  }


  @override
  List<Object?> get props => [
        name,
      ];
}
