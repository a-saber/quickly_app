import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:quickly_app/core/resources_manager/colors_manager.dart';
import 'package:quickly_app/core/service_locator/service_locator.dart';
import 'package:quickly_app/features/change_password/presentation/cubit/change_pass_cubit/change_pass_cubit.dart';
import 'package:quickly_app/features/engineer/presentation/views/engineers_view.dart';
import 'package:quickly_app/features/forgot_password/presentation/cubit/change_forgotten_pass_cubit/change_forgotten_pass_cubit.dart';
import 'package:quickly_app/features/forgot_password/presentation/cubit/send_code_cubit/send_code_cubit.dart';
import 'package:quickly_app/features/forgot_password/presentation/views/change_forgotten_pass_view.dart';
import 'package:quickly_app/features/profile/presentation/views/profile_view.dart';
import 'package:quickly_app/features/register/presentation/views/register_view.dart';
import 'package:quickly_app/features/secretary/presentation/views/secretaries_view.dart';
import 'package:quickly_app/features/settings/presentation/views/settings_view.dart';

import 'core/dio_helper/dio_helper.dart';
import 'core/local_database/cache_data.dart';
import 'core/local_database/cache_helper.dart';
import 'core/local_database/cache_helper_keys.dart';
import 'core/localization/app_localization.dart';
import 'core/localization/translation_key_manager.dart';
import 'features/change_password/data/repos/change_pass_repo_implementation.dart';
import 'features/change_password/presentation/views/change_pass_view.dart';
import 'features/forgot_password/data/repos/forget_password_repo_implementation.dart';
import 'features/forgot_password/presentation/cubit/verify_code_cubit/verify_code_cubit.dart';
import 'features/forgot_password/presentation/views/send_code_view.dart';
import 'features/forgot_password/presentation/views/verify_code_view.dart';
import 'features/jobs/presentation/views/create_job_view.dart';
import 'features/jobs/presentation/views/job_details_view.dart';
import 'features/jobs/presentation/views/jobs_list_view.dart';
import 'features/news/presentation/views/news_details_view.dart';
import 'features/orders/presentation/views/guarantee_details_view.dart';
import 'features/orders/presentation/views/orders_view.dart';
import 'features/payment_methods/presentation/views/payment_methods_view.dart';
import 'firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CacheHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupForgotPassSingleton();

  await CacheHelper.saveData(key:  CacheHelperKeys.langKey, value: CacheHelperKeys.keyAR);
  CacheData.lang= await CacheHelper.getData(key: CacheHelperKeys.langKey);

  if (CacheData.lang == null)
  {
    await CacheHelper.saveData(key: CacheHelperKeys.langKey, value: CacheHelperKeys.keyEN);
    await Get.updateLocale(TranslationKeyManager.localeEN);
    CacheData.lang = CacheHelperKeys.keyEN;
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers:
      [
        BlocProvider(create: (BuildContext context) =>ChangeForgottenPassCubit(getIt.get<ForgotPasswordRepoImplementation>())),
        BlocProvider(create: (BuildContext context) =>SendCodeCubit(getIt.get<ForgotPasswordRepoImplementation>())),
        BlocProvider(create: (BuildContext context) =>VerifyCodeCubit(getIt.get<ForgotPasswordRepoImplementation>())),
        BlocProvider(create: (BuildContext context) =>ChangePassCubit(getIt.get<ChangePassRepoImplementation>())),
      ],
      child: GetMaterialApp(
        title: 'Quickly',
          theme: ThemeData(
            fontFamily: 'Cairo',
            textSelectionTheme: const TextSelectionThemeData(
              selectionHandleColor: ColorsManager.primaryColor,
            ),
          ),
        debugShowCheckedModeBanner: false,
          locale: Locale( CacheData.lang!),
          translations: AppLocalization(),
       //home:  const SplashScreen()
        home:  const CreateJobView()
      ),
    );
  }
}

