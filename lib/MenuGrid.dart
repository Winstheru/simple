import 'package:flutter/material.dart';

class SingleMenuGrid extends StatefulWidget {
  SingleMenuGrid(
      {Key key,
      @required this.warna,
      @required this.namaItem,
      @required this.harga,
      this.umur})
      : assert(warna != null),
        assert(namaItem != null),
        assert(harga != null),
        assert(umur != null);
  final Color warna;
  final String namaItem;
  final harga;
  final umur;

  @override
  _SingleMenuGridState createState() => _SingleMenuGridState();
}

class _SingleMenuGridState extends State<SingleMenuGrid> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          // counterBloc.dispatch(CounterEvent.increment);
        },
        child: Container(
          color: widget.warna,
          width: 30,
          height: 30,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                widget.namaItem,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              Text(widget.umur.toString(), style: TextStyle(color: Colors.white, fontSize: 18),),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.harga,
                style: TextStyle(
                    color: Colors.orange,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
