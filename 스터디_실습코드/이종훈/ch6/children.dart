import 'package:flutter/material.dart';

void main(){
	runapp(
		MaterialApp(
			debugShowCheckedModeBanner: false,
			home: Scaffold(
				body: SizedBox(
					width: double.infinity,
					child: Column(
						mainAxisAlignment: MainAxisAlignment.center,
						children: [
							Text('Flutter'),
							Text('Love'),
						],
					),
				),
			),
		),
	);
}