import 'package:flutter/material.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cryptoni',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.grey[700]),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.grey[700],
        ),
      ),
      home: WalletScreen(),
    );
  }
}

class WalletScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.menu, color: Colors.grey[700]),
            Text('Carteira', style: TextStyle(color: Colors.grey[700])),
            Icon(Icons.more_vert, color: Colors.grey[700]),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          BalanceCard(),
          CryptoCard(
            cryptoName: 'BTC',
            amountOwned: '3.529020',
            usdValue: '19,153',
            percentageChange: '8.23%',
            cryptoIcon: CryptoFontIcons.BTC,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailScreen(cryptoName: 'BTC', cryptoIcon: CryptoFontIcons.BTC)),
              );
            },
          ),
          CryptoCard(
            cryptoName: 'ETH',
            amountOwned: '12.33368',
            usdValue: '4,082',
            percentageChange: '8.07%',
            cryptoIcon: CryptoFontIcons.ETH,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailScreen(cryptoName: 'ETH', cryptoIcon: CryptoFontIcons.ETH)),
              );
            },
          ),
          CryptoCard(
            cryptoName: 'XRP',
            amountOwned: '1911.33368',
            usdValue: '599',
            percentageChange: '-13.6%',
            cryptoIcon: CryptoFontIcons.XRP,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailScreen(cryptoName: 'XRP', cryptoIcon: CryptoFontIcons.XRP)),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet, color: Colors.grey[700]),
            label: 'Carteira',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notificações',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Configurações',
          ),
        ],
      ),
    );
  }
}

class BalanceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total da Carteira',
                  style: TextStyle(fontSize: 24.0),
                ),
                Icon(Icons.account_balance_wallet, color: Colors.grey[700]),
              ],
            ),
            SizedBox(height: 10.0),
            Text(
              '\$39,584',
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
            ),
            Text(
              '7.25132 BTC',
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              '+3.56%',
              style: TextStyle(fontSize: 20.0, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}

class CryptoCard extends StatelessWidget {
  final String cryptoName;
  final String amountOwned;
  final String usdValue;
  final String percentageChange;
  final IconData cryptoIcon;
  final Function onTap;

  CryptoCard({
    required this.cryptoName,
    required this.amountOwned,
    required this.usdValue,
    required this.percentageChange,
    required this.cryptoIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap as void Function()?,
      child: Card(
        child: ListTile(
          leading: Icon(cryptoIcon, color: Colors.grey[700]),
          title: Text(cryptoName),
          subtitle: Text('$amountOwned $cryptoName = $usdValue USD'),
          trailing: Text(
            percentageChange,
            style: TextStyle(
              color: percentageChange.startsWith('-') ? Colors.red : Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String cryptoName;
  final IconData cryptoIcon;

  DetailScreen({required this.cryptoName, required this.cryptoIcon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(cryptoIcon, color: Colors.grey[700], size: 32),
            SizedBox(width: 8),
            Text('$cryptoName Carteira', style: TextStyle(color: Colors.grey[700], fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
        iconTheme: IconThemeData(color: Colors.grey[700]),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(cryptoIcon, size: 100, color: Colors.grey[700]),
                ],
              ),
              SizedBox(height: 20),
              Text(
                '$cryptoName',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.grey[700]),
              ),
              SizedBox(height: 20.0),
              Text(
                'Quantidade: 3.529020 $cryptoName',
                style: TextStyle(fontSize: 20.0, color: Colors.grey[700]),
              ),
              Text(
                'Valor em USD: \$19,153',
                style: TextStyle(fontSize: 20.0, color: Colors.grey[700]),
              ),
              Text(
                'Variação percentual: 8.23%',
                style: TextStyle(fontSize: 20.0, color: Colors.green),
              ),
            ],
          ),
        ),
      ),
    );
  }
}