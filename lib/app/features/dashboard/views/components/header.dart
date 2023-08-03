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
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    _listenForChanges();
  }

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
      await FirebaseService.update({
        "enc": CryptService.encrypt(value),
        "result": null,
        "createdAt": DateTime.now(),
        "frontend": true,
        "backend": false
      }, "Incoming", sessionId!);

      _isLoading = true;
      _numberResult = NumberInfo();
      setState(() {});
    } catch (error) {
      print(error);
    }
  }

  _listenForChanges() async {
    try {
      if (_isListening) return {};
      final docRef = db.collection("Incoming").doc(sessionId);
      docRef.snapshots().listen((event) {
        if (event.data() != null) {
          if (event.data()['result'] != null) {
            dynamic response = CryptService.decrypt(event.data()['result']);
            response = jsonDecode(response);
            _numberResult.name = response['name'];
            _numberResult.carrier = response['carrier'];
            _isLoading = false;
            setState(() {});
          }
        }
      });
      _isListening = true;
    } catch (error) {
      print(error);
    }
  }
}
