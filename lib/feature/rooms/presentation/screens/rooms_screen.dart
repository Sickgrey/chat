part of '../../rooms_feature.dart';

class RoomsScreen extends StatelessWidget {
  const RoomsScreen({Key? key, required this.rooms}) : super(key: key);

  final List<Room> rooms;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Комнаты'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: ListView.builder(
          itemCount: rooms.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(rooms[index].name),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
