part of '../../rooms_feature.dart';

class RoomsScreen extends StatelessWidget {
  const RoomsScreen({
    Key? key,
    required this.rooms,
    required this.onRoomTap,
    required this.onCreateRoomTap,
  }) : super(key: key);

  final List<Room> rooms;
  final Function(String) onRoomTap;
  final Function(String) onCreateRoomTap;

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
            return _RoomItem(
              name: rooms[index].name,
              onRoomTap: onRoomTap,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return NewRoomDialog(onCreateRoomTap: onCreateRoomTap);
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _RoomItem extends StatelessWidget {
  const _RoomItem({
    Key? key,
    required this.name,
    required this.onRoomTap,
  }) : super(key: key);

  final String name;
  final Function(String) onRoomTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: GestureDetector(
        onTap: () {
          onRoomTap(name);
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(8)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Icon(Icons.arrow_forward),
            ],
          ),
        ),
      ),
    );
  }
}
