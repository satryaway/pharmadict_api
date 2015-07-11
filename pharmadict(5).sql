-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 11, 2015 at 12:20 PM
-- Server version: 5.1.41
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pharmadict`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `username` varchar(32) NOT NULL,
  `password` varchar(255) NOT NULL,
  `admin_nama` varchar(128) NOT NULL,
  `admin_email` varchar(128) NOT NULL,
  `admin_kontak` varchar(16) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`, `admin_nama`, `admin_email`, `admin_kontak`) VALUES
('admin', '21232f297a57a5a743894a0e4a801fc3', 'Admin', 'admin@admin.admin', '089696296962');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_obat`
--

CREATE TABLE IF NOT EXISTS `jenis_obat` (
  `obat_jenis` int(2) NOT NULL AUTO_INCREMENT,
  `obat_jenis_nama` varchar(32) NOT NULL,
  PRIMARY KEY (`obat_jenis`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `jenis_obat`
--

INSERT INTO `jenis_obat` (`obat_jenis`, `obat_jenis_nama`) VALUES
(1, 'Tablet'),
(2, 'Kapsul'),
(3, 'Sirup'),
(4, 'Puyer'),
(5, 'Krim'),
(6, 'Salep'),
(7, 'Minyak');

-- --------------------------------------------------------

--
-- Table structure for table `kode_obat`
--

CREATE TABLE IF NOT EXISTS `kode_obat` (
  `obat_kode` int(1) NOT NULL,
  `nama_obat_kode` varchar(16) NOT NULL,
  `warna_obat_kode` varchar(16) NOT NULL,
  PRIMARY KEY (`obat_kode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kode_obat`
--

INSERT INTO `kode_obat` (`obat_kode`, `nama_obat_kode`, `warna_obat_kode`) VALUES
(1, 'Ringan', 'Hijau'),
(2, 'Sedang', 'Biru'),
(3, 'Keras', 'Merah');

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE IF NOT EXISTS `obat` (
  `obat_id` int(11) NOT NULL AUTO_INCREMENT,
  `obat_nama` varchar(255) NOT NULL,
  `obat_deskripsi` text NOT NULL,
  `obat_indikasi` text NOT NULL,
  `obat_harga` varchar(32) NOT NULL,
  `obat_jenis` int(2) NOT NULL,
  `obat_pic` varchar(255) NOT NULL,
  `obat_efeksamping` text NOT NULL,
  `obat_dosis` text NOT NULL,
  `obat_perhatian` text NOT NULL,
  `obat_isi` varchar(32) NOT NULL,
  `obat_kode` int(1) NOT NULL,
  `username` varchar(32) NOT NULL,
  PRIMARY KEY (`obat_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=51 ;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`obat_id`, `obat_nama`, `obat_deskripsi`, `obat_indikasi`, `obat_harga`, `obat_jenis`, `obat_pic`, `obat_efeksamping`, `obat_dosis`, `obat_perhatian`, `obat_isi`, `obat_kode`, `username`) VALUES
