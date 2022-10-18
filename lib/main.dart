import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Al-Abed Foundation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color.fromRGBO(66, 3, 44, 1),
            secondary: const Color.fromRGBO(211, 107, 0, 1)),
        fontFamily: 'Amiri',
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String url = 'http://wa.me/+201122602753';

  void _goToWhatsApp() async {
    try {
      await canLaunchUrl(Uri.parse(url)) == true
          ? await launchUrl(
              Uri.parse(url),
            )
          : throw 'Couldn\'t Launch URL!';
    } catch (e) {
      setState(() {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text(
              'There is something went wrong, try again later!',
            ),
            content: Text(e.toString()),
            titleTextStyle: TextStyle(
              color: Theme.of(context).errorColor,
            ),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(241, 239, 220, 1),
        padding: const EdgeInsets.all(15),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 300,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  ' Al-Abed Foundation ',
                  style: TextStyle(
                    fontFamily: 'Amiri',
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                background: Hero(
                  tag: 0,
                  child: Image.asset(
                    'assets/images/Appliances.jpg',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                const SizedBox(height: 10),
                TextButton.icon(
                  icon: Icon(Icons.whatsapp_outlined,
                      size: 40, color: Theme.of(context).colorScheme.secondary),
                  onPressed: () => _goToWhatsApp(),
                  label: const Text(
                    'إضغط هنا للتواصل معنا',
                    style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'Amiri',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  child: const Text(
                    '\n يوجد لدينا صيانة وتركيب جميع أنواع الأجهزة الكهربائية \n \n'
                    'وأيضًا لدينا قطع غيار جميع الأجهزة الكهربائية\n',
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Amiri',
                      color: Color.fromRGBO(66, 3, 44, 1),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  child: const Text(
                    'لدينا مهندسون على أعلى مستوى من التمييز للتعامل مع أجهزتكم والحفاظ علي جودتها وتقديم أعلى كفاءة في الأداء..\n '
                    'يشرفنا أن نقدم لكم الخدمات الفورية للصيانة بالمنزل دون نقل الجهاز تحت إشراف مهندسون متخصصون... \n',
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Amiri',
                      color: Color.fromRGBO(66, 3, 44, 1),
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _goToWhatsApp(),
        tooltip: 'Call Us WhatsApp',
        child: const Icon(Icons.whatsapp_rounded),
      ),
    );
  }
}
