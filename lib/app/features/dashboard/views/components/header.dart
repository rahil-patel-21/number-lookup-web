// Imports
part of dashboard;

class _Header extends StatefulWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  State<_Header> createState() => _HeaderState();
}

class _HeaderState extends State<_Header> {
  NumberInfo _numberResult = NumberInfo();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [Expanded(child: SearchField(onSearch: onSearch))],
        ),
        const SizedBox(height: 20),
        ContactCard(numberInfo: _numberResult)
      ],
    );
  }

  onSearch(value) async {
    try {
      if (sessionId == null) return {};
      await FirebaseService.update(
          {"enc": CryptService.encrypt(value)}, "Incoming", sessionId!);
      // final url = '${Network.searchNumber}$value';
      // final dio = Dio();
      // final response = await dio.get(url);
      // if (response.data != null) {
      //   if (response.data['data'] != null) {
      //     final numberInfo = NumberInfo();
      //     numberInfo.name = response.data['data']['name'];
      //     numberInfo.address = response.data['data']['address'];
      //     numberInfo.carrier = response.data['data']['carrier'];
      //     numberInfo.number = response.data['data']['number'];
      //     _numberResult = numberInfo;
      //     setState(() {});
      //   }
      // }
    } catch (error) {
      print(error);
    }
  }
}
