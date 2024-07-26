enum Status {
 approved,
 pending,
 rejected,
}

void main() {
 Status status = Status.approved;

 switch (status) {
  case Status.approved:
   print('승인 상태');
   break;
  case Status.pending:
   print('대기 상태');
   break;
  case Status.rejected:
   print('거절 상태');
   break;
  default:
   print('알 수 없는 상태');
 }

 // Enum의 values값은 Enum의 모든 수를 리스트로 반환
 print(Status.values);
}