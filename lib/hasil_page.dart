import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ramalan_provider.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  String getZodiacSign(DateTime date) {
    int day = date.day;
    int month = date.month;

    if ((month == 1 && day >= 20) || (month == 2 && day <= 18)) return 'Aquarius';
    if ((month == 2 && day >= 19) || (month == 3 && day <= 20)) return 'Pisces';
    if ((month == 3 && day >= 21) || (month == 4 && day <= 19)) return 'Aries';
    if ((month == 4 && day >= 20) || (month == 5 && day <= 20)) return 'Taurus';
    if ((month == 5 && day >= 21) || (month == 6 && day <= 20)) return 'Gemini';
    if ((month == 6 && day >= 21) || (month == 7 && day <= 22)) return 'Cancer';
    if ((month == 7 && day >= 23) || (month == 8 && day <= 22)) return 'Leo';
    if ((month == 8 && day >= 23) || (month == 9 && day <= 22)) return 'Virgo';
    if ((month == 9 && day >= 23) || (month == 10 && day <= 22)) return 'Libra';
    if ((month == 10 && day >= 23) || (month == 11 && day <= 21)) return 'Scorpio';
    if ((month == 11 && day >= 22) || (month == 12 && day <= 21)) return 'Sagitarius';
    return 'Capricorn';
  }

  String getZodiacDesc(String zodiac) {
    const zodiakMap = {
      'Capricorn':
      'Orang Capricorn (21 Des – 19 Jan) itu ambisius, loyal, problem-solver, dan serius belajar dari pengalaman. Tapi kadang suka pesimis, takut tantangan, kurang simpati dan terlalu khawatir. Termasuk kategori kardinal: aktif dan inisiatif.',
      'Aquarius':
      'Aquarius (20 Jan – 18 Feb) suka petualangan, progresif, spontan, peduli sosial, dan suka hal baru. Tapi bisa rebel, nggak konsisten, dan chaos. Termasuk kategori tetap: stabil dan tahan banting.',
      'Pisces':
      'Pisces (19 Feb – 20 Mar) itu manja, religius, puitis, setia, penyayang. Tapi bisa gampang kecewa, bingung, atau bahkan ketagihan hal buruk. Termasuk kategori variabel: fleksibel dan adaptif.',
      'Aries':
      'Aries (21 Mar – 20 Apr) berani, punya inisiatif, optimis, suka tantangan. Tapi kadang agresif, suka konflik, dan terburu-buru. Termasuk kardinal: jago mulai hal baru.',
      'Taurus':
      'Taurus (21 Apr – 20 Mei) itu praktis, setia, stabil, dan suka kenyamanan. Tapi bisa keras kepala, terlalu materialistis. Termasuk tetap: konsisten dan kuat.',
      'Gemini':
      'Gemini (21 Mei – 20 Jun) komunikatif, serba bisa, dan pintar ngobrol. Tapi bisa gampang bosen, impulsif, dan nggak fokus. Termasuk variabel: gampang adaptasi.',
      'Cancer':
      'Cancer (21 Jun – 20 Jul) family-oriented, peka, penyayang. Tapi kadang sensitif berlebihan dan takut ditinggal. Termasuk kardinal: peka tapi inisiatif tinggi.',
      'Leo':
      'Leo (21 Jul – 21 Agt) penuh percaya diri, karismatik, suka perhatian. Tapi kadang over show off, ego tinggi. Termasuk tetap: cocok jadi pemimpin.',
      'Virgo':
      'Virgo (22 Agt – 22 Sep) perfeksionis, detail, fokus kerja. Tapi bisa terlalu kritis, cerewet. Termasuk variabel: fleksibel dan analitis.',
      'Libra':
      'Libra (23 Sep – 22 Okt) cinta damai, adil, suka hubungan. Tapi sering galau, plin-plan. Termasuk kardinal: punya inisiatif dan diplomatis.',
      'Scorpio':
      'Scorpio (23 Okt – 22 Nov) intens, passionate, punya energi besar. Tapi bisa posesif, fanatik, dan kadang balas dendam. Termasuk tetap: konsisten dan dalam.',
      'Sagitarius':
      'Sagitarius (23 Nov – 20 Des) optimis, suka belajar dan eksplor. Tapi bisa nggak disiplin, ceroboh. Termasuk variabel: fleksibel dan penuh semangat.',
    };
    return zodiakMap[zodiac] ?? '';
  }

  String getBulanDesc(int month) {
    const list = [
      'Januari: Ambisius, pengamat, dan suka bantu orang improve. Punya jiwa leadership tapi harus bisa atur posisi diri.',
      'Februari: Kreatif, filosofis, suka mikir bebas. Tapi bisa memberontak kalau pendapatnya nggak dihargai.',
      'Maret: Pemalu, trustworthy, dan cocok jadi penengah konflik. Harmoni adalah kunci hidupnya.',
      'April: Atletis, suka tantangan, dan senang kalau dapat apresiasi. Nggak gampang kalah sama rasa takut.',
      'Mei: Atraktif, logis, dan senang hal realistik. Cocok di bidang sains dan punya arah hidup jelas.',
      'Juni: Kalem, peka, pendengar baik, dan suka bikin orang lain bahagia. Tapi cenderung ngalah demi orang lain.',
      'Juli: Extrovert, enerjik, dan punya pesona. Humornya cerdas dan bikin orang nyaman.',
      'Agustus: Pemimpin alami, suka bercanda, dan punya karakter kuat. Sayangnya kadang nggak sadar potensinya.',
      'September: Perfeksionis, terorganisir, dan kritis. Punya standar tinggi buat diri sendiri & orang lain.',
      'Oktober: Carefree, mandiri, dan selalu nyebar aura positif. Gampang temenan & disukai banyak orang.',
      'November: Misterius, peka, dan fokus. Nggak suka tergantung orang & susah percaya orang lain.',
      'Desember: Aktif, suka jadi pusat perhatian, gigih bela harga diri. Berani fight back kalau diserang.',
    ];
    return list[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RamalProvider>(
      builder: (context, data, child) {
        final zodiac = getZodiacSign(data.tanggalLahir);
        final zodiakDesc = getZodiacDesc(zodiac);
        final bulanDesc = getBulanDesc(data.tanggalLahir.month);

        return Scaffold(
          appBar: AppBar(title: const Text('Hasil Ramalan')),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: ListView(
              children: [
                Text('Halo ${data.nama}', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                Text('Zodiak: $zodiac', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(zodiakDesc, style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 20),
                Text('Bulan Lahir: ${data.tanggalLahir.month}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(bulanDesc, style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        );
      },
    );
  }
}