import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  final List<String> _tabs = ['Posts', 'Recipes', 'Following'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildPostCard(String title, String description, String author, String date) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=3'),
                  radius: 16,
                ),
                SizedBox(width: 8),
                Text(author, style: TextStyle(fontWeight: FontWeight.bold)),
                Spacer(),
                Text(date, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
              ],
            ),
            SizedBox(height: 8),
            Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(height: 4),
            Text(description, maxLines: 2, overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }

  Widget _buildRecipeCard(String title, String description, String author, String date) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: List.generate(5, (index) => Icon(Icons.star_border, color: Colors.grey)),
            ),
            SizedBox(height: 8),
            Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(height: 4),
            Text(description, maxLines: 2, overflow: TextOverflow.ellipsis),
            SizedBox(height: 8),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=3'),
                  radius: 16,
                ),
                SizedBox(width: 8),
                Text(author, style: TextStyle(fontWeight: FontWeight.bold)),
                Spacer(),
                Text(date, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPostsTab() {
    return ListView(
      children: [
        _buildPostCard(
          'Cơm chiên sting',
          'Món ăn với màu đỏ đặc trưng, chứa nhiều năng lượng, và rất ngon...',
          'Lmao',
          '21/5/2025',
        ),
        _buildPostCard(
          'Mì xào ớt',
          'Với nhiều loại ớt đặc sắc, siêu cay, tạo nên sự hấp dẫn của món mì...',
          'Bruh',
          '21/5/2025',
        ),
      ],
    );
  }

  Widget _buildRecipesTab() {
    return ListView(
      children: [
        _buildRecipeCard(
          'Cơm chiên sting',
          'Món ăn với màu đỏ đặc trưng, chứa nhiều năng lượng, và rất ngon...',
          'Lmao',
          '21/5/2025',
        ),
        _buildRecipeCard(
          'Mì xào ớt',
          'Với nhiều loại ớt đặc sắc, siêu cay, tạo nên sự hấp dẫn của món mì...',
          'Bruh',
          '21/5/2025',
        ),
      ],
    );
  }

  Widget _buildFollowingTab() {
    return Center(
      child: Text('Following content here'),
    );
  }

  void _onBottomNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      _tabController.animateTo(0);
    } else if (index == 1) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Notifications tapped')));
    } else if (index == 2) {
      Navigator.pushNamed(context, '/profile');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trending posts', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.red,
            tabs: _tabs.map((tab) => Tab(text: tab)).toList(),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildPostsTab(),
                _buildRecipesTab(),
                _buildFollowingTab(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onBottomNavTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}
