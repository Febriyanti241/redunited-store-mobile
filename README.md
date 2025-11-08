# redunited_store

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



TUGAS INDIVIDU 7
1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
Jawab: Pada Flutter, seluruh tampilan aplikasi dibangun menggunakan widget, dan widget-widget tersebut tersusun dalam sebuah widget tree. Widget tree adalah struktur hierarki yang menggambarkan hubungan induk-anak antar widget. Setiap widget berada di dalam widget lainnya, sehingga parent menentukan tata letak dan aturan tampilannya, sedangkan child menampilkan konten di dalamnya. Misalnya, di aplikasi ini MaterialApp menjadi root widget, kemudian diikuti Scaffold yang membungkus AppBar serta SafeArea, lalu Column yang memuat widget-widget lain seperti Row, InfoCard, dan GridView yang berisi ItemCard. Hubungan ini membuat UI terstruktur dan mudah dikontrol.

2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
Jawab: Pada proyek ini terdapat berbagai widget penting. MaterialApp digunakan sebagai root aplikasi untuk menyediakan tema dan struktur dasar UI Material Design. Scaffold digunakan untuk menyediakan kerangka halaman dengan AppBar dan body. SafeArea melindungi konten agar tidak tertutup notch atau status bar. Layout diatur dengan Column, Row, Expanded, dan Padding, sedangkan Card dan Container digunakan untuk menampilkan informasi dalam bentuk kartu. GridView.count dipakai untuk menampilkan daftar menu berbentuk grid. Selain itu ada Text, Icon, Material, dan InkWell untuk menampilkan ikon, teks, dan memberikan efek sentuhan. Ketika card ditekan, SnackBar digunakan untuk menampilkan notifikasi kecil di bagian bawah layar.

3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root
Jawab: Widget MaterialApp memiliki peran penting karena digunakan sebagai widget root dan sering menjadi fondasi aplikasi Flutter. Widget ini mengatur tema, routing halaman, serta memastikan widget seperti Scaffold dan AppBar dapat berjalan sesuai desain Material Design. Karena itulah MaterialApp hampir selalu ditempatkan di bagian paling atas aplikasi.

4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
Jawab: Flutter memiliki dua tipe widget utama, yaitu StatelessWidget dan StatefulWidget. StatelessWidget digunakan ketika tampilan tidak memerlukan perubahan state selama aplikasi berjalan, dan kontennya hanya berdasarkan input awal. Sebaliknya, StatefulWidget digunakan ketika tampilan dapat berubah secara dinamis karena interaksi pengguna atau perubahan data. Dalam project ini, widget seperti MyHomePage, InfoCard, dan ItemCard dibuat sebagai StatelessWidget karena seluruh datanya statis dan tidak mengalami perubahan setelah ditampilkan. Jika suatu saat diperlukan perubahan data seperti counter, form, atau daftar produk dinamis, maka StatefulWidget lebih tepat digunakan.

5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
Jawab: BuildContext merupakan objek penting di Flutter yang memberikan informasi tentang posisi widget di dalam widget tree dan memungkinkan widget untuk mengakses resource dari ancestor-nya seperti tema, ukuran layar, navigator, atau Scaffold. Pada kode ini, BuildContext digunakan antara lain untuk mengakses tema aplikasi melalui Theme.of(context) dan untuk menampilkan snackbar lewat ScaffoldMessenger.of(context). Tanpa BuildContext, widget tidak bisa berkomunikasi dengan elemen UI lainnya dalam tree.

6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
Jawab: Flutter memiliki fitur hot reload dan hot restart untuk mempercepat pengembangan aplikasi. Hot reload memungkinkan perubahan kode segera terlihat tanpa menghapus state aplikasi. Ini sangat berguna ketika melakukan perubahan UI karena aplikasi tidak perlu dimulai ulang. Sedangkan hot restart akan memulai ulang aplikasi dari awal dan menghapus state yang sedang berjalan, sehingga digunakan ketika perubahan kode yang dibuat memengaruhi struktur atau inisialisasi aplikasi. Perbedaan ini membantu pengembang bekerja lebih efisien dalam proses development. Contoh kasusnya adalah ketika ingin mengubah warna/teks maka gunakan Hot Reload, dan jika ingin menambah variabel global baru maka gunakan Hot Start.


TUGAS INDIVIDU 8
1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
Jawab: Perbedaan keduanya terletak pada apa yang dilakukan kepada route yang berada pada atas stack. Dalam Flutter, Navigator.push() digunakan untuk menambahkan halaman baru di atas tumpukan (stack) halaman yang sedang aktif. Artinya, ketika pengguna menekan tombol back, mereka akan kembali ke halaman sebelumnya. Sebaliknya, Navigator.pushReplacement() digunakan untuk mengganti halaman yang sedang aktif dengan halaman baru, sehingga halaman sebelumnya dihapus dari stack dan tidak bisa kembali dengan tombol back. 

Pada football shop saya, push() cocok digunakan untuk icon item (create product, my product, dan all product) serta product detail. pushReplacement() cocok digunakan pada drawer, yaitu home dan create product yang berada di drawer. 

2.  Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
Jawab: Dalam aplikasi Flutter, hierarki widget membantu membangun struktur halaman yang konsisten dan mudah digunakan.
- Scaffold menjadi kerangka dasar setiap halaman, menyediakan struktur umum seperti body, AppBar, dan Drawer.

- AppBar digunakan untuk menampilkan judul halaman dan navigasi global seperti tombol kembali atau menu utama.

- Drawer berfungsi sebagai menu samping (sidebar) yang berisi tautan ke berbagai halaman dalam aplikasi, misalnya Home, Add Product, dan Product List.

Dengan memanfaatkan ketiganya, seluruh halaman pada aplikasi RedUnited Store memiliki tampilan dan navigasi yang seragam sehingga memudahkan pengguna berpindah antarhalaman tanpa kehilangan konteks.

3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
Jawab: Widget layout seperti Padding, SingleChildScrollView, dan ListView sangat penting untuk memastikan tampilan antarmuka tetap rapi dan responsif.
- Padding memberikan jarak antar elemen sehingga form terlihat lebih lega dan mudah dibaca.

- SingleChildScrollView memungkinkan pengguna menggulir halaman form yang panjang, agar tetap bisa diakses di layar kecil seperti ponsel.

- ListView cocok digunakan saat menampilkan daftar produk secara dinamis.

Sebagai contoh, pada halaman Create Product Form aplikasi RedUnited Store, SingleChildScrollView digunakan agar seluruh elemen form tetap bisa digulir saat keyboard muncul, dan setiap input field dibungkus dengan Padding agar tampil rapi dan nyaman di mata pengguna.

4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
Jawab: Untuk menjaga identitas visual yang konsisten, aplikasi Football Shop menggunakan warna tema utama (primary color) seperti indigo pada elemen-elemen penting, misalnya AppBar, tombol Simpan, dan header pada Drawer.
Penggunaan warna ini membantu memperkuat kesan profesional dan elegan sesuai dengan identitas brand toko. Selain itu, kombinasi warna putih untuk teks dan latar belakang yang bersih membuat aplikasi terasa modern dan mudah dibaca, menciptakan pengalaman pengguna yang nyaman sekaligus memperkuat citra toko secara visual.