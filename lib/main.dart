import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_c11_online/core/my_bloc_observer.dart';
import 'package:flutter_e_commerce_c11_online/core/widget/shared_preference_utils.dart';
import 'package:flutter_e_commerce_c11_online/di/di.dart';
import 'package:flutter_e_commerce_c11_online/features/auth/presentation/screens/sign_in/sign_in_screen.dart';
import 'package:flutter_e_commerce_c11_online/features/main_layout/home/presentation/cubit/home_tab_view_model.dart';
import 'package:flutter_e_commerce_c11_online/features/products_screen/presentation/cubit/product_screen_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/routes_manager/route_generator.dart';
import 'core/routes_manager/routes.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  await SharedPreferenceUtils.init();
  var token = SharedPreferenceUtils.getData(key: 'token');
  String route ;
  if(token == null){
    route = Routes.signInRoute;
  }else{
    route = Routes.mainRoute;
  }
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context)=> getIt<HomeTabViewModel>()),
      BlocProvider(create: (context)=> getIt<ProductScreenViewModel>()),
    ],
      child:  MainApp(route: route,)));
}

class MainApp extends StatelessWidget {
  String route ;
   MainApp({required this.route});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: child,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: route,
      ),
    );
  }
}
