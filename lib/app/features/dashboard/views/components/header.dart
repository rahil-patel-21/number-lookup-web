// Imports
part of dashboard;

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: SearchField(
              onSearch: onSearch,
            )),
          ],
        ),
        const SizedBox(height: 20),
        const ContactCard()
      ],
    );
  }

  onSearch(value) async {
    try {
      final url = '${Network.searchNumber}$value';
      final dio = Dio();
      final response = await dio.get(url);
      print(response);
    } catch (error) {}
  }
}
