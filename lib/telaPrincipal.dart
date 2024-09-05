import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Telaprincipal extends StatefulWidget {
  const Telaprincipal({super.key});

  @override
  State<Telaprincipal> createState() => _TelaprincipalState();
}

class _TelaprincipalState extends State<Telaprincipal> {
  bitCoin() async {
    String url = 'https://blockchain.info/ticker',
    http.Response response = await http.get(uri.parse(url));

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
            onTap: () {},
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
                        Icon(
                          Icons.refresh,
                          color: Colors.white70,
                        )
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
                          bitvalue(),
                          bitvalue(),
                          bitvalue(),
                          bitvalue(),
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

  Widget bitvalue() {
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
                    'Bitcoin',
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
                  '3238,00',
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
                  '3238,00',
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
                    '3238,00',
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
