import 'models.dart';

final User userMe = User(
  name: const Name(first: 'Julita', last: ''),
  avatarUrl: 'assets/images/avatar_1.png',
  lastActive: DateTime.now(),
);
final User userA = User(
  name: const Name(first: 'pakwidi ', last: 'Arrohman'),
  avatarUrl: 'assets/images/avatar_2.png',
  lastActive: DateTime.now().subtract(const Duration(minutes: 10)),
);
final User userB = User(
  name: const Name(first: 'Indra', last: 'Pratiwi'),
  avatarUrl: 'assets/images/avatar_3.png',
  lastActive: DateTime.now().subtract(const Duration(hours: 1)),
);
final User userC = User(
  name: const Name(first: 'Taylor', last: 'Smith'),
  avatarUrl: 'assets/images/avatar_4.png',
  lastActive: DateTime.now().subtract(const Duration(days: 1)),
);
final User userD = User(
  name: const Name(first: 'Julita', last: 'Signature'),
  avatarUrl: 'assets/images/avatar_5.png',
  lastActive: DateTime.now().subtract(const Duration(days: 1)),
);
final User userE = User(
  name: const Name(first: 'Sam', last: 'Wilson'),
  avatarUrl: 'assets/images/avatar_6.png',
  lastActive: DateTime.now().subtract(const Duration(hours: 1)),
);

final List<Email> emails = [
  Email(
    sender: userA,
    recipients: [userMe],
    subject: 'Welcome to Flutter',
    content: 'Assalamualaikum, selamat malam. Pengujian UAS akan saya lakukan offline di kampus. Saya pulang ke Ketapang besok. Tempat dan waktu kuliah, akan saya infokan kembali.',
    replies: 1,
    attachments: [
      Attachment(url: 'assets/images/thumbnail_1.png'),
    ],
  ),
  Email(
    sender: userB,
    recipients: [userMe],
    subject: 'Animated Responsive Layout',
    content: 'Kalau begitu biar materinya enggak terlalu jauh dengan kelas sebelah, untuk pertemuan kali ini kalian belakar mandiri.mohon bagi kalian yg belum paham materi passive, advice, condition al (yg merupakan bagian dr listening) tanya pada yg paham.',
    replies: 2,
  ),
  Email(
    sender: userC,
    recipients: [userMe],
    subject: 'UAS Flutter',
    content: 'Pastikan project sesuai dengan codelab.',
    replies: 0,
  ),
  Email(
    sender: userD,
    recipients: [userMe],
    subject: 'Ujian Akhir Semester PPB 1',
    content: 'Let’s learn responsive layout in Flutter.',
    replies: 2,
  ),
   Email(
    sender: userE,
    recipients: [userMe],
    subject: 'algoritma pemograman',
    content: 'Besok kita ada uas algoritma pemograman.',
    replies: 2,
  ),
];
