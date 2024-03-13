Fitur challenge yang dikerjakan adalah:
- Sprinting:
    Dikerjakan dengan cara eksplorasi mandiri, dimana saya menambahkan pengecekan input dan input baru yang bernama ("ui_sprint"), dimana saya mengubah default speed menjadi 600 jika player menekan tombol SHIFT.

- Double jump
    Dikerjakan dengan cara eksplorasi mandiri, dengan memperluas mekanisme jump yang telah diberikan di tutorial. Saya memodifikasi mekanisme jump, yaitu setelah player menekan jump maka player memiliki flag canDoubleJump menjadi true. Selanjutnya, saya menambahkan pemeriksaan input yaitu memeriksa apakah velocity.y sudah berkurang (agar jika player menahan SPACE, tidak akan langsung double jump), dan apakah flag canDoubleJump sudah bernilai true. Setelah melakukan double jump, maka flag canDoubleJump akan kembali menjadi false.

- Crouching
    Dikerjakan dengan eksplorasi mandiri dan bantuan materi dari YouTube, dimana saya mencari cara untuk memperkecil skala sprite player serta hitbox player. Selain memperkecil ukuran, ketika player menekan tombol S atau CTRL, maka speed dari player akan menjadi lambat.

- Dashing
    Ini mekanisme yang menurut saya paling susah diantara mekanisme lainnya. Saya memerlukan banyak referensi seperti dari https://godotforums.org/d/35106-is-there-a-simple-solution-for-a-double-tap dan https://www.reddit.com/r/godot/comments/18z1a11/how_to_implement_a_double_click_player_dash/ namun karena banyak dari referensi yang saya baca tidak sesuai dengan keinginan saya, maka saya improvisasi dengan mengambil inti dari mekanisme dari yang saya dapatkan, dan membuat logic sendiri. Mekanisme yang saya implement adalah membuat fungsi baru yaitu can_dash(), yang memeriksa apakah waktu "last_movement_input_time" kurang dari 7 dan lebih dari 1. Hal ini dilakukan untuk menghindari dash secara tidak sengaja jika player menahan tombol A atau D, dan agar timeframe dari dash menjadi kecil (player harus menekan A atau D dengan cepat). Setiap saat player menekan A atau D (movement left atau right), maka akan diperiksa apakah player dapat dash, dengan fungsi can_dash() dan apakah dash_timeout bernilai 100. Dash_timeout berguna untuk menghindari penggunaan dash secara berkali-kali. Dash_timeout juga diupdate secara berkala pada _physics_process() agar setiap kali player melakukan dash, maka akan dihitung kapan player dapat melakukan dash lagi.


Pengerjaan tutorial 5:
Pada tutorial ini, telah ditambahkan fitur-fitur berikut pada level yang telah dibuat pada tutorial 3:
- Karakter baru
    karakter ini diambil dari karakter utama yang ada di game individu saya. Animasi yang diimplementasi adalah jalan ke kiri, jalan ke kanan, dan idle.

- Menambahkan SFX baru
    SFX yang ditambahkan adalah saat kita terjun ke jurang. Akan ada SFX jika kita terdeteksi melewati Area2D yang ada di bawah map. Jika player melewati Area2D tersebut, maka SFX akan dimainkan.

- Menambahkan BGM (background music)
    Untuk menambahkan BGM, harus dijadikan menjadi child dari player, karena posisi dari AudioStreamPlayer2D memengaruhi sumber suara yang ada. Maka diperlukan posisi yang relatif sama dengan player agar akan selalu terdengar. BGM diambil dari https://www.youtube.com/watch?v=mRN_T6JkH-c&list=PLwJjxqYuirCLkq42mGw4XKGQlpZSfxsYd yang bersifat no copyright.

- Menambahkan interaksi baru
    Interaksi baru yang ditambahkan adalah koin. Sprite dari koin diambil dari sprite original buatan saya sendiri untuk game individu. Jika koin diambil, maka akan ada sound effect mengambil koin, dan koin akan hilang dari map.

- Menambahkan easter egg
    Terdapat easter egg di akhir level yang memanfaatkan positioning AudioStreamPlayer2D. Semakin dekat dengan easter egg, maka player akan semakin mendengar audio yang ada pada easter egg tersebut.