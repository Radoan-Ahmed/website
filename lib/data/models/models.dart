import 'package:equatable/equatable.dart';

// ─── APPOINTMENT MODEL ────────────────────────────────────
class AppointmentModel extends Equatable {
  final String name;
  final String mobile;
  final String date;
  final String medicalIssue;

  const AppointmentModel({
    required this.name,
    required this.mobile,
    required this.date,
    required this.medicalIssue,
  });

  @override
  List<Object?> get props => [name, mobile, date, medicalIssue];
}

// ─── GENERIC SECTION MODEL ────────────────────────────────
class FeatureModel extends Equatable {
  final String icon;
  final String title;
  final String description;
  final String linkText;
  final String url;

  const FeatureModel({
    required this.icon,
    required this.title,
    required this.description,
    required this.linkText,
    required this.url,
  });

  @override
  List<Object?> get props => [title];
}

class ServiceModel extends Equatable {
  final String image;
  final String title;
  final String description;
  final String url;

  const ServiceModel({
    required this.image,
    required this.title,
    required this.description,
    required this.url,
  });

  @override
  List<Object?> get props => [title];
}

class DoctorModel extends Equatable {
  final String name;
  final String qualification;
  final String image;
  final String url;

  const DoctorModel({
    required this.name,
    required this.qualification,
    required this.image,
    required this.url,
  });

  @override
  List<Object?> get props => [name];
}

class TestimonialModel extends Equatable {
  final String title;
  final String review;
  final String name;
  final String location;
  final String avatar;

  const TestimonialModel({
    required this.title,
    required this.review,
    required this.name,
    required this.location,
    required this.avatar,
  });

  @override
  List<Object?> get props => [name];
}

class NewsModel extends Equatable {
  final String title;
  final String date;
  final String category;
  final String image;
  final String url;

  const NewsModel({
    required this.title,
    required this.date,
    required this.category,
    required this.image,
    required this.url,
  });

  @override
  List<Object?> get props => [title];
}

class StatModel extends Equatable {
  final String value;
  final String suffix;
  final String label;

  const StatModel({
    required this.value,
    required this.suffix,
    required this.label,
  });

  @override
  List<Object?> get props => [label];
}
