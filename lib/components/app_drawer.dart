import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/auth.dart';
import 'package:shop/pages/orders_page.dart';
import 'package:shop/utils/app_routes.dart';
import 'package:shop/utils/custom_route.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text('Bem vindo, Usuário!'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('Loja'),
            onTap: (() {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.auth_or_home,
              );
            }),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Pedidos'),
            onTap: (() {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.orders,
              );
              // Navigator.of(context).pushReplacement(
              //   CustomRoute(builder: (ctx) => const OrdersPage()),
              // );
            }),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Gerenciar produtos'),
            onTap: (() {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.product,
              );
            }),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Sair'),
            onTap: (() {
              Provider.of<Auth>(context, listen: false).logout();
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.auth_or_home,
              );
            }),
          ),
        ],
      ),
    );
  }
}
