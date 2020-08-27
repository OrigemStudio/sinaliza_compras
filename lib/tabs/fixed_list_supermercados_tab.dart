import 'package:flutter/material.dart';

class FixedListSupermercadosTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height *2,
      width: MediaQuery.of(context).size.width *3,
      child: Center(
        child: Text('Supermercados',
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
