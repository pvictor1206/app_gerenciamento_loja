import 'package:app_gerenciamento_loja/blocs/user_bloc.dart';
import 'package:app_gerenciamento_loja/tabs/orders_tab.dart';
import 'package:app_gerenciamento_loja/tabs/users_tap.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late PageController _pageController;
  int _page = 0;

  late UserBloc _userBloc;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();

    _pageController.dispose();

    _userBloc = UserBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
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
      body: SafeArea(
        child: BlocProvider(
          dependencies: [],
          blocs: [
            _userBloc as dynamic
          ],
          child: PageView(
            controller: _pageController,
            onPageChanged: (p){
              setState(() {
                _page = p;
              });
            },
            children: [
              UsersTap(),
              OrdersTab(),
              Container(color: Colors.green)
            ],
          ),
        ),
      ),
    );
  }
}
