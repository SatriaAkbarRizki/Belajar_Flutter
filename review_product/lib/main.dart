import 'package:flutter/material.dart';
import 'package:review_product/navigator2.dart';
import 'FavoriteButton.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeApp());
  }
}

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return StatefulHome();
  }
}

class StatefulHome extends State<HomeApp> {
  Color color = Colors.blue;
  int selectIndex = 0;
  late Route route;
  void onItemClick(int index) => setState(() {
        selectIndex = index;
      });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(
          children: [
            imageProduct,
            titleProduct,
            buttonColum,
            descriptionProduct,
            // navigasiActivity(listNavigator.elementAt(selectIndex))
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu),
                label: 'Menu',
                backgroundColor: Colors.orange),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box),
                label: 'About',
                backgroundColor: Colors.green)
          ],
          // Navigator.push(context,MaterialPageRoute(builder: (context)(context) => naviga,)),
          currentIndex: selectIndex,
          onTap: (onItemClick) {
            setState(() {
              selectIndex = onItemClick;
              if (selectIndex == 0) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeApp()));
              } else if (selectIndex == 1) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => navigator2()));
              }
            });
          },
        ),
      ),
    );
  }

  Widget imageProduct = Container(
    padding: const EdgeInsets.all(10),
    child: Image.network(
        'https://images.unsplash.com/photo-1626729053225-4ba42f6b8365?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80'),
  );
  Widget titleProduct = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: const Text(
                'Google Pixel 5',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Text('128GB 8GB RAM ', style: TextStyle(color: Colors.grey[500]))
          ],
        )),
        const FavoriteButton()
      ],
    ),
  );

  Widget buttonColum = Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      buildColum(Colors.blue, Icons.shopping_bag, 'Beli'),
      buildColum(Colors.blue, Icons.save, 'Simpan'),
      buildColum(Colors.blue, Icons.share, 'Share')
    ],
  );

  Widget descriptionProduct = Container(
    padding: const EdgeInsets.all(32),
    child: Wrap(
      children: const [
        Text(
          "Google Pixel 5 pertama kali diperkenalkan pada 2020, September 30. HP besutan Google ini membawa sejumlah fitur unggulan, mulai dari chipset Snapdragon 765G 5G dengan prosesor Octa-core (1x2.4 GHz Kryo 475 Prime & 1x2.2 GHz Kryo 475 Gold & 6x1.8 GHz Kryo 475 Silver) dan GPU Adreno 620, hingga kamera utama dengan resolusi mencapai 16 MP. Smartphone yang pada awal peluncurannya dibandrol dengan harga \$ 629.99 / € 639.00 / £ 589.00 / ₹ 65,500 (harga global) ini, hadir dengan spesifikasi yang terbilang menarik. Pada layar misalnya, Google Pixel 5 dilengkapi layar berukuran 6.0 Inch, 1080x2340 pixels dengan tipe layar OLED, 90Hz, HDR10+. Sementara pada sektor memori, smartphone yang hadir dalam varian warna Just Black, Sorta Sage ini menggunakan konfigurasi ROM dan RAM 128GB 8GB RAM",
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.justify,
          softWrap: true,
        ),
      ],
    ),
  );
  static Column buildColum(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        )
      ],
    );
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang Aplikasi'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Kembali'),
        ),
      ),
    );
  }
}
