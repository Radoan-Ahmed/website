import 'package:equatable/equatable.dart';
import '../../data/models/models.dart';

// ─── HOME STATE ───────────────────────────────────────────
abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoaded extends HomeState {
  final List<FeatureModel> features;
  final List<ServiceModel> services;
  final List<DoctorModel> doctors;
  final List<TestimonialModel> testimonials;
  final List<NewsModel> news;
  final List<StatModel> stats;
  final int heroSlideIndex;
  final int testimonialIndex;

  const HomeLoaded({
    required this.features,
    required this.services,
    required this.doctors,
    required this.testimonials,
    required this.news,
    required this.stats,
    this.heroSlideIndex = 0,
    this.testimonialIndex = 0,
  });

  HomeLoaded copyWith({
    int? heroSlideIndex,
    int? testimonialIndex,
  }) =>
      HomeLoaded(
        features: features,
        services: services,
        doctors: doctors,
        testimonials: testimonials,
        news: news,
        stats: stats,
        heroSlideIndex: heroSlideIndex ?? this.heroSlideIndex,
        testimonialIndex: testimonialIndex ?? this.testimonialIndex,
      );

  @override
  List<Object?> get props => [
        features,
        services,
        doctors,
        testimonials,
        news,
        stats,
        heroSlideIndex,
        testimonialIndex,
      ];
}

// ─── APPOINTMENT STATE ────────────────────────────────────
abstract class AppointmentState extends Equatable {
  const AppointmentState();
  @override
  List<Object?> get props => [];
}

class AppointmentInitial extends AppointmentState {}

class AppointmentLoading extends AppointmentState {}

class AppointmentSuccess extends AppointmentState {}

class AppointmentError extends AppointmentState {
  final String message;
  const AppointmentError(this.message);
  @override
  List<Object?> get props => [message];
}
