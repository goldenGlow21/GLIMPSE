class ScheduleModel {
  final String id;
  final String content;
  final DateTime date;
  final int startTime;
  final int endTime;

  ScheduleModel({
    required this.id,
    required this.content,
    required this.date,
    required this.startTime,
    required this.endTime,
  });

  ScheduleModel.fromJson({ // json 으로부터 모델을 만들어내는 생성자, 서버로부터 받은 json 데이터를 ScheduleModel로 매핑
    required Map<String, dynamic> json,
  })  : id = json['id'],
        content = json['content'],
        date = DateTime.parse(json['date']),
        startTime = json['startTime'],
        endTime = json['endTime'];

  Map<String, dynamic> toJson() { // 모델을 다시 json 으로 변환, 서버로 네트워크 요청을 보낼 때 json 형식으로 데이터를 변환해야 함
    return {
      'id': id,
      'content': content,
      'date':
          '${date.year}${date.month.toString().padLeft(2, '0')}${date.day.toString().padLeft(2, '0')}',
      'startTime': startTime,
      'endTime': endTime,
    };
  }

  ScheduleModel copyWith({ // 현재 모델을 특정 속성만 변환해서 새로 생성, 이미 존재하는 인스턴스에서 몇개의 값만 변경하고 싶을 때 사용
    String? id,
    String? content,
    DateTime? date,
    int? startTime,
    int? endTime,
  }) {
    return ScheduleModel(
      id: id ?? this.id,
      content: content ?? this.content,
      date: date ?? this.date,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }
}
