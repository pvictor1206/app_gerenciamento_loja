import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late PageController _pageController;
  int _page = 0;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();

    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[850],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
          primaryColor: Colors.white,
          textTheme: Theme.of(context).textTheme.copyWith(
            caption: TextStyle(color: Colors.white54)
          )
        ),
        child: BottomNavigationBar(
          currentIndex: _page,
          onTap: (p){
            _pageController.animateToPage(
                p,
                duration: Duration(microseconds: 500),
                curve: Curves.ease
            );
          },
          items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
            title: Text("Clientes")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              title: Text("Pedidos")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title: Text("Produtos")
          ),

        ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (p){
          setState(() {
            _page = p;
          });
        },
        children: [
          Container(color: Colors.red),
          Container(color: Colors.yellow),
          Container(color: Colors.green)
        ],
      ),
    );
  }
}
