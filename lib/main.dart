import 'package:flutter/gestures.dart' show PointerDeviceKind;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/theme/app_theme.dart';
import 'data/repositories/app_repository.dart';
import 'presentation/cubits/home_cubit.dart';
import 'presentation/pages/home_page.dart';
import 'presentation/pages/map_page.dart';
import 'presentation/pages/training_page.dart';

void main() {
  runApp(const AWCApp());
}

class AWCApp extends StatelessWidget {
  const AWCApp({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = AppRepositoryImpl();

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AppRepository>(create: (_) => repository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<HomeCubit>(
            create: (ctx) => HomeCubit(
              repository: ctx.read<AppRepository>(),
            ),
          ),
          BlocProvider<AppointmentCubit>(
            create: (ctx) => AppointmentCubit(
              repository: ctx.read<AppRepository>(),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'Acu Life Health Care',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.theme,
          initialRoute: '/',
          routes: {
            '/': (_) => const HomePage(),
            '/training': (_) => const TrainingPage(),
            '/location': (_) => const MapPage(),
          },
          scrollBehavior: const _WebScrollBehavior(),
        ),
      ),
    );
  }
}

class _WebScrollBehavior extends ScrollBehavior {
  const _WebScrollBehavior();

  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}
