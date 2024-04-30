import 'package:flutter/material.dart';
import 'package:gprojukti/Statemanagement/add_to_card_proviser.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gprojukti/View/splash_screen.dart';
import 'package:provider/provider.dart';
import 'Statemanagement/product_provider.dart';


void main()async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductProvider>(create: (context) => ProductProvider(),),
        ChangeNotifierProvider<AddToCartProvider>(create: (context) => AddToCartProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        //  home:ReceiverProfile(),
        home: SplashScrreen(),
      ),
    );
  }
}