// Imports
part of dashboard;

class _Header extends StatefulWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  State<_Header> createState() => _HeaderState();
}

class _HeaderState extends State<_Header> {
  NumberInfo _numberResult = NumberInfo();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [Expanded(child: SearchField(onSearch: onSearch))],
        ),
        const SizedBox(height: 20),
        ContactCard(numberInfo: _numberResult),
        if (_isLoading) ContactCardLoader()
      ],
    );
  }

  onSearch(value) async {
    try {
      if (sessionId == null) return {};
      await FirebaseService.update(
          {"enc": CryptService.encrypt(value), "result": null},
          "Incoming",
          sessionId!);

      _isLoading = true;
      setState(() {});
    } catch (error) {
      print(error);
    }
  }
}
