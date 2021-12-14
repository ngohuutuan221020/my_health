import 'dart:math';

class BmiLogic {
  BmiLogic({required this.height, required this.weight, this.bmi});

  final int height;
  final int weight;

  double? bmi;

  String calculateBMI() {
    bmi = (weight / pow(height / 100, 2));
    return bmi!.toStringAsFixed(1);
  }

  String getResult() {
    if (bmi! >= 25) {
      return 'NGƯỜI THỪA CÂN';
    } else if (bmi! > 18.5) {
      return 'NGƯỜI BÌNH THƯỜNG';
    } else {
      return 'NGƯỜI THIẾU CÂN';
    }
  }

  String getInterpretation() {
    if (bmi! >= 25) {
      return 'Hì ! bạn hơi "dư" cân 1 tí đấy nhé !\n'
          'Nên sớm thực hiện các biện pháp giảm cân, tránh thức khuya, ăn khuya để hạn chế tăng lượng mỡ thừa, ngoài ra bơi lội , gym ở thời điểm này sẽ rất tốt cho bạn đấy !\n'
          'Đừng để trở thành "Chàng béo" ... lúc đó sẽ rất khó giảm cân !\n'
          ' 💪🚵🚴🏊🏇🏃';
    } else if (bmi! >= 18.5) {
      return 'Wow !\n Bạn có một chỉ số BMI khá ổn định !\n'
          'Tập thể thao đều đặn , ăn uống hợp lý, phòng tránh bệnh tật để giữ vững chỉ số này bạn nhé !\n 🍇🍉🍍🍒🌽 \n'
          'Chúc bạn luôn mạnh khỏe !';
    } else {
      return 'Chào anh chàng thiếu cân!\n'
          'Bạn nên tập trung chế dộ ăn uống đầy đủ dinh dưỡng , và chế dộ ngủ , nghỉ ngơi hợp lý để nhanh chóng tăng cân đạt chuẩn nhé.!\n'
          'Các cô gái cũng không thích những chàng nhẹ cân đâu !\n 🍲🍱🍳🍗🍒🍎';
    }
  }
}