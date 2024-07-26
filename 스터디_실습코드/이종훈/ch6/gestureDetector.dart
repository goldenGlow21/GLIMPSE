GestureDetector(
	onTap: (){
		print('on tap: ');
	},
	onDoubleTap: (){
		print('on double tap: ');
	},
	onLongPress: (){
		print('on long press: ');
	},
	child: Container(
		decoration: BoxDecoration(
			color: Colors.red,
		),
		width: 100.0,
		height: 100.0,
	),
)