import '../models/models.dart';
import '../../core/constants/app_content.dart';

abstract class AppRepository {
  List<FeatureModel> getFeatures();
  List<ServiceModel> getServices();
  List<DoctorModel> getDoctors();
  List<TestimonialModel> getTestimonials();
  List<NewsModel> getNews();
  List<StatModel> getStats();
  Future<bool> submitAppointment(AppointmentModel appointment);
}

class AppRepositoryImpl implements AppRepository {
  @override
  List<FeatureModel> getFeatures() {
    return AppContent.features
        .map((f) => FeatureModel(
              icon: f['icon']!,
              title: f['title']!,
              description: f['description']!,
              linkText: f['linkText']!,
              url: f['url']!,
            ))
        .toList();
  }

  @override
  List<ServiceModel> getServices() {
    return AppContent.services
        .map((s) => ServiceModel(
              image: s['image']!,
              title: s['title']!,
              description: s['description']!,
              url: s['url']!,
            ))
        .toList();
  }

  @override
  List<DoctorModel> getDoctors() {
    return AppContent.doctors
        .map((d) => DoctorModel(
              name: d['name']!,
              qualification: d['qualification']!,
              image: d['image']!,
              url: d['url']!,
            ))
        .toList();
  }

  @override
  List<TestimonialModel> getTestimonials() {
    return AppContent.testimonials
        .map((t) => TestimonialModel(
              title: t['title']!,
              review: t['review']!,
              name: t['name']!,
              location: t['location']!,
              avatar: t['avatar']!,
            ))
        .toList();
  }

  @override
  List<NewsModel> getNews() {
    return AppContent.newsItems
        .map((n) => NewsModel(
              title: n['title']!,
              date: n['date']!,
              category: n['category']!,
              image: n['image']!,
              url: n['url']!,
            ))
        .toList();
  }

  @override
  List<StatModel> getStats() {
    return AppContent.stats
        .map((s) => StatModel(
              value: s['value']!,
              suffix: s['suffix']!,
              label: s['label']!,
            ))
        .toList();
  }

  @override
  Future<bool> submitAppointment(AppointmentModel appointment) async {
    await Future.delayed(const Duration(seconds: 2));
    // TODO: Replace with real API call
    return true;
  }
}
