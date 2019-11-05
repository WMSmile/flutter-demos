import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'index.dart';

/// 初始化完成后才会加载UI(MyApp)
void main() => Global.init().then((e) => runApp(MyApp()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildCloneableWidget>[
        ChangeNotifierProvider.value(
          value: ThemeModel(),
        ),
        ChangeNotifierProvider.value(
          value: UserModel(),
        ),
        ChangeNotifierProvider.value(
          value: LocaleModel(),
        ),
      ],
      child: Consumer2<ThemeModel, LocaleModel>(
        builder: (BuildContext context, themeModel, localeModel, Widget child) {
          return MaterialApp(
            theme: ThemeData(
              primarySwatch: themeModel.theme,
            ),
            onGenerateTitle: (context) {
              return GmLocalizations.of(context).title;
            },
            home: HomeRoute(), // 应用主页
            locale: localeModel.getLocale(),
            //我们只支持美国英语和中文简体
            supportedLocales: [
              const Locale('en', 'US'), // 美国英语
              const Locale('zh', 'CN'), // 中文简体
              //其它Locales
            ],
            localizationsDelegates: [
              // 本地化的代理类
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GmLocalizationsDelegate()
            ],
            localeResolutionCallback:
                (Locale _locale, Iterable<Locale> supportedLocales) {
              if (localeModel.getLocale() != null) {
                //如果已经选定语言，则不跟随系统
                return localeModel.getLocale();
              } else {
                //跟随系统
                Locale locale;
                if (supportedLocales.contains(_locale)) {
                  locale= _locale;
                } else {
                  //如果系统语言不是中文简体或美国英语，则默认使用美国英语
                  locale= Locale('en', 'US');
                }
                return locale;
              }
            },
            // 注册路由表
            routes: <String, WidgetBuilder>{
              "login": (context) => LoginRoute(),
              "themes": (context) => ThemeChangeRoute(),
              "language": (context) => LanguageRoute(),
            },
//            //如果是有部分页面使用需要控制是否登录 放弃路由模式使用此方法
//            onGenerateRoute: (RouteSettings settings){
//              return MaterialPageRoute(builder: (context){
//                String routeName = settings.name;
//                // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由，
//                // 引导用户登录；其它情况则正常打开路由。
//                }
//              );
//            },

          );
        },
      ),
    );
  }
}
