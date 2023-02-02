part of 'login_bloc.dart';

class LoginState extends Equatable {
  final int count;
  const LoginState({this.count = 0}); //บังคับว่า ต้องใส่ count มา

  //หลักการของ state management คือ ไม่ยอมให้เปลี่ยนแปลงค่าโดยตรง
  //การเปลี่ยนแปลงค่าตัวแปร ต้องเป็น การสร้าง object ชุดใหม่ขึ้นมา โดยการ clone ชุดเก่า เพื่อ ป้องกันการ interfere
  //สมมุติ มีการ เปลี่ยนแปลงค่า arrays 1000 ตัว ขณะนั้น มี การลดจำนวน array เหลือ 100ตัว
  // หลักการคือ มันจะให้ render 1000 ตัวให้เสร็จก่อน  พอเสร็จแล้ว ค่ยอย render arrays ใหม่ 100ตัว อักครั้ง
  LoginState copyWith({int? count}) {
    //เป็น optional เพราะ บางที่ไม่อยากเปลี่ยนแปลงค่า อยากให้เป็นค่าเดิม  กรณีมีตัวหลายตัว ตัวแปร บางตัว ยังไม่อยากเปลี่ยนแปลงค่า
    return LoginState(
        count: count ??
            this.count); //ถ้าไม่มีค่า count ส่งมา ให้ใช้ ค่าเก่า (this.count)
  }

  @override
  List<Object?> get props =>
      [count]; //members ต้อง เป็น ตัวแปร ที่ เปลี่ยนแล้ว UI Update
}
