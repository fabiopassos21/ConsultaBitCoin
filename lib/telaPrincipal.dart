import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Telaprincipal extends StatefulWidget {
  const Telaprincipal({super.key});

  @override
  State<Telaprincipal> createState() => _TelaprincipalState();
}

class _TelaprincipalState extends State<Telaprincipal> {
  double turn = 0,
      compraBr = 0,
      vendaBr = 0,
      lastBr = 0,
      lastUs = 0,
      lastCN = 0,
      lastJp = 0,
      compraUs = 0,
      vendaUs = 0,
      compraJP = 0,
      vendaJP = 0,
      compraCN = 0,
      vendaCN = 0;

  bitCoin() async {
    String url = 'https://blockchain.info/ticker';
    http.Response response = await http.get(Uri.parse(url));
    // print('meu corpo do texto sla' + response.body);
    Map<String, dynamic> retorno = json.decode(response.body);
    setState(() {});
    compraBr = retorno["BRL"]["buy"];
    vendaBr = retorno["BRL"]["sell"];
    lastBr = retorno["BRL"]["last"];
    compraJP = retorno["JPY"]["buy"];
    vendaJP = retorno["JPY"]["sell"];
    lastJp = retorno["JPY"]["last"];
    compraUs = retorno["USD"]["buy"];
    vendaUs = retorno["USD"]["sell"];
    lastUs = retorno["USD"]["last"];
    compraCN = retorno["CNY"]["buy"];
    vendaCN = retorno["CNY"]["sell"];
    lastCN = retorno["CNY"]["last"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white54,
        appBar: AppBar(
          backgroundColor: Colors.white54,
          centerTitle: true,
          title: Text(
            ' ',
            style: TextStyle(color: Colors.black45),
          ),
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              bitCoin;
            },
            child: Icon(Icons.menu),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(20),
                    ),
                    color: Colors.black45),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'PortFoil',
                      style: TextStyle(color: Colors.white60, fontSize: 15),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Today',
                          style: TextStyle(color: Colors.white70, fontSize: 40),
                        ),
                        AnimatedRotation(
                          turns: turn,
                          duration: Duration(seconds: 1),
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors
                                  .transparent, // Torna o fundo transparente
                              shadowColor:
                                  Colors.transparent, // Remove a sombra
                            ),
                            onPressed: () {
                              bitCoin();
                              setState(() {
                                turn += 1;
                              });
                            },
                            label: Icon(
                              Icons.refresh,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Valores Bitcoin',
                      style: TextStyle(color: Colors.white54, fontSize: 20),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 170,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          bitvalue(" BR", compraBr, vendaBr, lastBr),
                          bitvalue(" JP", compraJP, vendaJP, lastJp),
                          bitvalue(" US", compraUs, vendaUs, lastUs),
                          bitvalue(" CN", compraCN, vendaCN, lastCN),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget bitvalue(
      String sigla, double valorVenda, double ValorCompra, double last) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        margin: EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Bitcoin' + sigla,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white60,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    Icons.circle,
                    color: Colors.green,
                    size: 15,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.monetization_on_outlined,
                  color: Colors.white60,
                  size: 30,
                ),
                Text(
                  valorVenda.toString(),
                  style: TextStyle(
                    color: Colors.white60,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.currency_bitcoin_outlined,
                  color: Colors.white60,
                  size: 30,
                ),
                Text(
                  ValorCompra.toString(),
                  style: TextStyle(
                    color: Colors.white60,
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Last',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white60,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    last.toString(),
                    style: TextStyle(
                      color: Colors.white60,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
