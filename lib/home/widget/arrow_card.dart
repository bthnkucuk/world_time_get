part of "../view/home_view.dart";

class ArrowCard extends StatelessWidget {
  final String? title;
  const ArrowCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Align(
            child: Padding(
              padding: const EdgeInsets.only(right: 15, left: 15),
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text(title ?? "", style: Theme.of(context).textTheme.headline5),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(top: 15),
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).appBarTheme.backgroundColor,
                border: Border.all(color: Theme.of(context).backgroundColor, width: 3),
              ),
              child: const Icon(Icons.chevron_right),
            ),
          ),
        ],
      ),
    );
  }
}
