import 'package:flutter/material.dart';

class RecipeDetailScreen extends StatefulWidget {
  @override
  _RecipeDetailScreenState createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  bool isCookingMode = false;
  List<bool> stepCompleted = [true, true, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cơm chiên sting', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isCookingMode) ...[
              Text(
                'Chắc mọi người không còn xa lạ gì với sting, một thức uống quen thuộc của giới trẻ...\n'
                'Hôm nay mình xin chia sẻ công thức để nấu món cơm chiên kết hợp với loại đồ uống này. Một sự kết hợp độc đáo tạo nên một món ăn vô cùng kích thích và hấp dẫn! Tuyệt đối ẩm thực!!',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 12),
              Image.network(
                'https://i.ytimg.com/vi/7Q6q6v6v6v6/maxresdefault.jpg',
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 12),
              Text(
                'Nguyên liệu cần chuẩn bị:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 6),
              Text(
                '1. Một chai sting 470ml\n'
                '2. 1 bát cơm trắng\n'
                '3. Một thìa dầu ăn\n'
                '4. 2gram muối\n'
                '5. Một củ hành\n',
                style: TextStyle(fontSize: 14),
              ),
            ],
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isCookingMode = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isCookingMode ? Colors.grey[300] : Colors.purple,
                    foregroundColor: isCookingMode ? Colors.black : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text('Post Mode'),
                ),
                SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isCookingMode = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isCookingMode ? Colors.purple : Colors.grey[300],
                    foregroundColor: isCookingMode ? Colors.white : Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text('Cooking Mode'),
                ),
              ],
            ),
            SizedBox(height: 12),
            if (isCookingMode)
              Column(
                children: List.generate(4, (index) {
                  final steps = [
                    'Đổ dầu vào chảo, thái hành, đổ vào chảo xào tầm 2 phút...',
                    'Cho cơm vào chiên đều cùng với muối, đảo đều tầm 3 phút',
                    'Đổ chai sting vào chảo cơm, tiến hành đảo đều tầm 5 phút cho đến khi ráo nước...',
                    'Cẩn thận, bày cơm ra đĩa, hoàn thành!!',
                  ];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.purple[100],
                        child: Text('${index + 1}'),
                      ),
                      title: Text(
                        steps[index],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        index < 2
                            ? ''
                            : 'Additional icons or notes can be added here',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      trailing: Checkbox(
                        value: stepCompleted[index],
                        onChanged: (val) {
                          setState(() {
                            stepCompleted[index] = val ?? false;
                          });
                        },
                      ),
                    ),
                  );
                }),
              ),
          ],
        ),
      ),
    );
  }
}
