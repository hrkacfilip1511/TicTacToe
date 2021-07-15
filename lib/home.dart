import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<List> _matrix;
  _HomeState() {
 _newGameMatrix(); //Methoda koja nakon zavrsetka partije pokrece New Game
  }
  _newGameMatrix() {
    _matrix = List<List>(3); // 3 Rows
    for(var i=0 ; i<_matrix.length; i++){
      _matrix[i] = List(3);
      for(var j=0 ; j<_matrix.length; j++){
        _matrix[i][j] = ' ';

      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min, //Na sredinu stranice da bude
              children: <Widget>[
                _buildElement(0, 0),
                _buildElement(0, 1),
                _buildElement(0, 2),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _buildElement(1, 0),
                _buildElement(1, 1),
                _buildElement(1, 2),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _buildElement(2, 0),
                _buildElement(2, 1),
                _buildElement(2, 2),
              ],
            ),
          ],
        ),
      ),
    );
  }
  String _lastChar = 'o';
  _buildElement(int i, int j) {
    return GestureDetector(
      onTap: () {
      _changeMatrixField(i, j); //Metoda promjene igraca/polja
      _checkWinner(i, j); //Metoda odredjivanja pobjednika
      },
   child: Container(
     width: 90.0,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(
          color: Colors.black,
        ),

      ),
      child: Center(
        child: Text(
          _matrix[i][j],
        style: TextStyle(
          fontSize: 92.0,
        ),
        ),
      ),
    ),
    );
  }
  _changeMatrixField(int i, int j) {
    setState(() {
      if(_matrix[i][j]== ' ') { //Ovaj if nam sluzi ako kliknemo na jedno polje ne mozemo vise mijenjati isto to polje
        if (_lastChar == 'o')
          _matrix[i][j] = 'x';
        else
          _matrix[i][j] = 'o';
       _lastChar = _matrix[i][j]; //bez ovoga nam samo X pokazuje
      }

    });

  }
  _checkWinner(int x, int y) {
    var col = 0, row = 0, diag = 0, rdiag = 0;
    var n = _matrix.length-1;
    var player = _matrix[x][y];
    for(int i = 0; i<_matrix.length; i++){
      if(_matrix[x][i] == player){
        col++;
      }
      if(_matrix[i][y] == player){
        row++;
      }
      if(_matrix[i][i] == player){
        diag++;
      }
      if(_matrix[i][n-1] == player){
        rdiag++;
      }
      if(row == n+1 || col == n+1 || diag == n+1 || rdiag == n+1){
        print('$player won');
        _newGameMatrix();

      }
    }
  }
}