(26, 'Gentasolon Cream', 'Fluocinolone acetonide 0.025%, gentamicin sulfate 0.1%', 'Pengobatan topikal dermatosis: dermatitis atopi terinfeksi, neurodermatitis, dermatitis seboroik, eksim, dermatitis kontak, dermatitis eksfoliatif, gatal pada bagian anogenital', '26500', 6, 'gentasolon.jpg', 'Kulit kering, pruritus, iritasi, rasa terbakar/perih, hiperkortisme (penggunaan jangka lama), gatal, folikulitis, hipertrikosis, hipopigmentasi, dermatitis perioral, erupsi seperti jerawat, dermatitis kontak dan alergik, kulit menjadi lunak dan tipis, inf', 'Oleskan 2-3 kali sehari', 'Tidak untuk profilaksis atau jangka panjang. Gejala timbul kembali jika terapi dihentikan tiba-tiba. Hindari penggunaan pada mata', '0', 3, ''),
(20, 'ceteme', 'Pertablet : Chlorpheniramini maleas 4 mg.\r\n', 'Untuk meringankan gejala alergi seperti pada rhinitis, urticaria, hayfever.', '5000', 1, 'ceteme.jpg', 'Mulut kering, mengantuk, pandangan kabur.', 'Diberikan sesudah makan.', 'Hipersensitif terhadap kandungan obat tersebut.', '12', 2, ''),
(21, 'Sanmol', 'Tiap 0.6 ml mengandung Paracetamol 60 mg (100 mg/ml) ', 'Untuk meringankan rasa sakit pada keadaan sakit kepala, sakit gigi, menurunkan demam yang menyertai influenza dan demam setelah imunisasi.', '18000', 3, 'sanmolsirup.jpg', '- Penggunaan jangka lama dan dosis besar dapat menyebabkan kerusakan hati.  - Reaksi hipersensitivitas.', 'Di bawah 1 tahun: 0.6 ml, 3 - 4 kali sehari.  1 - 2 tahun: 0.6 ml - 1.2 ml, 3 - 4 kali sehari.', 'Hati-hati penggunaan obat ini pada penderita penyakit ginjal.  Bila setelah 2 hari demam tidak menurun atau setelah 5 hari nyeri tidak menghilang, segera hubungi unit pelayanan kesehatan.  Penggunaan obat ini pada penderita yang mengkonsumsi alkohol, dapa', '15', 1, ''),
(22, 'Panadol Cold and Flu', '500mg parasetamol\r\nPseudoephedrine HCI 30mg\r\nDextromethorphan HBr 15mg', 'Panadol Cold & Flu sangat sesuai bagi Anda untuk meredakan gejala pilek, flu, dan batuk, tanpa disertai rasa kantuk sehingga Anda bisa beraktifitas seperti biasanya.', '9500', 1, 'panadolijo.png', ' Kadang-kadang dapat menyebabkan tachycardia ( jantung berdebar ), dyspepsia, nausea, kemerahan pada kulit, depresi pernafasan dan susunan saraf pusat, mengantuk, konstipasi, mual, pusing. Penggunaan dosis besar dan jangka panjang menyebabkan kerusakan ha', 'Dewasa (termasuk orang tua) dan anak di atas umur 12 tahun: Obat minum Dewasa : 1 kaplet setiap 4 – 6 jam Jangan melebihi 8 kaplet dalam tiap jangka waktu 24 jam', ' Baca label di samping. Gunakan sesuai aturan. Pemakaian berlebihan dapat berbahaya. Hati-hati penggunaan pada penderita gangguan fungsi hati dan ginjal, glaucoma, hipertrofi prostat, hipertiroid, gangguan jantung, diabetes mellitus, dan retensi urin. Tid', '1', 2, ''),
(23, 'Hydrocortisone', 'Hydrocortisone 2,5% : Tiap 1 gram krim mengandung hidrokortison asetat 28 mg setara dengan hidrokortison 25 mg.\r\nHydrocortisone 1%', 'Indikasi Hydrocortisone adalah obat anti radang pada kulit (yang bukan disebabkan infeksi) seperti eksim dan alergi kulit seperti : dermatitis atopi, dermatitis kontak, dermatitis alergik, pruritus anogenital dan neurodermatitis.', '10500', 5, 'hydrocortisone.gif', 'Rasa terbakar, gatal, kekeringan, atropi kulit, infeksi sekunder.', 'Tanyakan kepada dokter anda mengenai dosis dan aturan pakai Hydrocortisone. Dosis yang umum diberikan : oleskan 2 – 3 kali sehari pada kulit yang sakit.', 'Hati-hati penggunaan Hydrocortisone pada jangka waktu yang lama, area kulit yang luas, wanita hamil, bayi dan anak berusia di bawah 4 tahun. Hindari kontak dengan mata, membrane mukosa, dan kulit yang sensitive / rusak.', '0', 3, ''),
(24, 'Refagan', 'Tiap tablet mengandung:\r\n* Paracetamol 500 mg…………………… : analgesik, penurun panas demam\r\n* Pseudoephedrine HCl 30 mg…………… : pelega hidung tersumbat\r\n* Chlorpheniramine maleate 2 mg……: antihistamin', 'Melagakan gejala bersin-bersin, hidung berlendir, hidung tersumbat, pegal-pegal, sakit kepala dan demam yang disebabkan oleh flu, termasuk rhinitis alergi.', '3000', 1, 'refagan.jpg', 'Mengantuk, pusing, sakit kepala, jantung berdegup, ketegangan, sulit tidur, sulit buang air kecil, gejala GI, kesemutan, reaksi alergi, mulut kering.', 'Dewasa : 1 tablet, 3 kali sehari. Anak usia 6-12 tahun : ½ tablet, 3 kali sehari.', 'Penyakit jantung, diabetes melitus, asma bronchial, tekanan darah tinggi, kelebihan hormon tiroid, laktasi, kelainan fungsi liver, kehamilan, penyakit pada kelenjar prostat, gagal ginjal. Dapat mengurangi kemampuan mengendarai kendaraan atau mengoperasika', '4', 1, ''),
(25, 'Loratadine', 'Loratadine adalah antihistamin kerja panjang yang mempunyai selektivitas tinggi terhadap reseptor histamin-H1 perifer dan afinitas yang rendah terhadap reseptor-H1 di sususnan saraf pusat. Loratadine juga mempunyai afinitias lemah terhadap reseptor adrenergik alfa dan reseptor asetilkolin.', 'Mengurangi gejala-gejala yang berkaitan dengan rhinitis alergik, seperti bersin-bersin, pilek, dan rasa gatal pada hidung, rasa gatal dan terbakar pada mata.\r\nMengurangi gejala-gejala dan tanda-tanda urtikaria kronik serta penyakit dermatologik alergi lain.', '20000', 1, 'loratadine.jpg', '', 'Dewasa, usia lanjut, anak 12 tahun tahun atau lebih : 10 mg sehari Anak-anak usia 2 – 12 tahun : BB > 30 kg : 10 mg sehari BB ? 30 kg : 5 mg sehari Khasiat dan keamanan penggunaan pada anak-anak usia dibawah 2 tahun belum terbukti.', 'Hati-hati bila diberikan pada wanita yang sedang menyusui, karena Loratadine dieksresikan dalam air susu ibu.', '5', 3, ''),
(27, 'Fasolon Cream', 'Efek samping lokal erupsi, atrofi, striae, kulit kering, jarang terjadi ototoksik dan nefrotoksik.', 'Peradangan lokal, pruritis dan gangguan kulit karena alergi.', '18000', 6, 'fasolon.png', 'Efek samping lokal erupsi, atrofi, striae, kulit kering, jarang terjadi ototoksik dan nefrotoksik', 'Oleskan 2-3 kali sehari', 'Penggunaan jangka panjang menyebabkan atrofi local, hidari pemakaian luas dan absorbsi yang besar', '0', 3, ''),
(28, 'Rhinofed Syrup', 'Per 5 mL: Pseudoephedrine 15 mg, terfenadine 20 mg', 'Rinitis alergika, rinitis vasomotor', '28500', 3, 'rhinofed.jpg', 'Anoreksia, mual, muntah, tidak enak di perut, mulut kering, insomnia, mudah lelah, ansietas, palpitasi, takikardia', 'Anak <12 tahun : 3 kali sehari 1 sendok takar.', 'Glaukoma sudut sempit, hipertensi, DM, hipertiroid', '60', 2, ''),
(29, 'Geliga Minyak Otot', 'Ol. Cinnamomi ………………………………….. 9%\r\nOl. Citronella …………………………………….. 2%\r\nOl. Terpentin …………………………………….. 22%\r\nMethyl Salicylate ………………………………… 66,6%\r\nZat Draconis ……………………………………… 0,3%\r\nNonivamide ………………………………………. 0,1%', 'ntuk meredakan sakit pada otot, persendian, tengkuk, bahu, salah urat', '19500', 7, 'geliga.jpg', '', 'Oleskan secara merata pada tempat yang sakit.', 'Hindari area kulit luka terbuka.', '60', 3, ''),
(30, 'Parcok', 'Methyl Salicilate 4,50 g, Cajuputi Oil 1,20 g, Citronela Oil 0,90 g, Camphora 0,15 g, Glycerin 1,20 g, Zingiberis Rhizoma 12,60 g, Languatis Rhizoma 9,30 g, Achyranthii Folium 13,20 g, Caryophylli Folium 6,60 g, Melaleucae Folium 4,20 g, Burmani Cortex 0,90 g, Cymbopogonis Folium 2,10 g, Alcohol (Ethanol 55%) 3,00 g.', '- Membantu meredakan pegal linu\r\n- Rasa kaku pada otot\r\n- Nyeri otot\r\n- Bengkak karena terpukul dan gatal akibat digigit serangga', '12000', 7, 'parcok.jpg', '', 'Kocok terlebih dahulu, kemudian tuangkan secukupnya, lalu oleskan atau gosokkan secara merata pada bagian tubuh yang terasa nyeri.', 'Hindari area kulit luka terbuka', '75', 3, ''),
(31, 'Bioplacenton Cream II', 'Walaupun jarang terjadi, Nonflamin dapat menimbulkan gangguan pencernaan (nausea, kurang nafsu makan, diare, konstipasi), pusing, mulut kering, gatal-gatal dan juga rasa kantuk. Dalam hal ini, dianjurkan untuk mengurangi dosisnya atau dihentikan sama seka', 'meredakan alergi, mengobati gatal-gatal', '15000', 5, 'bio.jpg', '', '', '', '15', 3, ''),
(44, 'Paramex', 'paracetamol 100%', 'meredakan sakit kepala dan panas', '2000', 2, '', 'mulut pecah-pecah', '3 kali sehari', 'bila sakit berlanjut hubungi dokter', '4', 3, ''),
(32, 'Mertigo', 'Tiap tablet mengandung:\r\nBetahistine mesilate 6 mg', 'Mengurangi vertigo,dizzines yang berhubungan dengan gangguan keseimbangan yang terjadi pada gangguan sirkulasi darah atau sindram meniere, penyakit meniere\r\ndan vertigo perifer.', '278000', 1, 'mertigo.jpg', '- Saluran cerna: rasa mual, muntah atau gangguan saluran cerna lainnya. - Reaksi hipersensitivitas: ruam pada kulit (jarang terjadi).', 'Dewasa: 1 – 2 tablet, 3 kali sehari. Dosis disesuaikan dengan umur penderita dan keadaan penyakit.', '- Hati-hati bila diberikan pada penderita dengan gastric ulcer active digestive ulcer, urtikaria atau farter dan asma bronkial - Keamanan penggunaannya pada masa kehamilan belum dibuktikan sebaiknya diberikan hanya bila keuntungan terapi lebih besar dari ', '10', 3, ''),
(33, 'Callusol', 'Asam salisilat 0.2 gr, Asam laktat 0,05 gr,Polidocanol 0,02 gr', 'Menghilangkan kutil , mata ikan juga kapalan.', '28500', 7, 'callusol.jpg', '', 'Ambil kapas secukupnya disesuaikan dengan luas permukaan mata ikan/kutil/kapalan. Tuang Callusol secukuonya pada kapas. Tempelkan kapas yang telah dibasahi Callusol pada mata ikan/kutil/kapalan. kemudian tutuplah dengan plester. Ulangi pemberian Callusol/', '', '10', 1, ''),
(34, 'Ketomed', '', 'Pengobatan & pencegahan Pytiriasis versicolor (panu), dermatitis seboroik, ketombe.', '38500', 5, 'ketomed.jpg', '', 'Cuci (gunakan sebagai shampoo) 2 kali seminggu selama 2-4 minggu.', '', '60', 3, ''),
(35, 'Ketoconazole', 'Ketoconazole adalah suatu derivat imidazole-dioxolane sintetis yang memiliki aktivitas antimikotik yang poten terhadap dermatofit dan ragi, misalnya Tricophyton Sp, Epidermophyton floccosum, Pityrosporum Sp, Candida Sp. Ketoconazole bekerja dengan menghambat enzim sitokrom jamur sehingga mengganggu sintesis ergosterol yang merupakan komponen penting dari membran sel jamur.', 'Infeksi pada kulit, rambut dan kuku (kecuali kuku kaki) yang disebabkan oleh dermatofit dan atau ragi (dermatofitosis, onikomikosis, Candida perionixis, pitiriasis versikolor, pitiriasis kapitis, infeksi pitirosporum, folikulitis, kandidosis kronik mukokutan), bila infeksi ini tidak dapat diobati secara topikal karena tempat lesi tidak di permukaan kulit atau kegagalan pada terapi topikal.\r\nInfeksi ragi pada rongga pencernaan.\r\nKandidosis vagina kronik dan kandidosis rekuren.\r\nInfeksi mikosis sistemik seperti kandidosis sistemik, parakokidioidomikosis, histoplasmosis, kokidioidomikosis, blastomikosis.\r\nPengobatan profilaksis pada pasien yang mekanisme pertahanan tubuhnya menurun (keturunan, disebabkan penyakit atau obat) yang berhubungan dengan meningkatnya risiko infeksi jamur.\r\nKetoconazole tidak berpenetrasi dengan baik ke dalam susunan saraf pusat. Oleh karena itu meningitis jamur jangan diobati dengan ketoconazole oral.', '25000', 1, 'keto.jpg', 'Dispepsia, mual, sakit perut dan diare. Sakit kepala, peningkatan enzim hati yang reversibel, gangguan haid, pusing, parestesia dan reaksi alergi. Trombositopenia, alopesia, peningkatan tekanan intrakranial yang reversibel (seperti edema papil, “bulging f', 'Pengobatan kuratif : Dewasa Infeksi kulit, gastrointestinal dan sistemik : 1 tablet (200 mg) sekali sehari pada waktu makan. Apabila tidak ada reaksi dengan dosis ini, dosis ditingkatkan menjadi 2 tablet (400 mg sehari). Kandidosis vagina : 2 tablet (400 ', 'Penting memberikan penjelasan kepada pasien yang diterapi untuk jangka panjang mengenai gejala penyakit hati seperti letih tidak normal yang disertai dengan demam, urin berwarna gelap, tinja pucat atau ikterus. Faktor yang meningkatkan risiko hepatitis : ', '5', 3, ''),
(36, 'Efisol Lozenges', 'Dequalinium Cl 250 mcg, vitamin C 25 mg', 'Untuk membantu penyembuhan sariawan, infeksi tenggorokan, infeksi amandel, infeksi gusi, gangguan bau mulut akibat infeksi mulut.', '17500', 1, 'efi.jpg', '', '1 butir dihisap di mulut setiap 3-5 jam sekali. Untuk Dewasa maupun Anak-anak.', '', '20', 1, ''),
(37, 'Nizoral', 'Ketoconazole / Ketokonazol.', 'Infeksi ragi pada mulut, kandidosis pada saluran pencernaan, kandidosis sistemik, histoplasmosis, koksidioidomikosis, kandidosis vagina pada orang dewasa.', '429000', 1, 'nizo.jpg', 'Gangguan saluran pencernaan, gatal-gatal, tes fungsi hati dipertinggi. Jarang : reaksi alergi akut, hepatitis, ginekomastia (pembesaran payudara pria).', '• Infeksi ragi pada mulut, kandidosis pada saluran pencernaan, kandidosis sistemik, histoplasmosis, koksidioidomikosis : - dewasa : 1 tablet sehari. - anak-anak : 50-100 mg sehari. • Kandidosis vagina pada orang dewasa : 2 tablet sekali sehari selama 5 ha', '• Hamil dan menyusui. • Insufisiensi adrenal. • Tes fungsi hati pada penggunaan kronis', '3', 3, ''),
(38, 'Viostin DS', '', 'Suplemen Sendi\r\nMembantu mengatasi kaku dan nyeri pada persendian.\r\nMencegah dan Terapi Osteorthritis(pengapuran sendi).\r\nNutrisi pembentukan tulang rawan sendi.\r\nMengurangi atau menghambat peradangan sendi', '160000', 1, 'vio.jpg', '', 'Pencegahan/Pemeliharaan : 1 x 1 kaplet perhari Pengobatan/Perawatan : 2 - 3 x 1 kaplet perhari Diminum setelah makan pagi atau siang atau malam', '', '30', 2, ''),
(39, 'Neurotam', 'Piracetam.', '• Sindroma involusional (kemunduran) yang berkaitan dengan berkurangnya daya ingat akibat penuaan (usia lanjut), astenia (lemah/tidak bertenaga).\r\n• Penyakit serebrovaskuler (pembuluh darah otak), insufisiensi sirkulasi darah dalam otak.\r\n• Sindrom sesudah trauma (terpukul, terbentur).\r\n• Terapi pada anak-anak : meningkatkan daya intelektual.\r\n• Alkoholisme kronis & adiksi (ketagihan).', '206000', 2, 'neu.jpg', 'Gugup, kegelisahan, lekas marah, kelelahan, gangguan tidur & gangguan saluran pencernaan.', 'Gejala psiko organik sehubungan usia lanjut: Awal 6 kapsul atau 3 kaplet sehari dalam 2-3 dosis terbagi selama 6 minggu dengan dosis pemeliharaan 1.2 gram sehari. Gejala pasca trauma: Awal 2 kapsul atau 1 kaplet 3 kali sehari sampai efek yang diinginkan t', '• Insufisiensi ginjal. • Hamil dan menyusui. • Pasien mioklonik.', '0', 3, ''),
(40, 'Clotix', 'Tiap tablet mengandung Clopidogrel 75 mg', 'Mengurangi terjadinya aterosklerosis (infrak miokardial, stroke, dan kematian vaskuler) pada pasien dengan aterosklerosis terdokumentasi oleh stroke yang baru terjadi, infark miokardial, atau penyakit arteri perifer yang telah pasti.', '399500', 1, 'clotix.jpg', 'Efek samping: Reaksi alergi, sinkop.palpitasi,astenia,iskemik nekrosis,gagal jantung,kram kaki, konstipasi, vertigo,muntah.', 'Sekali sehari 75 mg. Dikonsumsi bersamaan dengan makanan atau tidak.', 'infak miokard akut,pasien dalam pengobatan dengan asam salisilat,NSAID,heparin,inhibitor glikoprotein atau pengobatan trombolitik, adanya lesi dengan kemungkinan pendarahan,kerusakan ginjal.kerusakan hati, anak-anak usia kurang dari 18 tahun, Hamil,menyus', '0', 3, ''),
(41, 'Digoxin', 'Digoxin', 'Gagal jantung kongestif akut dan kronik. Takikardi supraventrikuler paroksismal.', '111000', 1, 'DIGOXIN.jpg', '', 'Dewasa : Untuk digitalisasi cepat (24-36 jam) : 4-6 tablet , kemudian 1 tablet pada interval tertentu sampai kompensasi tercapai. Untuk digitalisasi lambat (3-5 hari) : 2-6 tablet/hari dalam dosis terbagi. Pemeliharaan : 1/2-3 tablet/hari. Anak : Untuk di', 'Usia lanjut, kor pulmonalis kronik, insufisiensi koroner, gangguan eletrolit, insufisiensi ginjal dan hati.', '0', 3, ''),
(42, 'Propanolol', 'PROPRANOLOL10\r\nTiap tablet mengandung:\r\nPropranolol HCI 10 mg\r\nPROPRANOLOL 40\r\nTiap tablet mengandung:\r\nPropranolol HCI 40 mg', '- Angina.\r\n- Aritmia.\r\n- Hipertensi.\r\n- Pencegahan migrain.\r\nKTenderiiakaSsma bronkial dan penyakit paru obstrukti,menabun yang lain dan yang cadangan kapasitas jantungnya kecil.', '100000', 1, 'search2.png', '- Kardiovaskular: bradikardia,gagal jantung kongestif,blokade A-V,hipotensi,tangan terasa dingin,trombositopenia purpura,insufisiensi arterial. - Susunan saraf pusat: rasa capai,lemah dan lesu (paling sering),depresi mental/insomnia,sakit kepala,gangguan ', 'Dewasa :3_7 hari dosis dapat ditingkatkan. : oral 10-20 mg,3-4 ka ebasetiapTha akan apabila digunakan atau 40 mgP2 kali sebari,bila diperlukan Migrain : 3-4 kaii sebari,bila diperiukan dosis dapat ditingkatkan.', '- Jangan diberikan pada wanita hamil dan menyusui,kecuali bila sangat dibutuhkan. - Bagi penderita yang minum propranolol dan akan dibius (anestesi umum) harus diberitahukan kepada dokternya. - Bila terjadi bradikardia dan hipotensi maka propranolol harus', '10', 3, ''),
(43, 'Piracetam', '', 'Sediaan oral : Gejala involusi yang berhubungan dengan usia lanjut, alkoholisme kronik dan adiksi; dan gejala pasca trauma.', '50000', 1, 'piracetam.PNG', 'Efek samping yang pernah dilaporkan selama pengobatan : Nervousness, irritabilitas, insomnia, anxietas, tremor dan agitasi. Pada beberapa pasien telah dilaporkan : fatigue dan somnolence. Gangguan gastro-intestinal (nausea, vomiting, diare, gastralgia, sa', 'Piracetam oral Simptom Psikis – Organik yang berhubungan dengan usia lanjut : Dosis awal perhari : 2,4 gram ( 6 tablet 400 mg atau 3 kaplet 800 mg atau 2 kaplet 1200 mg) terbagi dalam 2 – 3 waktu selama 6 minggu, diikuti dengan 1,2 gram / hari sebagai dos', 'Oleh karena piracetam seluruhnya dieliminasi melalui ginjal, peringatan harus diberikan pada penderita gangguan fungsi ginjal, oleh karena itu dianjurkan melakukan pengecekan fungsi ginjal. Oleh karena efek piracetam pada agregasi platelet, peringatan dib', '6', 3, '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
