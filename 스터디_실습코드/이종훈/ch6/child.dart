import 'package:flutter/material.dart';

void main(){
	runapp(
		MaterialApp(
			home: Scaffold(
				body: Center(
					//하나의 위젯만 가운데 정렬 가능
					child: Text('I love Flutter!'),
				),
			),
		),
	);
}