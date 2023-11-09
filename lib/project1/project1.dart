import 'package:flutter/material.dart';
import 'package:practice/project1/result.dart';
import 'package:shared_preferences/shared_preferences.dart';

class project1 extends StatefulWidget {
  const project1({super.key});

  @override
  State<project1> createState() => _project1State();
}

class _project1State extends State<project1> {

  @override
  void dispose() {


    // TODO: implement dispose
    super.dispose();
  }

  Future save() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('height', 1.5);
    await prefs.setDouble('weight', 1.5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("비만도 계산기"),
        ),
        body: Padding(
          // 패딩은 이렇게 줍니다.
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: Column(
              // 정렬 방향 조정
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "키",
                   ),
                  //keyboardType으로 키보드를 뭘로 지정할껀지 가능
                  keyboardType: TextInputType.number,
                ),
                // 빈 공간은 SizeBox로 처리한다.
                const SizedBox(height: 8,),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "몸무게",
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 8,),
                ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                        MaterialPageRoute(builder: (context) => const Resultscreen(
                            height: 180,
                            weight: 77.5
                        ),)
                    );
                  },
                  child: Text('결과'),
                ),
              ],
            ),
          ),
        )

    );
  }
}
