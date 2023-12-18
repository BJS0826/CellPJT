import 'package:flutter/material.dart';

class PostFeedPage extends StatefulWidget {
  @override
  _PostFeedPageState createState() => _PostFeedPageState();
}

class _PostFeedPageState extends State<PostFeedPage> {
  List<String> meetingList = ['독서 모임', '운동 모임', '찬양 집회']; // 예시 정모 목록

  String selectedMeeting = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          padding: EdgeInsets.only(top: 20),
        ),
        title: Padding(
          padding: EdgeInsets.only(top: 18.0, right: 20.0),
          child: Row(
            children: [
              SizedBox(width: 8.0),
              const Text('피드 작성'),
            ],
          ),
        ),
        titleSpacing: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(20.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.withOpacity(0.2),
                  width: 2.0,
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // 1. '정모 선택' 열
          ListTile(
            title: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                '정모 선택',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          // 2. '피드를 남기고자 하는 정모를 선택하세요.' 텍스트
          ListTile(
            title: Container(
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.only(
                left: 8.0,
                right: 8.0,
                top: 4.0,
                bottom: 4.0,
              ),
              child: Text(
                '피드를 남기고자 하는 정모를 선택하세요.',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          // 3. 정모 선택을 위한 리스트뷰
          _buildMeetingListView(),

          // 4. '사진 첨부' 열
          ListTile(
            title: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                '사진 첨부',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          // 5. '사진을 선택하세요.' 텍스트
          ListTile(
            title: Container(
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.only(
                left: 8.0,
                right: 8.0,
                top: 4.0,
                bottom: 4.0,
              ),
              child: Text(
                '사진을 선택하세요.',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          // 6. '피드 내용' 열
          ListTile(
            title: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                '피드 내용',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          // 7. '내용을 작성하세요.' 텍스트 필드
          Container(
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.only(
              left: 8.0,
              right: 8.0,
              top: 4.0,
              bottom: 4.0,
            ),
            child: TextFormField(
              maxLines: null, // 세로로 길어질 수 있도록
              decoration: InputDecoration(
                hintText: '내용을 작성하세요.',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),

          // 8. '피드 올리기' 버튼
          _buildRoundedButton(context),
        ],
      ),
    );
  }

  Widget _buildMeetingListView() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: meetingList
            .map(
              (meeting) => RadioListTile(
                title: Text(meeting),
                value: meeting,
                groupValue: selectedMeeting,
                onChanged: (value) {
                  setState(() {
                    selectedMeeting = value as String;
                  });
                },
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildRoundedButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // 피드 올리기 버튼을 눌렀을 때의 로직을 추가하세요.
      },
      style: ElevatedButton.styleFrom(
        primary: Color(0xFFFF6F61), // 코랄 핑크 색상
        onPrimary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        minimumSize: Size(double.infinity, 40), // 가로로 꽉 차게 설정
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          '피드 올리기',
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
