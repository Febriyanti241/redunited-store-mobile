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






TUGAS INDIVIDU 9
1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?
Jawab: Penggunaan Model Dart penting karena memberikan stabilitas kode melalui type safety dan sound null safety. Dengan model yang terdefinisi jelas, kesalahan tipe data atau nilai null dapat terdeteksi saat compile-time sehingga tidak menimbulkan crash di runtime. Jika hanya mengandalkan Map<String, dynamic>, seluruh data menjadi dynamic sehingga membutuhkan casting manual yang rawan menimbulkan TypeError. Null safety juga menjadi lemah karena analyzer tidak dapat memastikan apakah nilai yang diakses valid atau tidak. Dari sisi maintainability, perubahan struktur API sulit terdeteksi dan berpotensi menyebabkan error tersembunyi. Secara keseluruhan, penggunaan Model Dart membuat kode lebih aman, terstruktur, dan mudah dikelola, khususnya pada proyek berskala menengah hingga besar.

2. Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.
Jawab: Paket http berfungsi sebagai dasar untuk melakukan permintaan jaringan yang bersifat stateless, seperti GET atau POST sederhana tanpa perlu menyimpan sesi. Setiap permintaan melalui http berdiri sendiri sehingga tidak menyimpan atau mengelola session cookie. Sebaliknya, CookieRequest adalah klien stateful yang dirancang untuk menyimpan dan mengelola session cookie dari Django, sehingga status login bisa dipertahankan antar-permintaan. CookieRequest secara otomatis menangkap cookie dari server dan menyertakannya kembali saat mengakses endpoint yang membutuhkan autentikasi. Dalam Flutter, instance CookieRequest biasanya dibagikan melalui Provider agar seluruh bagian aplikasi menggunakan sesi yang sama. Secara ringkas, http digunakan untuk permintaan umum, sedangkan CookieRequest digunakan untuk operasi yang membutuhkan sesi login yang berkelanjutan.

3. Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
Jawab: Satu instance CookieRequest perlu dibagikan ke seluruh aplikasi agar status sesi pengguna tetap konsisten. Setelah login, CookieRequest menyimpan session cookie dari Django dan secara otomatis mengirimkannya kembali pada setiap permintaan ke endpoint yang membutuhkan autentikasi. Jika setiap widget membuat instance baru, cookie jar akan hilang dan permintaan terautentikasi akan gagal karena dianggap tidak memiliki sesi. Selain itu, penggunaan satu instance juga meningkatkan efisiensi jaringan karena memungkinkan connection pooling, sehingga koneksi ke server dapat digunakan kembali tanpa membuat socket baru setiap kali. Dalam Flutter, CookieRequest biasanya disediakan lewat Provider pada root aplikasi agar seluruh widget dapat mengakses instance yang sama. Dengan cara ini, aplikasi menjaga sesi tetap stabil sekaligus mengoptimalkan performa jaringan.

4. Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?
Jawab: Untuk menghubungkan Flutter (terutama di Android Emulator) dengan backend Django, pastikan menggunakan alamat http://10.0.2.2:<port> dan menambahkan 10.0.2.2 ke ALLOWED_HOSTS agar Django menerima request dari emulator. Aktifkan CORS (mis. dengan django-cors-headers) supaya klien (termasuk versi web) tidak diblokir oleh kebijakan cross-origin. Karena Django memakai sesi berbasis cookie, atur SESSION_COOKIE_SAMESITE = 'None' dan CSRF_COOKIE_SAMESITE = 'None' serta tandai cookie sebagai secure (*_SECURE = True) agar cookie dikirimkan lintas-origin dalam pengembangan yang membutuhkan relaksasi SameSite. Penting juga menggunakan satu instance CookieRequest yang dibagikan agar session cookie dipertahankan dan koneksi dapat di-reuse untuk efisiensi; jika tidak, permintaan terautentikasi akan gagal. Terakhir, jangan lupa menambahkan permission <uses-permission android:name="android.permission.INTERNET" /> di AndroidManifest supaya aplikasi bisa melakukan koneksi jaringan; tanpa itu semua koneksi akan diblokir oleh OS.

5. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
Jawab: Alur pengiriman data antara Flutter dan Django dimulai ketika pengguna mengisi formulir di Flutter, lalu data tersebut divalidasi dan diserialisasi menjadi JSON sebelum dikirim lewat permintaan HTTP asinkron menggunakan CookieRequest. Setelah permintaan sampai di Django, server memeriksa session cookie untuk autentikasi, mendeserialisasi JSON yang diterima, kemudian melakukan validasi bisnis dan menyimpan data ke database. Django kemudian mengirimkan respons dalam bentuk JsonResponse berisi status atau data yang telah diproses. Flutter menerima respons ini, mengecek kode status, lalu mendekode JSON kembali menjadi Dart Model agar tipe datanya tetap aman dan konsisten. Data tersebut kemudian dimasukkan ke state aplikasi dan ditampilkan melalui widget seperti FutureBuilder atau ListView.builder. Dengan mekanisme ini, data bergerak mulus dari input pengguna, diproses di server, lalu kembali ditampilkan secara terstruktur dan aman di UI Flutter.

6. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
Jawab: Mekanisme autentikasi pada integrasi Flutter–Django bekerja secara stateful dengan memanfaatkan session cookie yang dikelola Django dan disimpan oleh Flutter melalui instance CookieRequest. Instance ini harus dibagikan ke seluruh komponen aplikasi menggunakan Provider, karena ia menjadi satu-satunya objek yang menyimpan, mengirim, dan memperbarui cookie sesi pada setiap permintaan HTTP. Pada tahap registrasi, Flutter mengirimkan data akun dalam format JSON ke endpoint Django, yang kemudian memvalidasi data dan membuat akun baru menggunakan create_user(), sebelum mengembalikan respons sukses yang digunakan Flutter untuk menavigasi pengguna ke halaman login.

Pada proses login, Flutter mengirimkan kredensial ke server; Django memverifikasi kredensial tersebut dan membuat sesi baru melalui auth_login(), kemudian mengirimkan Set-Cookie berisi ID sesi. CookieRequest otomatis menyimpan cookie tersebut sehingga status autentikasi klien berubah menjadi loggedIn. Setelah sesi terbentuk, setiap permintaan selanjutnya yang dikirim melalui CookieRequest akan selalu menyertakan session cookie. Django Session Middleware kemudian memuat pengguna terkait melalui request.user, memungkinkan server mengotorisasi akses hanya kepada pengguna yang valid.

Selama pengguna dalam keadaan login, Flutter dapat mengambil atau mengirim data terproteksi, seperti daftar produk yang dimiliki pengguna, karena semua permintaan telah membawa sesi yang sah. Pada tahap logout, Flutter mengirimkan permintaan terminasi ke Django; server menjalankan auth_logout() untuk menghapus sesi, lalu CookieRequest membersihkan seluruh cookie lokalnya. Setelah respons diterima, UI Flutter menampilkan pesan keberhasilan dan mengarahkan pengguna kembali ke halaman login. Dengan mekanisme ini, autentikasi berjalan aman, konsisten, dan terkoordinasi antara state jaringan (session cookie) dan state aplikasi (UI Flutter).

7.  Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
Jawab: 

I. Pastikan server Django dijalankan, idealnya dengan perintah python manage.py runserver 0.0.0.0:8000, dan coba akses endpoint tersebut dengan sukses melalui peramban web di http://localhost:8000/json/ atau melalui Android Emulator menggunakan alamat http://10.0.2.2:8000/

II. Fitur registrasi diimplementasikan dengan membuat formulir di RegisterPage, mengumpulkan input username dan dua password, lalu mengirimkannya sebagai POST request JSON menggunakan instance CookieRequest ke endpoint /auth/register/ Django

III. Halaman login dibuat sebagai LoginPage yang memiliki dua TextField untuk username dan password, di mana tombol Login akan memanggil metode request.login() secara asinkron melalui instance CookieRequest yang dibagikan

IV. Integrasi dicapai dengan menggunakan klien HTTP stateful CookieRequest (dari pbp_django_auth) yang dibagikan melalui Provider di akar aplikasi, sehingga klien secara otomatis menyimpan session cookie dari Django setelah login dan menyertakannya di permintaan berikutnya

V. Model kustom dibuat sebagai class Dart yang kuat (strongly typed), seperti ProductEntry, dengan menyertakan metode fromJson() dan toJson() untuk mengonversi data JSON yang masuk atau keluar, yang dapat dihasilkan secara cepat menggunakan alat seperti Quicktype dari contoh data JSON Django

VI. Buat halaman (misalnya ProductEntryListPage) dengan widget FutureBuilder yang memanggil fungsi asinkron (fetchProduct) untuk mengambil data JSON dari endpoint, kemudian data yang telah di-deserialisasi menjadi List objek Model Dart akan ditampilkan menggunakan ListView.builder

VII. Data ditampilkan menggunakan widget ProductEntryCard di dalam ListView.builder, di mana setiap atribut (seperti name, price, category, dan thumbnail URL) diakses langsung dari objek Dart ProductEntry yang telah di-deserialisasi dari JSON. Thumbnail ditampilkan menggunakan widget Image.network yang memuat URL gambar melalui endpoint proxy Django

VIII. Halaman detail dibuat sebagai widget ProductDetailPage yang berfungsi sebagai container, yang memerlukan seluruh objek model ProductEntry sebagai parameter wajib melalui constructor untuk diakses dan ditampilkan isinya

IX. Halaman detail diakses dengan membungkus card item (yaitu ProductEntryCard) dalam widget InkWell yang memiliki fungsi onTap, dan di dalamnya menggunakan Navigator.push untuk berpindah ke ProductDetailPage sambil membawa objek ProductEntry yang diklik

X. Seluruh atribut ditampilkan dengan mengakses properti secara langsung dari objek ProductEntry yang diterima oleh ProductDetailPage melalui constructor (misalnya product.name atau product.description), yang kemudian disematkan dalam widget Text atau Image.network

XI. Tombol kembali (panah back) secara otomatis disediakan oleh Flutter pada AppBar karena navigasi ke halaman detail dilakukan menggunakan Navigator.push(), dan fungsinya adalah menghapus (pop) halaman detail dari stack navigasi.

XII. Filter dilakukan di sisi backend Django dengan memanggil endpoint khusus (seperti /json/my-products/) menggunakan klien sesi CookieRequest, di mana Django show_my_products_json secara internal memfilter produk berdasarkan user yang terasosiasi dengan session cookie yang dikirim