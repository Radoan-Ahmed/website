import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/models.dart';
import '../../data/repositories/app_repository.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final AppRepository repository;

  HomeCubit({required this.repository}) : super(HomeInitial()) {
    _loadData();
  }

  void _loadData() {
    emit(HomeLoaded(
      features: repository.getFeatures(),
      services: repository.getServices(),
      doctors: repository.getDoctors(),
      testimonials: repository.getTestimonials(),
      news: repository.getNews(),
      stats: repository.getStats(),
    ));
  }

  void changeHeroSlide(int index) {
    if (state is HomeLoaded) {
      emit((state as HomeLoaded).copyWith(heroSlideIndex: index));
    }
  }

  void changeTestimonial(int index) {
    if (state is HomeLoaded) {
      emit((state as HomeLoaded).copyWith(testimonialIndex: index));
    }
  }
}

// ─── APPOINTMENT CUBIT ────────────────────────────────────
class AppointmentCubit extends Cubit<AppointmentState> {
  final AppRepository repository;

  AppointmentCubit({required this.repository}) : super(AppointmentInitial());

  Future<void> submitAppointment(AppointmentModel appointment) async {
    emit(AppointmentLoading());
    try {
      final success = await repository.submitAppointment(appointment);
      if (success) {
        emit(AppointmentSuccess());
      } else {
        emit(const AppointmentError('Failed to submit appointment.'));
      }
    } catch (e) {
      emit(AppointmentError(e.toString()));
    }
  }

  void reset() => emit(AppointmentInitial());
}
