// ============================================================================
// SALITA — SEED CONTENT  (MVP: 60 verse + reflection pairs)
// ============================================================================
//
// ⚠️  DRAFT — REQUIRES HUMAN REVIEW BEFORE LAUNCH  ⚠️
//
//  * VERSE TEXT: Public-domain translations ONLY.
//        - Tagalog (`tl`): Ang Dating Biblia 1905  (public domain)
//        - English (`en`): World English Bible (WEB) (public domain)
//    Every verse string below was drafted for scaffolding and MUST be
//    validated character-for-character against a canonical ADB 1905 / WEB
//    source before release. Do NOT ship unverified scripture text.
//
//  * REFLECTIONS: 100% ORIGINAL Taglish content written for Salita. Each is
//    ~120–200 words, structured as (a) plain meaning, (b) Biblical context,
//    (c) daily application, plus one reflective `applicationPrompt`. Tone is
//    warm and denominationally neutral. These are DRAFTS for human review.
//
//  * ABSOLUTELY NO licensed translations (NIV/ESV/MBB/etc.) may appear here.
//
// Schema supports 365+ entries; MVP seeds 60.
// ============================================================================

import 'package:drift/drift.dart';

import '../tables.dart';

/// Compact internal record for one seeded verse + its reflection.
class _Seed {
  final int id;
  final String book;
  final int chapter;
  final int verseStart;
  final int verseEnd;
  final String ref;
  final String tl;
  final String en;
  final String title;
  final String body;
  final String prompt;

  const _Seed({
    required this.id,
    required this.book,
    required this.chapter,
    required this.verseStart,
    required this.verseEnd,
    required this.ref,
    required this.tl,
    required this.en,
    required this.title,
    required this.body,
    required this.prompt,
  });
}

/// The 60 curated DRAFT pairs.
const List<_Seed> _seeds = [
  _Seed(
    id: 1,
    book: 'Juan',
    chapter: 3,
    verseStart: 16,
    verseEnd: 16,
    ref: 'Juan 3:16',
    tl: "Sapagka't gayon na lamang ang pagsinta ng Dios sa sanglibutan, na "
        "ibinigay niya ang kaniyang bugtong na Anak, upang ang sinomang sa "
        "kaniya'y sumampalataya ay huwag mapahamak, kundi magkaroon ng buhay "
        "na walang hanggan.",
    en: 'For God so loved the world, that he gave his one and only Son, that '
        'whoever believes in him should not perish, but have eternal life.',
    title: 'Ganito Kalalim ang Pag-ibig ng Diyos',
    body: 'Ang sinasabi ng verse na ito ay simple pero napakalalim: minahal '
        'ka ng Diyos nang sobra-sobra kaya ibinigay niya ang pinakamamahal '
        'niyang Anak para sa iyo. Ang salitang "sanglibutan" ay tumutukoy sa '
        'lahat — kasama ka. Sinulat ito ni Juan para ipakita na hindi obligasyon '
        'ang pag-ibig ng Diyos kundi kusa niyang ibinigay, kahit hindi natin '
        'kaya itong bayaran. Sa panahon na parang wala kang halaga o pagod ka '
        'na sa buhay, balikan mo ang verse na ito: may Isang handang mag-alay '
        'ng lahat makasama ka lang habang buhay. Hindi ka accident. Hindi ka '
        'nakakalimutan. Minahal ka na bago ka pa humingi. Ngayong araw, tanggapin '
        'mo lang ang pag-ibig na iyon — hindi mo kailangang "deserve" muna ito.',
    prompt: 'Paano magbabago ang araw mo kung tatanggapin mong minahal ka na '
        'ng Diyos bago mo pa siya hanapin?',
  ),
  _Seed(
    id: 2,
    book: 'Awit',
    chapter: 23,
    verseStart: 1,
    verseEnd: 1,
    ref: 'Awit 23:1',
    tl: 'Ang Panginoon ay aking pastor; hindi ako mangangailangan.',
    en: "Yahweh is my shepherd; I shall lack nothing.",
    title: 'May Nagbabantay sa Iyo',
    body: 'Sinasabi ni David dito na parang tupa siyang inaalagaan ng isang '
        'pastol — ang Diyos mismo. Kapag ang Panginoon ang iyong pastol, may '
        'gagabay, magbabantay, at magbibigay ng kailangan mo. Si David ay dating '
        'pastol bago naging hari, kaya alam niya kung gaano kalaki ang responsibilidad '
        'ng isang pastol sa kaniyang mga tupa: hinahanap ang naliligaw, ipinagtatanggol '
        'sa panganib, dinadala sa sariwang damuhan. Sa gitna ng kakulangan o '
        'takot ngayon, tandaan mo: hindi ka mag-isang lumalakad. Hindi ibig sabihin '
        'na walang problema — ibig sabihin, may kasama ka sa bawat problema. '
        'Subukan mong pakawalan ngayon ang isang bagay na sobra mong kinakabahan, '
        'at ipaubaya mo ito sa Pastol na hindi natutulog.',
    prompt: 'Anong pangangailangan mo ngayon ang kaya mong ipagkatiwala sa Diyos '
        'bilang iyong Pastol?',
  ),
  _Seed(
    id: 3,
    book: 'Filipos',
    chapter: 4,
    verseStart: 13,
    verseEnd: 13,
    ref: 'Filipos 4:13',
    tl: 'Lahat ng mga bagay ay aking magagawa doon sa nagpapalakas sa akin.',
    en: 'I can do all things through Christ, who strengthens me.',
    title: 'Hindi Mo Ito Kakayanin Mag-isa — At Ayos Lang Iyon',
    body: 'Madalas i-quote ang verse na ito sa mga laro o exams, pero ang tunay '
        'na ibig sabihin nito ay mas malalim. Isinulat ito ni Pablo habang siya '
        'ay nasa bilangguan — hindi siya nagyayabang ng lakas, kundi nagpapasalamat '
        'na kahit sa hirap, may lakas siyang galing sa Diyos. Natutunan niyang '
        'maging kontento kahit busog o gutom, mayaman o mahirap. Ang "lahat ng '
        'bagay" dito ay hindi tungkol sa pagkuha ng gusto mo, kundi sa pagtitiis '
        'sa anumang dumating. Kaya kung pagod ka na ngayon, hindi ka nag-iisa sa '
        'pagbuhat ng pasan mo. May kalakasan na inaalok — hindi para maging '
        'superhero ka, kundi para makayanan mo ang araw na ito nang may kapayapaan.',
    prompt: 'Saang bahagi ng buhay mo ngayon kailangan mong humingi ng lakas '
        'sa Diyos sa halip na umasa lang sa sarili?',
  ),
  _Seed(
    id: 4,
    book: 'Jeremias',
    chapter: 29,
    verseStart: 11,
    verseEnd: 11,
    ref: 'Jeremias 29:11',
    tl: 'Sapagka\'t nalalaman ko ang mga pagiisip na aking iniisip sa inyo, '
        'sabi ng Panginoon, mga pagiisip tungkol sa kapayapaan, at hindi tungkol '
        'sa kasamaan, upang bigyan kayo ng pagasa sa inyong wakas.',
    en: 'For I know the thoughts that I think toward you, says Yahweh, thoughts '
        'of peace, and not of evil, to give you hope and a future.',
    title: 'May Plano Siya, Kahit Hindi Mo Pa Nakikita',
    body: 'Sinabi ito ng Diyos sa mga taga-Israel habang sila ay nasa pagkabihag '
        'sa ibang bansa — malayo sa tahanan, parang walang pag-asa. Doon mismo '
        'sinabi ng Diyos na may iniisip siyang kapayapaan at kinabukasan para sa '
        'kanila. Mahalagang tandaan: hindi ito pangako na walang hirap, kundi '
        'pangako na hindi walang saysay ang hirap. Kahit hindi mo maintindihan '
        'kung bakit ganito ang nangyayari ngayon, may nakakaalam ng buong '
        'larawan. Kung nasa gitna ka ng kawalan ng direksyon — trabaho, pamilya, '
        'sarili mong laban — hindi ka pinabayaan. Isang hakbang lang muna ngayon; '
        'hindi mo kailangang makita ang buong daan para magtiwala sa gagabay sa iyo.',
    prompt: 'Anong sitwasyon ngayon ang kailangan mong ipagkatiwala sa plano '
        'ng Diyos kahit hindi mo pa ito naiintindihan?',
  ),
  _Seed(
    id: 5,
    book: 'Roma',
    chapter: 8,
    verseStart: 28,
    verseEnd: 28,
    ref: 'Roma 8:28',
    tl: 'At nalalaman natin na ang lahat ng mga bagay ay nagkakalakip na '
        'gumagawa sa ikabubuti ng mga nagsisiibig sa Dios, sa makatuwid baga\'y '
        'niyaong mga tinawag alinsunod sa kaniyang nasa.',
    en: 'We know that all things work together for good for those who love '
        'God, for those who are called according to his purpose.',
    title: 'Kahit ang Masakit, Maaaring Gamitin sa Mabuti',
    body: 'Pansinin: hindi sinasabi ng verse na "lahat ng bagay ay mabuti." '
        'Ang sinasabi ay "nagkakalakip na gumagawa sa ikabubuti" — ibig sabihin, '
        'kahit ang masakit at mahirap na parte ng buhay ay kaya ng Diyos na '
        'hubugin tungo sa mabuti. Isinulat ito ni Pablo sa mga Kristiyano na '
        'dumaranas ng paghihirap at pag-uusig. Hindi niya ito sinabi para '
        'maliitin ang sakit nila, kundi para bigyan sila ng pag-asa na may '
        'layunin ang bawat pinagdaanan. Parang panghinang: ang bawat piraso — '
        'kahit basag — ay maaaring maging bahagi ng isang mas magandang buo. '
        'Kung may nangyaring hindi mo maintindihan, hindi ito nasayang. Bigyan '
        'mo ng oras ang Diyos na ipakita ang layunin nito sa tamang panahon.',
    prompt: 'Anong masakit na karanasan sa nakaraan ang nakita mong ginamit '
        'ng Diyos sa mabuti — o hinihintay mo pa itong maganap?',
  ),
  _Seed(
    id: 6,
    book: 'Kawikaan',
    chapter: 3,
    verseStart: 5,
    verseEnd: 6,
    ref: 'Kawikaan 3:5-6',
    tl: 'Tumiwala ka sa Panginoon ng buong puso mo, at huwag kang manalig sa '
        'iyong sariling kaunawaan: kilalanin mo siya sa lahat ng iyong mga '
        'lakad, at kaniyang itutuwid ang iyong mga landas.',
    en: 'Trust in Yahweh with all your heart, and don\'t lean on your own '
        'understanding. In all your ways acknowledge him, and he will make '
        'your paths straight.',
    title: 'Magtiwala Kahit Hindi Mo Maintindihan Lahat',
    body: 'Ang verse na ito ay tungkol sa pagpili kung saan ka sasandal. Likas '
        'sa atin na umasa sa sariling pag-iintindi — sa plano, sa kalkulasyon, '
        'sa "alam ko na ito." Pero ang paalala dito: may mga bagay na hindi mo '
        'talaga makikita ang buong larawan, at doon kailangan mong magtiwala sa '
        'Diyos. Bahagi ito ng mga karunungang sinulat ni Solomon para sa mga '
        'kabataan noong panahon niya. Ang "kilalanin mo siya sa lahat ng iyong '
        'lakad" ay hindi lang para sa malalaking desisyon — pati sa pang-araw-araw. '
        'Kapag ginawa mo iyon, ipinapangako niyang gagabayan ka. Hindi ibig '
        'sabihin walang liko sa daan, kundi may gagabay sa bawat liko. Ngayong '
        'araw, subukan mong idulog kahit ang maliliit na desisyon sa kaniya.',
    prompt: 'Saang desisyon ngayon mas umaasa ka sa sariling pang-unawa kaysa '
        'sa Diyos?',
  ),
  _Seed(
    id: 7,
    book: 'Isaias',
    chapter: 41,
    verseStart: 10,
    verseEnd: 10,
    ref: 'Isaias 41:10',
    tl: 'Huwag kang matakot, sapagka\'t ako\'y sumasaiyo; huwag kang manglupaypay, '
        'sapagka\'t ako\'y iyong Dios; aking palalakasin ka; oo, aking tutulungan '
        'ka; oo, aking aalalayan ka ng kanang kamay ng aking katuwiran.',
    en: 'Don\'t be afraid, for I am with you. Don\'t be dismayed, for I am your '
        'God. I will strengthen you. Yes, I will help you. Yes, I will uphold '
        'you with the right hand of my righteousness.',
    title: 'Tatlong Pangako Laban sa Takot',
    body: 'Kapag natatakot tayo, madalas gusto nating marinig na "kaya mo iyan." '
        'Pero ang mas malakas na paalala dito ay hindi "kaya mo" kundi "kasama '
        'mo ako." Tatlong beses na nangako ang Diyos sa verse na ito: palalakasin '
        'kita, tutulungan kita, aalalayan kita. Sinabi ito sa mga taga-Israel na '
        'takot sa hinaharap at sa mga kaaway. Ang takot ay natural na damdamin — '
        'hindi ito kasalanan — pero hindi ito kailangang maghari sa iyo. Ang '
        '"kanang kamay" ay simbolo ng lakas at kapangyarihan; ibig sabihin, '
        'hindi mahinang tulong ang inaalok kundi matibay na kapit. Kung may '
        'kinakabahan kang haharapin ngayon, ulitin mo ang verse na ito bago ka '
        'lumabas ng pinto. Hindi ka pinapasok sa laban nang mag-isa.',
    prompt: 'Anong takot ang bumabagabag sa iyo ngayon, at paano magbabago ito '
        'kung tatandaan mong hindi ka nag-iisa?',
  ),
  _Seed(
    id: 8,
    book: 'Mateo',
    chapter: 6,
    verseStart: 33,
    verseEnd: 33,
    ref: 'Mateo 6:33',
    tl: 'Datapuwa\'t hanapin muna ninyo ang kaniyang kaharian, at ang kaniyang '
        'katuwiran; at ang lahat ng mga bagay na ito ay pawang idaragdag sa inyo.',
    en: 'But seek first God\'s Kingdom and his righteousness; and all these '
        'things will be given to you as well.',
    title: 'Ayusin Muna ang Una',
    body: 'Ang salitang "muna" ang susi dito. Hindi sinasabi ni Jesus na huwag '
        'kang mag-isip ng pangangailangan mo — pagkain, damit, kabuhayan. Ang '
        'sinasabi niya ay may tamang pagkakasunod-sunod: unahin mo ang Diyos, at '
        'ang iba ay masusundan. Sinabi ito ni Jesus sa gitna ng pagtuturo tungkol '
        'sa pag-aalala. Alam niyang madali tayong malunod sa "paano kaya bukas?" '
        'Kaya inalok niya ang ibang paraan: sa halip na habulin muna ang lahat, '
        'hanapin muna ang Diyos, at hayaan mong siya ang mag-ayos ng iba. Hindi '
        'ito pangako ng biglaang yaman, kundi paanyaya sa panatag na puso. Ngayong '
        'araw, ano kaya kung ilagay mo muna ang Diyos bago ang to-do list mo?',
    prompt: 'Ano ang unang-unang hinahabol ng oras at atensyon mo ngayon, at '
        'nasa tamang pagkakasunod ba ito?',
  ),
  _Seed(
    id: 9,
    book: 'Awit',
    chapter: 46,
    verseStart: 1,
    verseEnd: 1,
    ref: 'Awit 46:1',
    tl: 'Ang Dios ay ating ampunan at kalakasan, handang saklolo sa kabagabagan.',
    en: 'God is our refuge and strength, a very present help in trouble.',
    title: 'Kanlungan sa Gitna ng Bagyo',
    body: 'Dalawang larawan ang binibigay ng verse: kanlungan at lakas. Ang '
        'kanlungan ay lugar na tinatakbuhan mo kapag may bagyo; ang lakas naman '
        'ay ang kaya mong tapatan ang bagyo. Ibig sabihin, ang Diyos ay hindi '
        'lang taguan kundi pati kapit-lakas. Ang mahalagang bahagi: "handang '
        'saklolo" — laging nariyan, hindi mahuhuli. Isinulat ang awit na ito sa '
        'panahon ng gulo at panganib, at ipinapaalala nito na kahit gumuho ang '
        'lahat, may hindi matitinag. Sa mga araw na parang lahat ay nagkakagulo — '
        'sa isip, sa pamilya, sa mundo — may matatakbuhan kang hindi nauubos. '
        'Hindi mo kailangang maging matapang mag-isa; kailangan mo lang malaman '
        'kung saan tatakbo.',
    prompt: 'Saan ka madalas tumakbo kapag magulo ang loob mo — at paano kung '
        'ang Diyos ang unang tatakbuhan mo?',
  ),
  _Seed(
    id: 10,
    book: 'Filipos',
    chapter: 4,
    verseStart: 6,
    verseEnd: 7,
    ref: 'Filipos 4:6-7',
    tl: 'Sa anoman ay huwag kayong mangabalisa; kundi sa lahat ng mga bagay '
        'sa pamamagitan ng panalangin at daing na may pagpapasalamat ay ipakilala '
        'ninyo ang inyong mga kahilingan sa Dios. At ang kapayapaan ng Dios, na '
        'di masayod ng pagiisip, ay magiingat ng inyong mga puso at ng inyong '
        'mga pagiisip kay Cristo Jesus.',
    en: 'In nothing be anxious, but in everything, by prayer and petition with '
        'thanksgiving, let your requests be made known to God. And the peace '
        'of God, which surpasses all understanding, will guard your hearts and '
        'your thoughts in Christ Jesus.',
    title: 'Ang Kapalit ng Pag-aalala',
    body: 'May napakapraktikal na payo dito: sa halip na mag-alala, manalangin. '
        'Hindi ibig sabihin nito na madali lang "itigil ang pag-aalala" — mahirap '
        'iyon. Ang alok ni Pablo ay pagpapalit: dalhin mo ang mga kaba mo sa Diyos, '
        'kasama ng pasasalamat. Ang pasasalamat ang nagpapaalala sa atin na may '
        'natapos na siyang mabuti dati, kaya may dahilan tayong magtiwala ulit. '
        'Ang ipinangakong kapalit ay hindi laging solusyon — kundi kapayapaan na '
        '"di masayod ng pagiisip," kapayapaang hindi mo maipaliwanag pero '
        'nararamdaman mo. Isinulat ito ni Pablo mula sa bilangguan, kaya alam '
        'niyang totoo ito kahit sa hirap. Ngayong may bumabagabag sa iyo, sabihin '
        'mo lang ito sa Diyos — hindi kailangang maganda ang pananalita.',
    prompt: 'Anong isang bagay ang kaya mong ipanalangin ngayon sa halip na '
        'pag-alalahanan buong araw?',
  ),
  _Seed(
    id: 11,
    book: 'Josue',
    chapter: 1,
    verseStart: 9,
    verseEnd: 9,
    ref: 'Josue 1:9',
    tl: 'Hindi ba kita inutusan? Ikaw ay magpakalakas at magpakatapang na mabuti; '
        'huwag kang matakot, ni manglupaypay: sapagka\'t ang Panginoon mong Dios '
        'ay sumasa iyo saan ka man pumaroon.',
    en: 'Haven\'t I commanded you? Be strong and courageous. Don\'t be afraid, '
        'neither be dismayed; for Yahweh your God is with you wherever you go.',
    title: 'Tapang na Galing sa Presensya',
    body: 'Bagong pinuno si Josue nang sabihin sa kaniya ito — kapapalit lang '
        'niya kay Moises, at haharapin niya ang malaking hamon ng pamumuno sa '
        'isang buong bayan. Natural lang na kabahan. Kaya ang paulit-ulit na '
        'sinabi ng Diyos: magpakatapang. Pero pansinin kung saan nakasalalay ang '
        'tapang na iyon — hindi sa kakayahan ni Josue, kundi sa pangako na '
        '"sumasa iyo saan ka man pumaroon." Ang tunay na tapang ay hindi kawalan '
        'ng takot, kundi paggalaw kahit may takot, dahil alam mong may kasama ka. '
        'Kung may bago kang sinisimulan — trabaho, responsibilidad, yugto ng '
        'buhay — hindi mo kailangang maging perpekto o walang kaba. Kailangan mo '
        'lang tandaan: kasama mo siya saan ka man magpunta.',
    prompt: 'Anong bagong hamon ang kinakaharap mo na nangangailangan ng tapang '
        'ngayon?',
  ),
  _Seed(
    id: 12,
    book: 'Roma',
    chapter: 12,
    verseStart: 2,
    verseEnd: 2,
    ref: 'Roma 12:2',
    tl: 'At huwag kayong magsiayon sa sanglibutang ito: kundi magbagong anyo '
        'kayo sa pamamagitan ng pagbabago ng inyong pagiisip, upang mapatunayan '
        'ninyo kung alin ang mabuti at kaayaaya at lubos na kalooban ng Dios.',
    en: 'Don\'t be conformed to this world, but be transformed by the renewing '
        'of your mind, so that you may prove what is the good, well-pleasing, '
        'and perfect will of God.',
    title: 'Nagsisimula sa Isip ang Pagbabago',
    body: 'Ang tanong dito ay: sino ang humuhubog sa iyo? Madaling ma-shape '
        'tayo ng nakikita natin araw-araw — sa social media, sa usapan, sa '
        'sukatan ng mundo kung ano ang "tama." Ang alok ni Pablo ay ibang landas: '
        'sa halip na sumabay lang, hayaan mong baguhin ka mula sa loob, sa '
        'pamamagitan ng bagong paraan ng pag-iisip. Hindi ito nangyayari '
        'overnight — proseso ito, parang unti-unting paglinis ng salamin para '
        'mas malinaw kang makakita. Habang nagbabago ang isip mo, nagiging mas '
        'madali mong makita kung ano ang tunay na mabuti. Ngayong araw, pansinin '
        'mo kung ano ang pinapakain mo sa isip mo — dahil iyon ang unti-unting '
        'humuhubog sa nagiging ikaw.',
    prompt: 'Anong isang bagay na dumadaloy sa isip mo araw-araw ang maaaring '
        'humuhubog sa iyo sa paraang hindi mo napapansin?',
  ),
  _Seed(
    id: 13,
    book: '2 Corinto',
    chapter: 5,
    verseStart: 17,
    verseEnd: 17,
    ref: '2 Corinto 5:17',
    tl: 'Kaya\'t kung ang sinoman ay na kay Cristo, siya\'y bagong nilalang: ang '
        'mga dating bagay ay nagsilipas na; narito, sila\'y pawang naging mga '
        'bago.',
    en: 'Therefore if anyone is in Christ, he is a new creation. The old things '
        'have passed away. Behold, all things have become new.',
    title: 'Hindi Ka Nakatali sa Iyong Nakaraan',
    body: 'Isa sa pinakamalayang pangako sa Bibliya: pwede kang magsimula ulit. '
        'Sinasabi dito na kapag nakay Cristo ka, hindi ka na tinutukoy ng mga '
        'pagkakamali, kabiguan, o pagkatao mo dati. Bagong nilalang ka. Sinulat '
        'ito ni Pablo sa mga taong may magulong nakaraan — at siya mismo, dating '
        'umuusig sa mga Kristiyano bago nagbago ang buhay niya. Kaya alam niyang '
        'totoo ito. Hindi ibig sabihin na burado na ang lahat ng nangyari; ibig '
        'sabihin, hindi na iyon ang huling salita tungkol sa iyo. Kung binubuhat '
        'mo pa rin ang bigat ng dati mong pagkakamali, may paanyaya para sa iyo '
        'ngayon: bitiwan mo na, dahil hindi na iyon ang identidad mo. Bago ka na.',
    prompt: 'Anong bahagi ng nakaraan mo ang binubuhat mo pa rin na kaya mo '
        'nang bitiwan ngayon?',
  ),
  _Seed(
    id: 14,
    book: 'Galacia',
    chapter: 5,
    verseStart: 22,
    verseEnd: 23,
    ref: 'Galacia 5:22-23',
    tl: 'Datapuwa\'t ang bunga ng Espiritu ay pagibig, katuwaan, kapayapaan, '
        'pagpapahinuhod, kagandahang-loob, kabutihan, pagtatapat, kaamuan, '
        'pagpipigil; laban sa mga gayong bagay ay walang kautusan.',
    en: 'But the fruit of the Spirit is love, joy, peace, patience, kindness, '
        'goodness, faith, gentleness, and self-control. Against such things '
        'there is no law.',
    title: 'Bunga, Hindi Pinilit',
    body: 'Pansinin ang salitang "bunga." Hindi sinabi na "produkto ng pagsusumikap" '
        'kundi bunga — parang prutas na natural na lumalabas kapag malusog ang '
        'puno. Ang siyam na katangiang ito — pag-ibig, katuwaan, kapayapaan, at '
        'iba pa — ay hindi bagay na pinipilit mo para lang magmukhang mabait. '
        'Lumalabas ang mga ito habang lumalago ang relasyon mo sa Diyos. Sinulat '
        'ito ni Pablo sa mga taong akala ay ang pagsunod sa mga alituntunin ang '
        'sukatan ng pananampalataya. Ang paalala niya: hindi checklist ang '
        'pananampalataya kundi pagbabago mula sa loob. Kung nahihirapan kang '
        'maging matiyaga o mabait ngayon, hindi ka pinipilit na "mag-effort '
        'pa" — inaanyayahan kang lumapit sa pinagmumulan ng bunga.',
    prompt: 'Alin sa siyam na bungang ito ang gusto mong makita pang lumago sa '
        'buhay mo ngayong panahon?',
  ),
  _Seed(
    id: 15,
    book: 'Efeso',
    chapter: 2,
    verseStart: 8,
    verseEnd: 9,
    ref: 'Efeso 2:8-9',
    tl: 'Sapagka\'t sa biyaya kayo\'y nangaligtas sa pamamagitan ng pananampalataya; '
        'at ito\'y hindi sa inyong sarili, ito\'y kaloob ng Dios; hindi sa pamamagitan '
        'ng mga gawa, upang ang sinoman ay huwag magmapuri.',
    en: 'for by grace you have been saved through faith, and that not of '
        'yourselves; it is the gift of God, not of works, that no one would '
        'boast.',
    title: 'Regalo, Hindi Sweldo',
    body: 'May malaking kaibahan ang regalo at sweldo. Ang sweldo ay pinaghirapan '
        'mo; ang regalo ay ibinigay kahit hindi mo kaya itong bayaran. Sinasabi '
        'ng verse na ito na ang kaligtasan ay regalo — hindi mo ito binili sa '
        'pamamagitan ng kabutihan mo. Nakakapagpalaya ito dahil ibig sabihin, '
        'hindi mo kailangang maging perpekto muna. Sinulat ni Pablo ito sa mga '
        'taong pagod na sa pagsubok na "kitain" ang pagtanggap ng Diyos. Kung '
        'lagi kang nararamdamang kulang ka pa, hindi sapat, o hindi ka karapat-dapat '
        '— ang biyaya ay para sa iyo. Hindi mo kailangang patunayan ang sarili '
        'mo para mahalin. Tanggapin mo na lang ang regalo; iyon ang buong punto '
        'nito.',
    prompt: 'Sa anong paraan sinusubukan mong "kitain" ang pagtanggap na regalo '
        'na sa iyo?',
  ),
  _Seed(
    id: 16,
    book: 'Awit',
    chapter: 91,
    verseStart: 1,
    verseEnd: 2,
    ref: 'Awit 91:1-2',
    tl: 'Siyang tumatahan sa lihim na dako ng Kataastaasan ay mananatili sa '
        'lilim ng Makapangyarihan sa lahat. Aking sasabihin tungkol sa Panginoon, '
        'siya\'y aking kanlungan at aking katibayan, ang Dios ko na siyang aking '
        'tinitiwalaan.',
    en: 'He who dwells in the secret place of the Most High will rest in the '
        'shadow of the Almighty. I will say of Yahweh, "He is my refuge and my '
        'fortress; my God, in whom I trust."',
    title: 'Isang Ligtas na Lugar na Palaging Bukas',
    body: 'Ang larawan dito ay tahanan — hindi lang pansamantalang silungan '
        'kundi lugar na "tumatahan" ka, lugar na tinatawag mong bahay. Kapag '
        'sinabi nating tinitirhan natin ang presensya ng Diyos, ibig sabihin '
        'hindi lang tayo dumadaan kapag may problema; nakikipamuhay tayo roon '
        'araw-araw. Ang "lilim" ay simbolo ng proteksyon at pahinga mula sa '
        'nakakapasong init ng buhay. Sinulat ang awit na ito bilang pag-alala na '
        'may kaligtasang matatagpuan sa Diyos kahit sa gitna ng panganib. Hindi '
        'ibig sabihin walang darating na hirap — ibig sabihin, may matatakbuhan '
        'kang katibayan na hindi matitinag. Sa gitna ng pagod at kaba ngayon, '
        'may bukas na pintong naghihintay: pumasok ka at magpahinga.',
    prompt: 'Kailan mo huling nakaramdam ng tunay na pahinga, at paano ka '
        'makakabalik sa presensya ng Diyos ngayon?',
  ),
  _Seed(
    id: 17,
    book: 'Mateo',
    chapter: 11,
    verseStart: 28,
    verseEnd: 28,
    ref: 'Mateo 11:28',
    tl: 'Magsiparito sa akin, kayong lahat na nangapapagal at nangabibigatang '
        'lubha, at kayo\'y aking papagpapahingahin.',
    en: 'Come to me, all you who labor and are heavily burdened, and I will '
        'give you rest.',
    title: 'Isang Paanyaya para sa Pagod',
    body: 'Simple pero malalim ang paanyaya: "magsiparito sa akin." Hindi sinabi '
        'ni Jesus na "ayusin mo muna ang sarili mo bago ka lumapit." Ang tinatawag '
        'niya ay ang mga pagod, ang mga bigat na bigat na — ibig sabihin, ikaw. '
        'Sinabi niya ito sa mga taong pinapabigat ng maraming relihiyosong '
        'alituntunin noon, mga taong sawa na sa pagsisikap na sapat. Ang alok '
        'niya ay pahinga — hindi ang uri na natutulog ka lang, kundi ang '
        'kapahingahan ng kaluluwa na nakakaramdam kang okay ka na. Kung pagod ka '
        'na ngayon — sa trabaho, sa pag-iisa, sa pagpapanggap na okay ka — hindi '
        'mo kailangang buhatin ang lahat. May isang nag-aanyayang ipahinga mo '
        'muna ang pasan mo. Lumapit ka lang, kahit ganyan ka pa.',
    prompt: 'Anong bigat ang binubuhat mo ngayon na kaya mong dalhin sa Diyos '
        'para makapagpahinga?',
  ),
  _Seed(
    id: 18,
    book: 'Isaias',
    chapter: 40,
    verseStart: 31,
    verseEnd: 31,
    ref: 'Isaias 40:31',
    tl: 'Nguni\'t silang nangaghihintay sa Panginoon ay mangagbabagong lakas; '
        'sila\'y paiilanglang na may mga pakpak na parang mga aguila; sila\'y '
        'magsisitakbo, at hindi mangapapagod; sila\'y magsisilakad, at hindi '
        'manganghihina.',
    en: 'but those who wait for Yahweh will renew their strength. They will '
        'mount up with wings like eagles. They will run, and not be weary. '
        'They will walk, and not faint.',
    title: 'Bagong Lakas sa mga Naghihintay',
    body: 'May pangako dito para sa mga pagod na — hindi biglaang lakas, kundi '
        '"bagong lakas" na naiipon habang naghihintay. Ang paghihintay ay '
        'madalas ang pinakamahirap na bahagi; parang wala kang ginagawa habang '
        'ang oras ay tumatakbo. Pero ang sinasabi dito, ang paghihintay sa Diyos '
        'ay hindi pagsasayang ng oras — panahon ito ng pagbabago ng lakas. Sinulat '
        'ito ni Isaias sa mga taong nanghihina ang loob, na akala ay nakalimot '
        'na ang Diyos sa kanila. Ang larawan ng aguila ay maganda: hindi ito '
        'nagpupumilit lumipad — nakasakay lang ito sa hangin. Kung pagod ka na '
        'sa kalalaban, baka hindi mas maraming effort ang kailangan mo kundi mas '
        'maraming pananalig at pagtatiwala habang naghihintay.',
    prompt: 'Ano ang hinihintay mo ngayon, at paano ka makakapaghintay nang '
        'may pag-asa sa halip na pagkabahala?',
  ),
  _Seed(
    id: 19,
    book: '1 Corinto',
    chapter: 13,
    verseStart: 4,
    verseEnd: 5,
    ref: '1 Corinto 13:4-5',
    tl: 'Ang pagibig ay mapagpahinuhod, at magandang-loob; ang pagibig ay hindi '
        'nananaghili; ang pagibig ay hindi nagmamapuri, hindi nagpapalalo, hindi '
        'naguugaling mahalay, hindi hinahanap ang kaniyang sarili, hindi '
        'nayayamot, hindi inaalumana ang masama.',
    en: 'Love is patient and is kind. Love doesn\'t envy. Love doesn\'t brag, '
        'is not proud, doesn\'t behave itself inappropriately, doesn\'t seek its '
        'own way, is not provoked, takes no account of evil.',
    title: 'Ang Tunay na Hitsura ng Pag-ibig',
    body: 'Madalas nating naririnig ang verse na ito sa kasal, pero hindi lang '
        'ito para sa mag-asawa — para ito sa lahat ng uri ng pag-ibig. Pansinin '
        'na ang pag-ibig dito ay hindi damdamin kundi mga ginagawa: matiyaga, '
        'mabait, hindi mainggitin, hindi mapagmataas. Ibig sabihin, ang pag-ibig '
        'ay pagpili, hindi lang kilig. Sinulat ito ni Pablo sa isang iglesyang '
        'puno ng away at kompetisyon, para ipaalala kung ano ang tunay na '
        'mahalaga. Kapag nabasa mo ito nang dahan-dahan, parang salamin ito: '
        'saan ako matiyaga? Saan ako madaling mayamot? Hindi para sisihin mo ang '
        'sarili mo, kundi para makita kung saan pwede kang lumago. Piliin mong '
        'ipakita ang isa sa mga ito sa isang tao ngayon.',
    prompt: 'Alin sa mga katangian ng pag-ibig na ito ang pinakamahirap mong '
        'ipakita, at kanino mo ito maipapakita ngayon?',
  ),
  _Seed(
    id: 20,
    book: 'Roma',
    chapter: 8,
    verseStart: 38,
    verseEnd: 39,
    ref: 'Roma 8:38-39',
    tl: 'Sapagka\'t ako\'y naniniwalang lubos, na kahit ang kamatayan, ni ang '
        'buhay, ni ang mga anghel, ni ang mga pamunuan, ni ang mga bagay na '
        'kasalukuyan, ni ang mga bagay na darating, ni ang mga kapangyarihan, '
        'ni ang kataasan, ni ang kababaan, ni ang alin mang ibang nilalang, ay '
        'hindi makapaghihiwalay sa atin sa pagibig ng Dios, na nasa kay Cristo '
        'Jesus na Panginoon natin.',
    en: 'For I am persuaded that neither death, nor life, nor angels, nor '
        'principalities, nor things present, nor things to come, nor powers, '
        'nor height, nor depth, nor any other created thing will be able to '
        'separate us from God\'s love which is in Christ Jesus our Lord.',
    title: 'Walang Makakapaghiwalay sa Iyo sa Pag-ibig Niya',
    body: 'Isa-isang binanggit ni Pablo ang lahat ng maaari nating katakutan — '
        'kamatayan, buhay, nakaraan, kinabukasan, mga kapangyarihan — at sinabi: '
        'wala sa mga ito ang makakapaghiwalay sa iyo sa pag-ibig ng Diyos. Ito '
        'ang antas ng katiyakan na inaalok sa iyo. Sinulat ni Pablo ito sa mga '
        'taong dumaranas ng tunay na paghihirap at panganib, kaya hindi ito '
        'basta positibong pananalita — kombiksyon ito. Kung minsan pakiramdam '
        'mo malayo ka na sa Diyos dahil sa pagkakamali o kabiguan mo, tandaan: '
        'ang listahan sa itaas ay kasama ang "mga bagay na kasalukuyan" at '
        '"mga bagay na darating." Walang laban mo bukas na kayang bumura sa '
        'pag-ibig na hawak ka. Ligtas ka.',
    prompt: 'Anong bagay ang nagpaparamdam sa iyo minsan na malayo ka sa '
        'pag-ibig ng Diyos, kahit hindi totoo iyon?',
  ),
  _Seed(
    id: 21,
    book: 'Awit',
    chapter: 37,
    verseStart: 4,
    verseEnd: 4,
    ref: 'Awit 37:4',
    tl: 'Magpakaligaya ka naman sa Panginoon; at bibigyan ka niya ng nasa ng '
        'iyong puso.',
    en: 'Also delight yourself in Yahweh, and he will give you the desires of '
        'your heart.',
    title: 'Kapag ang Diyos ang Kaligayahan Mo',
    body: 'Madaling maling maintindihan ang verse na ito na parang "vending '
        'machine" ang Diyos — masaya ka sa kaniya, tapos bibigay siya ng gusto '
        'mo. Pero mas malalim ito. Kapag tunay kang nagagalak sa Diyos, unti-unting '
        'nagbabago mismo ang mga hinahangad ng puso mo — nagiging kaayon ng mga '
        'nais niya. Kaya ang "nasa ng iyong puso" ay nagiging mga bagay na tama '
        'na. Sinulat ito ni David bilang payo sa mga taong naiinggit sa mga '
        'masasama na parang umuunlad. Ang paalala: sa halip na habulin ang mga '
        'bagay, hanapin mo muna ang Diyos, at ang iba ay maaayos. Hindi ito '
        'tungkol sa pagkuha ng lahat ng gusto mo, kundi sa pagkakaroon ng puso '
        'na nasisiyahan sa tama.',
    prompt: 'Ano ang tunay na ikinaliligaya ng puso mo ngayon, at nakaugat ba '
        'ito sa Diyos?',
  ),
  _Seed(
    id: 22,
    book: 'Kawikaan',
    chapter: 16,
    verseStart: 3,
    verseEnd: 3,
    ref: 'Kawikaan 16:3',
    tl: 'Iukol mo sa Panginoon ang iyong mga gawa, at ang iyong mga panukala '
        'ay matatatag.',
    en: 'Commit your deeds to Yahweh, and your plans will succeed.',
    title: 'Idulog Mo ang mga Plano Mo',
    body: 'May dalawang bahagi dito: gawin mo ang iyong parte (mga gawa, mga '
        'plano), pero idulog mo ito sa Diyos. Hindi sinasabi na huwag ka nang '
        'mag-isip o magplano — ang sinasabi ay isama mo ang Diyos sa mga ito. '
        'Ang "iukol" ay parang pag-abot ng isang bagay nang buo, hindi hawak-hawak '
        'pa rin. Bahagi ito ng karunungan ni Solomon tungkol sa pamumuhay nang '
        'may Diyos sa sentro. Minsan gusto nating kontrolin ang lahat ng detalye '
        'ng plano natin, at nakakapagod iyon. Ang alok dito: gawin mo ang kaya '
        'mo, tapos ipaubaya mo ang resulta. Hindi ito pangako na palaging '
        'magiging madali, kundi na hindi ka mag-isang magpaplano. Ngayong araw, '
        'idulog mo ang isang bagay na kinakabahan kang gawin.',
    prompt: 'Anong plano o gawain ang mahigpit mong hawak na kaya mo nang '
        'idulog sa Diyos?',
  ),
  _Seed(
    id: 23,
    book: '2 Timoteo',
    chapter: 1,
    verseStart: 7,
    verseEnd: 7,
    ref: '2 Timoteo 1:7',
    tl: 'Sapagka\'t hindi tayo binigyan ng Dios ng espiritu ng katakutan; kundi '
        'ng kapangyarihan at ng pagibig at ng kahusayan.',
    en: 'For God didn\'t give us a spirit of fear, but of power, love, and '
        'self-control.',
    title: 'Hindi Takot ang Bigay sa Iyo',
    body: 'May mga araw na ang takot ang tila humahawak sa manibela — takot '
        'mabigo, takot sa opinyon ng iba, takot sa kinabukasan. Ang paalala ng '
        'verse na ito: hindi iyon ang galing sa Diyos. Ang binigay niya ay '
        'tatlong bagay — kapangyarihan (lakas na hindi mo lang basta kaya '
        'mag-isa), pag-ibig (na nagtutulak sa atin palabas ng sarili), at '
        'kahusayan o self-control (kakayahang huminahon at pumili nang tama). '
        'Sinulat ni Pablo ito kay Timoteo, isang batang lider na tila nahihiya '
        'o natatakot. Hindi niya sinabing "huwag kang matakot" na parang madali '
        'lang — ipinaalala niya kung ano na ang meron sa loob niya. Kung takot '
        'ang nangunguna sa iyo ngayon, hindi iyon ang identidad mo. May ibinigay '
        'nang mas malakas sa loob mo.',
    prompt: 'Saan hinahayaan mong mamuno ang takot, at ano ang magbabago kung '
        'lakas ang pipiliin mo sa halip?',
  ),
  _Seed(
    id: 24,
    book: 'Hebreo',
    chapter: 11,
    verseStart: 1,
    verseEnd: 1,
    ref: 'Hebreo 11:1',
    tl: 'Ngayon, ang pananampalataya ay siyang kapanatagan sa mga bagay na '
        'hinihintay, ang katunayan ng mga bagay na hindi nakikita.',
    en: 'Now faith is assurance of things hoped for, proof of things not seen.',
    title: 'Paniniwala sa Hindi Pa Nakikita',
    body: 'Ano ba talaga ang pananampalataya? Ang depinisyon dito: kapanatagan '
        'sa mga bagay na inaasahan pa lang, katiyakan sa hindi pa nakikita. '
        'Parang paghahasik ng buto — naniniwala kang tutubo ito kahit wala ka '
        'pang nakikitang halaman. Hindi ito bulag na paniniwala; nakaugat ito sa '
        'kung sino ang pinagkakatiwalaan mo. Ang kabanatang ito sa Hebreo ay '
        'punong-puno ng mga taong nagtiwala sa Diyos bago nila nakita ang '
        'pangako. Sa buhay natin, maraming bagay na hindi natin makontrol o '
        'makita ang katapusan. Ang pananampalataya ay hindi pagpupilit na malaman '
        'ang lahat, kundi pagtitiwala kahit hindi kumpleto ang larawan. Kung may '
        'hinihintay kang hindi mo pa nakikita, hindi ibig sabihin wala; baka '
        'nagbubuo lang sa hindi mo nakikitang lugar.',
    prompt: 'Anong pangako o pag-asa ang hawak mo ngayon kahit hindi mo pa ito '
        'nakikitang natutupad?',
  ),
  _Seed(
    id: 25,
    book: 'Santiago',
    chapter: 1,
    verseStart: 5,
    verseEnd: 5,
    ref: 'Santiago 1:5',
    tl: 'Nguni\'t kung nagkukulang ng karunungan ang sinoman sa inyo, ay '
        'humingi sa Dios, na nagbibigay ng sagana sa lahat at hindi nanunumbat; '
        'at ito\'y ibibigay sa kaniya.',
    en: 'But if any of you lacks wisdom, let him ask of God, who gives to all '
        'liberally and without reproach, and it will be given to him.',
    title: 'Okay Lang Humingi ng Karunungan',
    body: 'May mga desisyon sa buhay na hindi mo talaga alam ang tama — trabaho, '
        'relasyon, malalaking pagbabago. Ang magandang balita: pwede kang humingi '
        'ng karunungan sa Diyos, at hindi ka niya susumbatan. Pansinin ang '
        '"hindi nanunumbat" — ibig sabihin, hindi siya magsasabi ng "bakit hindi '
        'mo pa alam ito?" Bukas siyang magbigay nang sagana. Sinulat ni Santiago '
        'ito sa mga taong dumaranas ng iba\'t ibang pagsubok, kung saan mahalaga '
        'ang tamang pagpili. Ang karunungan ay hindi laging biglaang sagot; '
        'minsan ito ay unti-unting kalinawan habang lumalapit ka sa Diyos. Kung '
        'nalilito ka ngayon sa isang bagay, hindi mahina o kulang ang humingi ng '
        'gabay — iyon mismo ang inaanyayahan mong gawin.',
    prompt: 'Anong desisyon o sitwasyon ngayon ang kailangan mong humingi ng '
        'karunungan sa Diyos?',
  ),
  _Seed(
    id: 26,
    book: '1 Pedro',
    chapter: 5,
    verseStart: 7,
    verseEnd: 7,
    ref: '1 Pedro 5:7',
    tl: 'Na inyong ilagak sa kaniya ang lahat ng inyong kabalisahan, sapagka\'t '
        'kayo\'y ipinagmamalasakit niya.',
    en: 'casting all your worries on him, because he cares for you.',
    title: 'May Nagmamalasakit sa Iyo',
    body: 'Ang salitang "ilagak" ay parang paghagis ng isang bigat — hindi '
        'basta ibinaba, kundi inalis sa balikat mo at inabot sa iba. At may '
        'dahilan kung bakit kaya mong gawin ito: "sapagka\'t kayo\'y '
        'ipinagmamalasakit niya." Hindi mo dinadala ang mga alalahanin mo sa '
        'isang taong walang pakialam — dinadala mo ito sa Isang nagmamalasakit '
        'talaga sa iyo. Sinulat ni Pedro ito sa mga Kristiyanong dumaranas ng '
        'hirap at pag-uusig. Hindi niya sinabing "wala kang dapat ikabahala" — '
        'kinilala niyang may mga kabalisahan tayo. Ang alok niya: huwag mong '
        'buhatin ito mag-isa. Ngayong may bumabagabag sa iyo, isipin mo ito '
        'bilang literal na paghahagis — abutin mo ito sa Diyos, at hindi mo na '
        'ito kailangang hawakan buong araw.',
    prompt: 'Anong isang alalahanin ang kaya mong "ihagis" sa Diyos ngayon at '
        'hindi na bawiin?',
  ),
  _Seed(
    id: 27,
    book: 'Awit',
    chapter: 27,
    verseStart: 1,
    verseEnd: 1,
    ref: 'Awit 27:1',
    tl: 'Ang Panginoon ay aking liwanag, at aking kaligtasan; kanino ako '
        'matatakot? Ang Panginoon ay katibayan ng aking buhay; kanino ako '
        'masisindak?',
    en: 'Yahweh is my light and my salvation. Whom shall I fear? Yahweh is the '
        'strength of my life. Of whom shall I be afraid?',
    title: 'Liwanag na Nagtatapon ng Takot',
    body: 'Kapag madilim, ang maliit na bagay ay nagmumukhang malaki at '
        'nakakatakot. Pero kapag may liwanag, nakikita mo ang totoong hitsura ng '
        'mga bagay. Sinasabi ni David na ang Panginoon ang kaniyang liwanag — '
        'ibig sabihin, kayang liwanagan ng Diyos ang mga bagay na kinakatakutan '
        'mo hanggang makita mong hindi pala kasing-laki ng akala mo. Dalawang '
        'tanong ang inulit niya: kanino ako matatakot? Retorikal ang mga ito — '
        'ang sagot ay walang sinuman, dahil mas malakas ang kasama niya. Sinulat '
        'ni David ito sa panahon ng tunay na panganib mula sa mga kaaway. Ang '
        'tapang niya ay hindi galing sa kawalan ng problema, kundi sa presensya '
        'ng Diyos. Kung may kinakatakutan kang nasa dilim ngayon, hayaan mong '
        'liwanagan muna ito bago ka manghina.',
    prompt: 'Anong takot ang nagmumukhang mas malaki kaysa sa totoo, at paano '
        'ito nagbabago sa liwanag ng Diyos?',
  ),
  _Seed(
    id: 28,
    book: 'Juan',
    chapter: 14,
    verseStart: 6,
    verseEnd: 6,
    ref: 'Juan 14:6',
    tl: 'Sinabi sa kaniya ni Jesus, Ako ang daan, at ang katotohanan, at ang '
        'buhay: sinoman ay di makaparoroon sa Ama, kundi sa pamamagitan ko.',
    en: 'Jesus said to him, "I am the way, the truth, and the life. No one '
        'comes to the Father, except through me."',
    title: 'Isang Malinaw na Daan',
    body: 'Marami tayong hinahanap sa buhay: direksyon (daan), katotohanan sa '
        'gitna ng gulo, at buhay na may saysay. Sinabi ni Jesus na siya mismo '
        'ang lahat ng ito. Hindi lang siya nagtuturo ng daan — siya ang daan. '
        'Sinabi niya ito sa kaniyang mga alagad noong nalulungkot sila at '
        'nalilito, hindi alam kung saan siya pupunta. Ang salitang ito ay '
        'nagbibigay ng katiyakan: hindi mo kailangang hanapin ang sarili mong '
        'daan papunta sa Diyos sa pamamagitan ng sapat na kabutihan — may '
        'inihandang daan na para sa iyo. Sa panahong nalilito ka o parang '
        'naliligaw, tandaan na may malinaw na landas. Hindi mo kailangang alamin '
        'ang lahat mag-isa; kailangan mo lang sundan ang nag-aalok na gabayan ka.',
    prompt: 'Saang bahagi ng buhay mo pakiramdam mo naliligaw ka, at paano ka '
        'gagabayan ng Diyos doon?',
  ),
  _Seed(
    id: 29,
    book: 'Mateo',
    chapter: 5,
    verseStart: 16,
    verseEnd: 16,
    ref: 'Mateo 5:16',
    tl: 'Lumiwanag na gayon ang inyong ilaw sa harap ng mga tao; upang mangakita '
        'nila ang inyong mabubuting gawa, at kanilang luwalhatiin ang inyong Ama '
        'na nasa langit.',
    en: 'Even so, let your light shine before men, that they may see your good '
        'works and glorify your Father who is in heaven.',
    title: 'Hindi Para Makita Ka, Kundi Para Makita Siya',
    body: 'May kakaibang uri ng liwanag ang tinutukoy dito. Hindi ito para '
        'pansinin ka o purihin — ang layunin ay makita ng iba ang kabutihan at '
        'maituro pabalik sa Diyos. Parang bintanang nagpapapasok ng sikat ng '
        'araw: hindi ang bintana ang tinitingnan mo, kundi ang liwanag na '
        'dumadaan dito. Sinabi ito ni Jesus sa kaniyang tagubilin sa bundok, '
        'kung saan tinuturuan niya kung ano ang buhay na kalugod-lugod sa Diyos. '
        'Ang liwanag mo ay ang mga simpleng mabubuting gawa — kabaitan, katapatan, '
        'pag-aalaga sa iba. Hindi mo kailangang maging kilala para magliwanag; '
        'kailangan mo lang gumawa ng mabuti kahit sa maliit na paraan. Ngayong '
        'araw, may isang tao kayang makikinabang sa liwanag mo — kahit sa isang '
        'ngiti o tulong.',
    prompt: 'Paano ka makakapagliwanag ngayon sa isang tao sa paligid mo nang '
        'hindi para pansinin ang sarili?',
  ),
  _Seed(
    id: 30,
    book: 'Roma',
    chapter: 10,
    verseStart: 9,
    verseEnd: 9,
    ref: 'Roma 10:9',
    tl: 'Sapagka\'t kung ipahahayag mo ng iyong bibig si Jesus na Panginoon, at '
        'sasampalataya ka sa iyong puso na binuhay siyang maguli ng Dios sa mga '
        'patay ay maliligtas ka.',
    en: 'that if you will confess with your mouth that Jesus is Lord, and '
        'believe in your heart that God raised him from the dead, you will be '
        'saved.',
    title: 'Simple ang Pintuan',
    body: 'Minsan iniisip natin na napakakumplikado ng pananampalataya — na '
        'kailangan mo munang maayos ang lahat bago ka tanggapin. Pero '
        'ipinapakita ng verse na ito kung gaano kasimple ang pintuan: paniwalaan '
        'sa puso, ipahayag sa bibig. Hindi ito tungkol sa pagiging perpekto '
        'kundi sa pagtanggap. Sinulat ni Pablo ito para ipakita na hindi para '
        'sa iilan lang ang kaligtasan — bukas ito sa sinuman, ano man ang '
        'nakaraan. Ang puso at bibig na magkasabay ay tungkol sa katapatan: '
        'hindi lang salita sa labas, kundi paniniwalang tunay sa loob. Kung '
        'matagal mo nang iniisip na hindi ka pa handa o hindi ka karapat-dapat, '
        'baka mas simple lang ito kaysa sa akala mo. Bukas ang pinto; hindi mo '
        'kailangang mag-ayos muna ng lahat.',
    prompt: 'Anong bahagi ng pananampalataya ang pinapakumplikado mo na maaaring '
        'mas simple lang pala?',
  ),
  _Seed(
    id: 31,
    book: 'Awit',
    chapter: 119,
    verseStart: 105,
    verseEnd: 105,
    ref: 'Awit 119:105',
    tl: 'Ang salita mo\'y ilawan sa aking mga paa, at liwanag sa aking landas.',
    en: 'Your word is a lamp to my feet, and a light for my path.',
    title: 'Sapat na Liwanag para sa Susunod na Hakbang',
    body: 'Pansinin: ilawan sa mga PAA, hindi spotlight na kumikita sa buong '
        'kalsada. Noong unang panahon, ang ilawan ay maliit na sinusundot sa '
        'daan — sapat lang para makita mo ang susunod na hakbang, hindi ang buong '
        'biyahe. Ganoon din madalas gumana ang paggabay ng Diyos: hindi niya '
        'ipinapakita ang buong plano, kundi sapat na liwanag para sa isang '
        'hakbang. Ang awit na ito ay tungkol sa halaga ng salita ng Diyos bilang '
        'gabay sa buhay. Kung gusto mong makita ang buong daan bago ka gumalaw, '
        'baka matagal kang tuluyang hindi umuusad. Ang alok dito: sundan mo ang '
        'liwanag na meron ka ngayon, at habang lumalakad ka, lalabas ang susunod. '
        'Hindi mo kailangang malaman ang lahat — kailangan mo lang gawin ang '
        'susunod na tamang hakbang.',
    prompt: 'Ano ang susunod na hakbang na inililiwanag sa iyo ngayon, kahit '
        'hindi mo pa nakikita ang buong daan?',
  ),
  _Seed(
    id: 32,
    book: 'Colosas',
    chapter: 3,
    verseStart: 23,
    verseEnd: 23,
    ref: 'Colosas 3:23',
    tl: 'Anomang inyong ginagawa, ay inyong gawin ng buong puso, na gaya ng sa '
        'Panginoon, at hindi sa mga tao.',
    en: 'And whatever you do, work heartily, as for the Lord, and not for men,',
    title: 'Para Kanino Ka Talaga Nagtatrabaho?',
    body: 'May nakakapagpalayang kaisipan dito: kahit ang pinakaordinaryong '
        'gawain mo ay may halaga kung gagawin mo ito "para sa Panginoon." Ibig '
        'sabihin, hindi lang ang mga malalaki o kilalang trabaho ang mahalaga — '
        'pati ang tahimik, hindi napapansin na gawain. Sinulat ni Pablo ito sa '
        'mga taong pagod at pakiramdam na hindi pinapahalagahan ang trabaho. Ang '
        'paalala niya: hindi mo trabaho ang tunay mong pinaglilingkuran, kundi '
        'ang Diyos. Nagbabago nito ang lahat — ang boss na hindi nagpapasalamat, '
        'ang gawaing walang nakakapansin, ang pagsisikap na parang walang '
        'kabuluhan. May Isang nakakakita at nagpapahalaga sa bawat sinseridad. '
        'Ngayong araw, ano kaya kung gawin mo ang trabaho mo — kahit maliit — '
        'nang buong puso, para sa Isang laging nakakakita?',
    prompt: 'Anong gawain ang pakiramdam mo ay walang pumapansin, at paano ito '
        'magbabago kung gagawin mo ito para sa Diyos?',
  ),
  _Seed(
    id: 33,
    book: 'Filipos',
    chapter: 1,
    verseStart: 6,
    verseEnd: 6,
    ref: 'Filipos 1:6',
    tl: 'Na ako\'y may lubos na pagkakatiwala sa bagay na ito, na ang nagpasimula '
        'sa inyo ng mabuting gawa, ay lulubusin hanggang sa araw ni Jesucristo.',
    en: 'being confident of this very thing, that he who began a good work in '
        'you will complete it until the day of Jesus Christ.',
    title: 'Hindi Ka Niya Iiwang Kalahati',
    body: 'Kapag nagsisimula tayo ng proyekto, may panganib na hindi natin ito '
        'matapos. Pero ang pangako dito: ang mabuting gawa na sinimulan ng Diyos '
        'sa iyo ay tatapusin niya. Hindi ka niya iiwang kalahati. Ibig sabihin, '
        'ang paglago mo bilang tao ay hindi nakasalalay lang sa sarili mong '
        'lakas — may Isang aktibong gumagawa sa loob mo. Sinulat ni Pablo ito '
        'nang may pagmamahal sa isang iglesyang minahal niya. Kung minsan '
        'nararamdaman mong "trabaho pa rin ako," na parang hindi ka pa tapos, '
        'ganoon nga — pero hindi iyon senyales ng kabiguan. Senyales iyon na '
        'patuloy pang ginagawa. Hindi mo kailangang maging perpekto ngayon; '
        'kailangan mo lang magtiwala na patuloy kang binubuo ng Isang hindi '
        'sumusuko.',
    prompt: 'Anong bahagi mo ang pakiramdam mong "hindi pa tapos," at paano '
        'kung tingnan mo ito bilang patuloy pang ginagawa?',
  ),
  _Seed(
    id: 34,
    book: 'Isaias',
    chapter: 43,
    verseStart: 2,
    verseEnd: 2,
    ref: 'Isaias 43:2',
    tl: 'Pagka ikaw ay dumaraan sa tubig, ako\'y sasa iyo; at sa mga ilog, ay '
        'hindi ka tatabunan: pagka ikaw ay lumalakad sa apoy, hindi ka masusunog; '
        'o magniningas man ang alab sa iyo.',
    en: 'When you pass through the waters, I will be with you, and through the '
        'rivers, they will not overflow you. When you walk through the fire, '
        'you will not be burned, and flame will not scorch you.',
    title: 'Kasama Mo Siya sa Loob, Hindi sa Labas',
    body: 'Pansinin ang mga salita: "pagka ikaw ay dumaraan sa tubig" — hindi '
        '"sakaling" kundi "pagka." Hindi ipinapangako ng Diyos na hindi ka '
        'dadaan sa hirap. Ang ipinapangako niya ay hindi ka mag-iisa sa loob '
        'nito. Kasama mo siya sa tubig, sa ilog, sa apoy. Sinulat ni Isaias ito '
        'sa mga taong dumaranas ng malaking pagsubok at takot. Ang mahalagang '
        'aral: hindi laging inaalis ng Diyos ang bagyo — minsan dinadaanan niya '
        'ito kasama tayo. Kung nasa gitna ka ng isang mahirap na yugto ngayon, '
        'ang pangako ay hindi "matatapos na ito agad" kundi "hindi ka lulubog, '
        'hindi ka masusunog." May Isang kasama mo sa loob mismo ng apoy. Hindi '
        'ka pababayaang matupok.',
    prompt: 'Anong "tubig" o "apoy" ang dinadaanan mo ngayon, at paano '
        'nakakatulong malamang hindi ka nag-iisa doon?',
  ),
  _Seed(
    id: 35,
    book: 'Awit',
    chapter: 121,
    verseStart: 1,
    verseEnd: 2,
    ref: 'Awit 121:1-2',
    tl: 'Aking itataas ang aking mga mata sa mga bundok: saan baga manggagaling '
        'ang aking saklolo? Ang saklolo sa akin ay nanggagaling sa Panginoon, '
        'na gumawa ng langit at lupa.',
    en: 'I will lift up my eyes to the hills. Where does my help come from? My '
        'help comes from Yahweh, who made heaven and earth.',
    title: 'Saan Ka Tumitingin para sa Tulong?',
    body: 'May tanong ang manunulat: saan manggagaling ang tulong ko? At '
        'sinagot niya mismo — sa Panginoon. Isipin: sino ba ang unang '
        'tinatakbuhan mo kapag may problema? Minsan sa sarili, sa pera, sa ibang '
        'tao — na lahat ay maaaring makatulong pero may hangganan. Ang awit na '
        'ito ay awit ng mga manlalakbay noong araw, na paakyat sa Jerusalem, '
        'dumadaan sa mapanganib na kabundukan. Sa gitna ng takot, tumitingin '
        'sila hindi sa panganib kundi sa Diyos na gumawa ng langit at lupa — '
        'ibig sabihin, walang problemang mas malaki sa kaniya. Ngayong araw, '
        'saan mo unang itinataas ang mga mata mo kapag nag-aalala ka? Baka '
        'panahon na para tumingala sa Isang may kakayahang tumulong nang tunay.',
    prompt: 'Kanino o saan ka unang lumalapit para sa tulong, at nasa tamang '
        'lugar ba ang tingin mo?',
  ),
  _Seed(
    id: 36,
    book: 'Kawikaan',
    chapter: 18,
    verseStart: 10,
    verseEnd: 10,
    ref: 'Kawikaan 18:10',
    tl: 'Ang pangalan ng Panginoon ay matibay na moog: tinatakbuhan ng matuwid '
        'at naliligtas.',
    en: 'The name of Yahweh is a strong tower. The righteous run to him, and '
        'are safe.',
    title: 'May Matatakbuhang Matibay',
    body: 'Noong unang panahon, ang moog o tore ay lugar na tinatakbuhan ng '
        'mga tao kapag may panganib — matibay, mataas, ligtas. Ang larawan dito: '
        'ang Diyos mismo ay ganoong kanlungan. Pansinin ang aksyon — "tinatakbuhan." '
        'Hindi sapat na alam mong may tore; kailangan mong tumakbo papasok. Ang '
        'karunungang ito ni Solomon ay tungkol sa kung saan mo hinahanap ang '
        'seguridad. Madalas tinatakbuhan natin ang ibang bagay kapag takot tayo — '
        'distraksyon, pagkain, pagbibili, kahit anong makapagpalimot pansamantala. '
        'Pero ang mga iyon ay hindi matibay na moog; pansamantala lang. Ang alok '
        'dito ay isang lugar na tunay na ligtas. Ngayong may kinakabahan ka, '
        'saan ka tatakbo? May pintong laging bukas na hindi ka bibiguin.',
    prompt: 'Ano ang madalas mong tinatakbuhan kapag takot ka, at paano kung '
        'ang Diyos ang unang takbuhan mo?',
  ),
  _Seed(
    id: 37,
    book: '1 Juan',
    chapter: 4,
    verseStart: 19,
    verseEnd: 19,
    ref: '1 Juan 4:19',
    tl: 'Tayo\'y nagsisiibig, sapagka\'t siya\'y unang umibig sa atin.',
    en: 'We love him, because he first loved us.',
    title: 'Siya ang Unang Umibig',
    body: 'Napakaikli ng verse na ito, pero binabaligtad nito ang karaniwan '
        'nating pag-iisip. Madalas iniisip natin na kailangan muna nating '
        'mahalin ang Diyos o gumawa ng tama bago tayo mahalin. Pero sinasabi '
        'dito: siya ang unang umibig. Bago ka pa humingi, bago ka pa maging '
        'karapat-dapat, minahal ka na. Ang pag-ibig natin sa kaniya at sa iba '
        'ay tugon lamang — parang echo — sa pag-ibig na natanggap na natin. '
        'Sinulat ni Juan ito para ipaalala na hindi natin kailangang "kitain" '
        'ang pag-ibig; nauna na ito sa atin. Nakakapagpalaya ito: kung minsan '
        'pakiramdam mo hindi ka sapat na mabuti para mahalin, tandaan na hindi '
        'nagsimula sa iyo ang pag-ibig na ito. Nagsimula ito sa Diyos, at ang '
        'kailangan mo lang ay tumugon.',
    prompt: 'Paano nagbabago ang tingin mo sa sarili kapag natanto mong minahal '
        'ka na bago ka pa gumawa ng anuman?',
  ),
  _Seed(
    id: 38,
    book: 'Mateo',
    chapter: 28,
    verseStart: 19,
    verseEnd: 20,
    ref: 'Mateo 28:19-20',
    tl: 'Dahil dito magsiyaon nga kayo, at gawin ninyong mga alagad ang lahat '
        'ng mga bansa, na sila\'y inyong bautismuhan sa pangalan ng Ama at ng '
        'Anak at ng Espiritu Santo: Na ituro ninyo sa kanila na kanilang '
        'ganapin ang lahat ng mga bagay na iniutos ko sa inyo: at narito, ako\'y '
        'sumasa inyong palagi, hanggang sa katapusan ng sanglibutan.',
    en: 'Go and make disciples of all nations, baptizing them in the name of '
        'the Father and of the Son and of the Holy Spirit, teaching them to '
        'observe all things that I commanded you. Behold, I am with you always, '
        'even to the end of the age.',
    title: 'Isang Utos at Isang Pangako',
    body: 'May malaking utos dito — puntahan ang lahat ng bansa, ibahagi ang '
        'pananampalataya. Pero pansinin kung paano ito nagtatapos: "ako\'y '
        'sumasa inyong palagi." Ang utos ay hindi ibinigay nang mag-iisa ka; '
        'kasama mo siya sa buong paglalakbay. Ito ang huling salita ni Jesus '
        'bago siya umakyat sa langit — ang mga huling salita ay laging mahalaga. '
        'Hindi mo kailangang maging pastor o misyonero para "gawing alagad" ang '
        'iba; nagsisimula ito sa simpleng pagbabahagi ng pag-asa sa mga taong '
        'malapit sa iyo, sa paraan ng buhay mo. At sa lahat ng ito, hindi ka '
        'nag-iisa. Ang pangako ng presensya niya — "palagi, hanggang sa '
        'katapusan" — ang nagbibigay lakas sa anumang hamon ngayon.',
    prompt: 'Kanino sa paligid mo maaari mong ibahagi ang pag-asang meron ka, '
        'kahit sa simpleng paraan?',
  ),
  _Seed(
    id: 39,
    book: 'Roma',
    chapter: 5,
    verseStart: 8,
    verseEnd: 8,
    ref: 'Roma 5:8',
    tl: 'Datapuwa\'t ipinagtatagubilin ng Dios ang kaniyang pagibig sa atin, na '
        'nang tayo\'y mga makasalanan pa, si Cristo ay namatay dahil sa atin.',
    en: 'But God commends his own love toward us, in that while we were yet '
        'sinners, Christ died for us.',
    title: 'Minahal Ka Habang Hindi Ka Pa Handa',
    body: 'Karamihan sa atin naniniwala na kailangan mo munang ayusin ang '
        'sarili mo bago ka mahalin — na may kondisyon ang pagtanggap. Pero '
        'sinasabi dito: "nang tayo\'y mga makasalanan pa" — hindi noong maayos '
        'na tayo, kundi habang magulo pa. Doon ipinakita ng Diyos ang pag-ibig '
        'niya. Ibig sabihin, hindi ka niya hinintay na maging perpekto. Sinulat '
        'ni Pablo ito para ipakita kung gaano kalayo ang pag-ibig ng Diyos — '
        'hindi ito nakadepende sa performance mo. Kung lagi mong nararamdaman na '
        'kailangan mo munang maging mabuting-mabuti bago ka tanggapin, ang verse '
        'na ito ay para sa iyo. Minahal ka na sa pinakagulo mong estado. Hindi '
        'mo kailangang maghintay na maging handa; tinanggap ka na kahit hindi.',
    prompt: 'Naniniwala ka bang kailangan mo munang "maging maayos" bago ka '
        'mahalin ng Diyos — at ano ang sinasabi ng verse na ito tungkol doon?',
  ),
  _Seed(
    id: 40,
    book: 'Awit',
    chapter: 34,
    verseStart: 8,
    verseEnd: 8,
    ref: 'Awit 34:8',
    tl: 'Oh inyong tikman at tingnan ninyo na ang Panginoon ay mabuti: '
        'mapalad ang tao na nanganganlong sa kaniya.',
    en: 'Oh taste and see that Yahweh is good. Blessed is the man who takes '
        'refuge in him.',
    title: 'Tikman Mo, Hindi Lang Pag-aralan',
    body: 'Kakaiba ang salitang ginamit dito: "tikman." Hindi "pag-aralan" o '
        '"pag-isipan" — kundi tikman, karanasan. Parang pagkain: hindi mo '
        'malalaman kung masarap hangga\'t hindi mo tinitikman. Ganoon din ang '
        'kabutihan ng Diyos — hindi lang ito bagay na pinaniniwalaan sa isip '
        'kundi nararanasan sa buhay. Sinulat ni David ito matapos siyang '
        'iligtas ng Diyos sa isang mahirap na sitwasyon; galing ang salita niya '
        'sa tunay na karanasan, hindi teorya. Ang paanyaya ay personal: subukan '
        'mo, ranasan mo mismo. Minsan gusto nating maunawaan muna ang lahat bago '
        'tayo magtiwala, pero may mga bagay na sa karanasan lang natutuklasan. '
        'Ngayong araw, subukan mong lumapit sa Diyos nang personal — hindi lang '
        'para malaman ang tungkol sa kaniya, kundi para maranasan ang kabutihan '
        'niya.',
    prompt: 'Kailan ka huling nakaranas mismo ng kabutihan ng Diyos, hindi lang '
        'narinig ang tungkol dito?',
  ),
  _Seed(
    id: 41,
    book: 'Galacia',
    chapter: 6,
    verseStart: 9,
    verseEnd: 9,
    ref: 'Galacia 6:9',
    tl: 'At huwag tayong mangapagod sa paggawa ng mabuti: sapagka\'t sa kapanahunan '
        'ay magsisipagani tayo, kung hindi tayo manganghihimagod.',
    en: 'Let us not be weary in doing good, for we will reap in due season, if '
        'we don\'t give up.',
    title: 'Huwag Sumuko Bago ang Ani',
    body: 'May katotohanan dito na alam ng bawat magsasaka: may agwat ang '
        'pagtatanim at pag-aani. Hindi mo makikita agad ang bunga ng mabuting '
        'ginagawa mo — minsan matagal. At doon dumarating ang tukso na sumuko, '
        'lalo na kung parang walang nakakapansin o walang nagbabago. Ang paalala '
        'ni Pablo: "sa kapanahunan" — may tamang panahon ang ani, kahit hindi '
        'ngayon. Ang susi ay "kung hindi tayo manganghihimagod" — kung hindi '
        'tayo susuko. Kung pagod ka na sa paggawa ng tama na parang walang '
        'kapalit — sa pagiging mabuting magulang, kaibigan, empleyado — hindi '
        'ito nasasayang. Ang mabuting binhi ay tumutubo kahit hindi mo nakikita. '
        'Isang araw pa; huwag kang sumuko bago pa dumating ang panahon ng ani.',
    prompt: 'Saang mabuting bagay ka napapagod na na parang walang bunga, at '
        'ano ang magbibigay sa iyo ng lakas para magpatuloy?',
  ),
  _Seed(
    id: 42,
    book: 'Efeso',
    chapter: 4,
    verseStart: 32,
    verseEnd: 32,
    ref: 'Efeso 4:32',
    tl: 'At magmagandang-loob kayo sa isa\'t isa, mga mahabagin, na mangagpatawaran '
        'kayo sa isa\'t isa, gaya naman ng pagpapatawad sa inyo ng Dios kay Cristo.',
    en: 'And be kind to one another, tender hearted, forgiving each other, '
        'just as God also in Christ forgave you.',
    title: 'Magpatawad Gaya ng Pagpapatawad sa Iyo',
    body: 'Mahirap magpatawad — totoo iyan, hindi ito dapat maliitin. Pero '
        'may susi ang verse na ito: magpatawad "gaya naman ng pagpapatawad sa '
        'inyo ng Dios." Ibig sabihin, hindi tayo nagpapatawad mula sa kawalan; '
        'nagpapatawad tayo mula sa pinuno na kabaong ng pagpapatawad na natanggap '
        'na natin. Sinulat ni Pablo ito sa isang komunidad na tiyak may mga '
        'hidwaan — dahil saan mang grupo ng tao, may sugat. Ang pagpapatawad ay '
        'hindi pagsasabing "okay lang ang nangyari"; ito ay pagpapakawala ng '
        'bigat na binubuhat mo para sa isang taong nakasakit. Madalas ikaw mismo '
        'ang mas napapagaan. Kung may bumabalik-balik na sama ng loob sa iyo, '
        'hindi mo kailangang gawin ito mag-isa o bigla — pero ang unang hakbang '
        'ay handa kang bitiwan.',
    prompt: 'Sino ang kailangan mong patawarin — o unti-unti nang bitiwan — '
        'para gumaan ang loob mo?',
  ),
  _Seed(
    id: 43,
    book: 'Awit',
    chapter: 139,
    verseStart: 14,
    verseEnd: 14,
    ref: 'Awit 139:14',
    tl: 'Ako\'y magpapasalamat sa iyo; sapagka\'t nilalang ako na kakilakilabot at '
        'kagilagilalas: kagilagilalas ang iyong mga gawa; at nalalamang mabuti '
        'ng aking kaluluwa.',
    en: 'I will give thanks to you, for I am fearfully and wonderfully made. '
        'Your works are wonderful. My soul knows that very well.',
    title: 'Ginawa Kang May Layunin',
    body: 'Sa panahong madaling ikumpara ang sarili sa iba — lalo na sa social '
        'media — ang verse na ito ay isang matinding paalala: ginawa ka nang '
        '"kagilagilalas," may layunin, hindi aksidente. Hindi ka mass-produced; '
        'may masusing pag-iisip sa likod ng pagkakalikha sa iyo. Sinulat ni '
        'David ito habang pinagninilayan kung gaano siya kakilala ng Diyos — '
        'bawat detalye niya, kahit bago pa siya isinilang. Kapag pinagdududahan '
        'mo ang halaga mo, o naiisip mong sana iba ka, balikan mo ito: hindi ka '
        'pagkakamali. Ang mga bahaging hindi mo gusto sa sarili mo ay bahagi ng '
        'isang disenyong hindi mo pa lubos na nauunawaan. Ngayong araw, sa halip '
        'na ikumpara ang sarili sa iba, subukan mong tanggapin na ikaw ay ginawa '
        'nang may layunin at pagmamahal.',
    prompt: 'Anong bahagi ng sarili mo ang mahirap mong tanggapin, at paano '
        'kung tingnan mo itong bahagi ng maingat na pagkakalikha sa iyo?',
  ),
  _Seed(
    id: 44,
    book: '2 Corinto',
    chapter: 12,
    verseStart: 9,
    verseEnd: 9,
    ref: '2 Corinto 12:9',
    tl: 'At siya\'y nagsabi sa akin, Ang aking biyaya ay sapat na sa iyo: '
        'sapagka\'t ang aking kapangyarihan ay nagiging sakdal sa kahinaan. '
        'Kaya\'t bagkus akong magmamapuri na may malaking galak sa aking mga '
        'kahinaan, upang manahan nawa sa akin ang kapangyarihan ni Cristo.',
    en: 'He has said to me, "My grace is sufficient for you, for my power is '
        'made perfect in weakness." Most gladly therefore I will rather glory '
        'in my weaknesses, that the power of Christ may rest on me.',
    title: 'Sa Kahinaan Lumalabas ang Lakas Niya',
    body: 'Karaniwan nating iniisip na kailangan nating itago ang kahinaan '
        'natin — magpakatatag, magpanggap na okay. Pero binabaligtad ito ng '
        'verse na ito: sa kahinaan mismo lumalabas ang kapangyarihan ng Diyos. '
        'Si Pablo ay may isang "tinik sa laman" — isang paulit-ulit na hirap na '
        'ipinanalangin niyang alisin, pero ang sagot ng Diyos ay hindi pag-alis '
        'kundi pagbibigay ng sapat na biyaya. Ibig sabihin, hindi mo kailangang '
        'maging malakas sa lahat ng oras. Ang mga bahagi mong pakiramdam mo '
        'kulang ka — iyon mismo ang lugar kung saan makikita ang tulong ng '
        'Diyos. Kung pagod ka na sa pagpapanggap na kaya mo ang lahat, may '
        'kaluwagan dito: sapat na ang biyaya. Hindi mo kailangang punan ang '
        'lahat mag-isa.',
    prompt: 'Saang kahinaan mo pakiramdam mong kailangan mong magpanggap, at '
        'paano kung doon mo hayaang tumulong ang Diyos?',
  ),
  _Seed(
    id: 45,
    book: 'Mateo',
    chapter: 7,
    verseStart: 7,
    verseEnd: 7,
    ref: 'Mateo 7:7',
    tl: 'Magsihingi kayo, at kayo\'y bibigyan; magsihanap kayo, at kayo\'y '
        'mangakakasumpong; magsituktok kayo, at kayo\'y bubuksan.',
    en: 'Ask, and it will be given you. Seek, and you will find. Knock, and it '
        'will be opened for you.',
    title: 'Patuloy na Humingi, Maghanap, Kumatok',
    body: 'Tatlong aksyon ang binanggit ni Jesus: humingi, maghanap, kumatok. '
        'Sa orihinal, ang mga ito ay nasa anyong "patuloy" — patuloy na humingi, '
        'patuloy na maghanap. Ibig sabihin, hindi ito tungkol sa isang beses na '
        'pagsubok tapos sumuko, kundi sa pananatili. Sinabi ito ni Jesus para '
        'himukin tayong lumapit sa Diyos nang may pananalig, hindi pagdududa. '
        'Hindi ito garantiya na makukuha mo agad ang eksaktong gusto mo — parang '
        'mabuting magulang, minsan ang sagot ay "oo," minsan "hindi pa," minsan '
        '"may mas mabuti pa." Pero ang punto: bukas ang Diyos sa pakikipag-usap. '
        'Hindi ka pabigat sa kaniya. Kung may matagal mo nang hinihiling, huwag '
        'kang sumuko — patuloy kang kumatok. May pintong nakalaan para sa iyo.',
    prompt: 'May hinihiling ka bang tinigilan mo na, at kailangan mo bang '
        'magpatuloy sa pagkatok?',
  ),
  _Seed(
    id: 46,
    book: 'Awit',
    chapter: 118,
    verseStart: 24,
    verseEnd: 24,
    ref: 'Awit 118:24',
    tl: 'Ito ang araw na ginawa ng Panginoon; tayo\'y mangagagalak at ating '
        'katutuwaan.',
    en: 'This is the day that Yahweh has made. We will rejoice and be glad in '
        'it.',
    title: 'Regalo ang Araw na Ito',
    body: 'Madali nating tingnan ang araw bilang isa na namang bagay na '
        'lalampasan — trabaho, pagod, ulitin bukas. Pero may ibang paraan ng '
        'pagtingin dito: ang araw na ito ay ginawa, hindi basta nangyari. May '
        'nagbigay nito. Kahit hindi perpekto ang araw, kahit may hirap, ito ay '
        'regalo pa rin. Ang awit na ito ay awit ng pasasalamat, madalas awitin '
        'sa mga pagtitipon. Ang "mangagagalak" ay isang pagpili — hindi ito '
        'nangangahulugang perpekto ang lahat, kundi may hahanaping dahilan ng '
        'pasasalamat kahit sa gitna ng ordinaryong araw. Bago ka pa magsimula '
        'ng abalang araw ngayon, huminto ka sandali: ang araw na ito ay hindi '
        'garantisado, pero binigay pa rin sa iyo. Anong isang bagay ang '
        'mapagpapasalamatan mo ngayon, kahit maliit?',
    prompt: 'Anong isang bagay sa araw na ito — kahit simple — ang '
        'mapagpapasalamatan mo ngayon?',
  ),
  _Seed(
    id: 47,
    book: 'Kawikaan',
    chapter: 22,
    verseStart: 6,
    verseEnd: 6,
    ref: 'Kawikaan 22:6',
    tl: 'Turuan mo ang bata sa daan na dapat niyang lakaran, at pagka tumanda '
        'man siya ay hindi niya hihiwalayan.',
    en: 'Train up a child in the way he should go, and when he is old he will '
        'not depart from it.',
    title: 'Ang Binhi na Itinatanim Ngayon',
    body: 'May katotohanan dito para sa sinumang may inaalagaan — anak, '
        'kapatid, kamag-anak, estudyante. Ang mga natututunan ng isang bata '
        'ngayon ay nag-uugat nang malalim, at nananatili kahit tumanda. Ito ay '
        'isang paalala ng bigat at ganda ng pag-akay sa nakababata. Pero hindi '
        'ito tungkol sa pagiging perpektong magulang o tagapag-alaga; tungkol '
        'ito sa maliliit at paulit-ulit na pagtuturo — sa halimbawa, sa '
        'pagmamahal, sa tamang gawi. Minsan pakiramdam natin walang epekto ang '
        'ginagawa natin, pero ang mga simpleng aral na itinatanim natin ngayon '
        'ay bunga sa hinaharap. Kung may inaalagaan kang bata o nakababata, ang '
        'pinakamaliit na pagpapakita ng pag-ibig at tamang gawi ngayon ay '
        'binhing tutubo. Hindi ka man makakita agad ng resulta, mahalaga ang '
        'itinatanim mo.',
    prompt: 'Sino ang nakababata sa buhay mo na kaya mong turuan o gabayan '
        'sa pamamagitan ng halimbawa ngayon?',
  ),
  _Seed(
    id: 48,
    book: 'Roma',
    chapter: 15,
    verseStart: 13,
    verseEnd: 13,
    ref: 'Roma 15:13',
    tl: 'Puspusin nga kayo ng Dios ng pagasa ng buong kagalakan at kapayapaan '
        'sa pananampalataya, upang kayo\'y managana sa pagasa sa pamamagitan ng '
        'kapangyarihan ng Espiritu Santo.',
    en: 'Now may the God of hope fill you with all joy and peace in believing, '
        'that you may abound in hope, in the power of the Holy Spirit.',
    title: 'Ang Diyos ng Pag-asa',
    body: 'Pansinin kung paano tinawag ang Diyos dito: "ang Dios ng pagasa." '
        'Hindi lang siya nagbibigay ng pag-asa — siya mismo ang pinagmumulan '
        'nito. Sa panahong maraming dahilan para mawalan ng pag-asa — balita, '
        'personal na problema, pagod — mahalagang malaman kung saan ito '
        'nanggagaling. Hindi ito galing sa sitwasyon na gumaganda; galing ito sa '
        'Diyos na hindi nagbabago. Ipinanalangin ni Pablo ito para sa mga '
        'mananampalataya, na sila ay "managana sa pagasa" — hindi kaunti lang, '
        'kundi umaapaw. Ang kagalakan at kapayapaan ay hindi nakadepende sa '
        'perpektong buhay, kundi sa pagtitiwala sa Diyos ng pag-asa. Kung '
        'kapos ka na sa pag-asa ngayon, hindi mo ito kailangang gawin mag-isa. '
        'May pinagmumulan na hindi nauubos; lumapit ka lang at hayaang punuin ka.',
    prompt: 'Saan nakaugat ang pag-asa mo ngayon — sa nagbabagong sitwasyon o '
        'sa Diyos na hindi nagbabago?',
  ),
  _Seed(
    id: 49,
    book: '1 Tesalonica',
    chapter: 5,
    verseStart: 16,
    verseEnd: 18,
    ref: '1 Tesalonica 5:16-18',
    tl: 'Mangagalak kayong lagi; Magsipanalangin kayong walang patid; Sa lahat '
        'ng mga bagay ay magpasalamat kayo; sapagka\'t ito ang kalooban ng Dios '
        'kay Cristo Jesus tungkol sa inyo.',
    en: 'Rejoice always. Pray without ceasing. In everything give thanks, for '
        'this is the will of God in Christ Jesus toward you.',
    title: 'Tatlong Simpleng Gawi',
    body: 'Tatlong maikling utos ang ibinigay dito, at magkakaugnay ang mga '
        'ito: magalak, manalangin, magpasalamat. Pansinin ang "sa lahat ng mga '
        'bagay ay magpasalamat" — hindi "para sa lahat ng bagay" kundi "sa '
        'lahat," ibig sabihin sa gitna ng anumang sitwasyon. Hindi ito '
        'nangangahulugang magpanggap na masaya kahit malungkot; ito ay '
        'paghahanap ng dahilan ng pasasalamat kahit sa mahirap na araw. Sinulat '
        'ni Pablo ito sa isang batang iglesyang dumaranas ng pagsubok. Ang '
        'panalangin na "walang patid" ay hindi tungkol sa mahahabang panalangin '
        'kundi sa patuloy na pakikipag-usap sa Diyos sa buong araw — parang '
        'kaibigang lagi mong kasama. Subukan mo ngayon: sa gitna ng ordinaryong '
        'araw, sabihin mo sa Diyos ang isang bagay na pinasasalamatan mo, kahit '
        'gaano kaliit.',
    prompt: 'Sa gitna ng anumang pinagdadaanan mo ngayon, anong isang bagay '
        'ang kaya mong pasalamatan?',
  ),
  _Seed(
    id: 50,
    book: 'Juan',
    chapter: 16,
    verseStart: 33,
    verseEnd: 33,
    ref: 'Juan 16:33',
    tl: 'Ang mga bagay na ito ay sinalita ko sa inyo, upang kayo\'y magkaroon '
        'sa akin ng kapayapaan. Sa sanglibutan ay mayroon kayong '
        'kapighatian: nguni\'t laksan ninyo ang loob; aking dinaig ang '
        'sanglibutan.',
    en: 'I have told you these things, that in me you may have peace. In the '
        'world you have trouble; but cheer up! I have overcome the world.',
    title: 'Kapayapaan sa Gitna ng Gulo',
    body: 'Matapat si Jesus dito: "sa sanglibutan ay mayroon kayong '
        'kapighatian." Hindi niya ipinangakong walang problema. Sa halip, may '
        'inaalok siyang mas mabuti — kapayapaan sa gitna mismo ng problema. '
        'Dalawang bagay ang totoo nang sabay: may hirap sa mundo, pero may '
        'kapayapaan din na matatagpuan sa kaniya. Sinabi ni Jesus ito sa '
        'kaniyang mga alagad bago siya dakpin at ipako — kaya alam niya ang '
        'sinasabi niya tungkol sa kapighatian. Ang "aking dinaig ang '
        'sanglibutan" ay katiyakan na ang problema ay walang huling salita. '
        'Kung nasa gitna ka ng gulo ngayon, hindi mo kailangang magpanggap na '
        'okay ang lahat. Kilalanin mo ang hirap — pero tandaan din na may '
        'kapayapaang inaalok kahit hindi pa tapos ang laban.',
    prompt: 'Paano ka makakahanap ng kaunting kapayapaan ngayon kahit hindi pa '
        'natatapos ang pinagdadaanan mo?',
  ),
  _Seed(
    id: 51,
    book: 'Awit',
    chapter: 55,
    verseStart: 22,
    verseEnd: 22,
    ref: 'Awit 55:22',
    tl: 'Ilagay mo ang iyong pasan sa Panginoon, at kaniyang aalalayan ka: '
        'hindi niya titiising makilos kailan man ang matuwid.',
    en: 'Cast your burden on Yahweh and he will sustain you. He will never '
        'allow the righteous to be moved.',
    title: 'Ilagay Mo ang Pasan, Huwag Buhatin Mag-isa',
    body: 'May larawan dito ng isang taong may bitbit na napakabigat, at may '
        'nag-aalok na tanggapin ito. "Ilagay mo ang iyong pasan sa Panginoon" — '
        'hindi ito paglilipat sandali lang tapos babawiin mo ulit, kundi tunay '
        'na pagpapaubaya. Ang pangako: "kaniyang aalalayan ka." Hindi sinabing '
        'wala kang problema, kundi hindi ka babagsak dahil may umaalalay. '
        'Sinulat ni David ito noong dumaranas siya ng pagtataksil at labis na '
        'pagkabalisa — kaya alam niya ang bigat na tinutukoy niya. Minsan '
        'hinahawakan natin ang problema natin nang mahigpit, na parang tayo lang '
        'ang makakasolusyon. Ang paanyaya: hindi mo kailangang buhatin ito '
        'mag-isa. May balikat na mas malakas na handang umako. Ilagay mo ito '
        'ngayon, at huwag mo nang bawiin.',
    prompt: 'Anong pasan ang binubuhat mo nang mag-isa na kaya mong ipaubaya '
        'na sa Diyos?',
  ),
  _Seed(
    id: 52,
    book: 'Isaias',
    chapter: 26,
    verseStart: 3,
    verseEnd: 3,
    ref: 'Isaias 26:3',
    tl: 'Iyong iingatan siya sa lubos na kapayapaan, na ang pagiisip ay '
        'sumasa iyo: sapagka\'t siya\'y tumitiwala sa iyo.',
    en: 'You will keep whoever\'s mind is steadfast in perfect peace, because '
        'he trusts in you.',
    title: 'Kung Saan Nakatuon ang Isip Mo',
    body: 'May koneksyon dito sa pagitan ng kapayapaan at kung saan nakatuon '
        'ang isip mo. "Na ang pagiisip ay sumasa iyo" — ibig sabihin, ang '
        'isip na nakatingin sa Diyos, hindi sa lahat ng dahilan ng pag-aalala. '
        'Ang kapayapaan dito ay hindi kawalan ng problema kundi katatagan sa '
        'gitna nito. Sinulat ni Isaias ito bilang awit ng pagtitiwala. Pansinin '
        'ang dahilan ng kapayapaan: "sapagka\'t siya\'y tumitiwala sa iyo." Hindi '
        'ito nagmumula sa pagkontrol ng lahat, kundi sa pagtitiwala sa Isang '
        'may hawak ng lahat. Kapag ang isip mo ay paikot-ikot sa "paano kaya" '
        'at "paano kung," subukan mong ibaling ito — kahit sandali — sa Diyos. '
        'Hindi mo kailangang malutas lahat sa isip mo. Ang kapayapaan ay '
        'nagsisimula sa kung saan mo ibinabaling ang atensyon mo.',
    prompt: 'Saan paikot-ikot ang isip mo ngayon, at paano mo ito maibabaling '
        'sa Diyos?',
  ),
  _Seed(
    id: 53,
    book: 'Mateo',
    chapter: 6,
    verseStart: 34,
    verseEnd: 34,
    ref: 'Mateo 6:34',
    tl: 'Kaya\'t huwag ninyong ikabalisa ang sa araw ng bukas: sapagka\'t ang '
        'araw ng bukas ay mababalisa sa kaniyang sarili. Sukat na sa kaarawan '
        'ang kaniyang kasamaan.',
    en: 'Therefore don\'t be anxious for tomorrow, for tomorrow will be anxious '
        'for itself. Each day\'s own evil is sufficient.',
    title: 'Isang Araw Muna',
    body: 'Napakadaling mabuhay sa "bukas" — sa mga bagay na maaaring mangyari, '
        'sa mga problemang hindi pa dumarating. Pero paalala ni Jesus: sapat na '
        'ang bawat araw sa sarili nitong hamon. Hindi niya sinasabi na huwag '
        'kang magplano; sinasabi niya na huwag mong buhatin ang bigat ng bukas '
        'ngayon pa lang. Karamihan sa kinakabahan natin ay hindi naman '
        'nangyayari — inuubos lang natin ang lakas natin sa mga bagay na hindi '
        'pa totoo. Sinabi ito ni Jesus sa gitna ng pagtuturo tungkol sa '
        'pag-aalala at pagtitiwala sa Diyos na nag-aalaga sa mga ibon at bulaklak. '
        'Kung nabibigatan ka sa dami ng iniisip mong mangyayari, subukan mong '
        'bawasan ang saklaw: ano ang kailangan ko lang harapin ngayon? Isang '
        'araw muna. May sapat na biyaya para sa araw na ito.',
    prompt: 'Anong "bukas" ang kinakabahan mo ngayon na hindi mo pa kailangang '
        'harapin?',
  ),
  _Seed(
    id: 54,
    book: 'Hebreo',
    chapter: 13,
    verseStart: 8,
    verseEnd: 8,
    ref: 'Hebreo 13:8',
    tl: 'Si Jesucristo ay siya ring kahapon at ngayon, oo at magpakailan man.',
    en: 'Jesus Christ is the same yesterday, today, and forever.',
    title: 'May Hindi Nagbabago',
    body: 'Sa mundong palaging nagbabago — mga tao, sitwasyon, kalusugan, '
        'ekonomiya — nakakapanatag na may Isang hindi nagbabago. Si Jesus '
        'kahapon, ngayon, at magpakailanman ay pareho. Ang kabaitan niya '
        'noong araw ay kabaitan pa rin ngayon; ang katapatan niya sa mga tao '
        'sa Bibliya ay katapatan pa rin sa iyo. Sinulat ito ng may-akda ng '
        'Hebreo sa mga taong dumaranas ng pagbabago at kawalan ng katiyakan. '
        'Sa panahong hindi mo alam kung ano ang aasahan bukas, may isang bagay '
        'na maaari mong sandalan nang buo: ang katangian ng Diyos ay hindi '
        'nagbabago. Hindi siya magiging mas maunawain o mas malayo depende sa '
        'mood. Kung pagod ka na sa mga bagay na nagbabago nang wala kang '
        'kontrol, may matatag na saligan na hindi matitinag. Doon ka maaaring '
        'magpahinga.',
    prompt: 'Anong pagbabago sa buhay mo ang nakakapagpakaba ngayon, at paano '
        'nakakatulong malaman na hindi nagbabago ang Diyos?',
  ),
  _Seed(
    id: 55,
    book: 'Awit',
    chapter: 103,
    verseStart: 2,
    verseEnd: 3,
    ref: 'Awit 103:2-3',
    tl: 'Purihin mo ang Panginoon, Oh kaluluwa ko, at huwag mong kalimutan ang '
        'lahat niyang mabubuting gawa. Na siyang nagpapatawad ng lahat mong mga '
        'kasamaan; na siyang nagpapagaling ng lahat mong mga sakit.',
    en: 'Praise Yahweh, my soul, and don\'t forget all his benefits, who '
        'forgives all your sins, who heals all your diseases,',
    title: 'Huwag Kalimutan',
    body: 'May kakaibang paalala si David sa sarili niya: "huwag mong '
        'kalimutan." Bakit? Dahil madali nating makalimutan ang mga mabubuting '
        'bagay na ginawa na sa atin ng Diyos. Kapag may bagong problema, '
        'nabubura sa isip natin ang lahat ng pagkakataong tumulong siya dati. '
        'Kaya sinasabihan ni David ang sariling kaluluwa na alalahanin — ang '
        'pagpapatawad, ang paggaling, ang lahat ng biyaya. Ito ay awit ng '
        'pasasalamat, isang aktibong pagpili na balikan ang kabutihan ng Diyos. '
        'Minsan ang pinakamagandang gamot sa pag-aalala ay ang pag-alala: '
        'balikan mo ang mga pagkakataong hindi ka pinabayaan. Kung nakakalimot '
        'kang mabuti ang Diyos, subukan mong isa-isahin — kahit sa isip lang — '
        'ang mga paraang tumulong siya sa iyo. Ang pag-alala ay nagpapalakas ng '
        'pananalig para sa kasalukuyan.',
    prompt: 'Anong mabuting bagay na ginawa ng Diyos sa buhay mo ang madalas '
        'mong makalimutan kapag may bagong problema?',
  ),
  _Seed(
    id: 56,
    book: 'Kawikaan',
    chapter: 27,
    verseStart: 17,
    verseEnd: 17,
    ref: 'Kawikaan 27:17',
    tl: 'Ang bakal ay nagpapatalas sa bakal; gayon ang tao ay nagpapatalas sa '
        'mukha ng kaniyang kaibigan.',
    en: 'Iron sharpens iron; so a man sharpens his friend\'s countenance.',
    title: 'Kailangan Mo ng Tunay na Kaibigan',
    body: 'May larawan dito ng dalawang bakal na naghahasaan — kailangan mo '
        'ng kasing-tibay para tumalas. Ibig sabihin, hindi tayo dinisenyong '
        'mabuhay nang mag-isa. Kailangan natin ng mga taong makakapagpabuti sa '
        'atin, magsasabi ng totoo kahit mahirap, tutulong sa atin lumago. Ang '
        'karunungang ito ay tungkol sa halaga ng tunay na pagkakaibigan — hindi '
        'ang mababaw kundi ang tunay na nakikialam sa buhay mo. Minsan ang '
        '"paghahasa" ay hindi komportable — may friction, may pagtutuwid. Pero '
        'ang tunay na kaibigan ay hindi ka lang pupurihin; kaya ka nitong '
        'itama nang may pagmamahal. Kung nag-iisa ka sa laban mo ngayon, baka '
        'kailangan mong lumapit sa isang taong pinagkakatiwalaan. At baka ikaw '
        'naman ang "bakal" na kailangan ng ibang tao ngayon.',
    prompt: 'Sino ang tunay na kaibigang nakakapagpabuti sa iyo, at kailangan '
        'mo bang lumapit sa kanila — o sila sa iyo?',
  ),
  _Seed(
    id: 57,
    book: 'Filipos',
    chapter: 4,
    verseStart: 19,
    verseEnd: 19,
    ref: 'Filipos 4:19',
    tl: 'At pupunan ng aking Dios ang bawa\'t kailangan ninyo ayon sa kaniyang '
        'mga kayamanan sa kaluwalhatian kay Cristo Jesus.',
    en: 'My God will supply every need of yours according to his riches in '
        'glory in Christ Jesus.',
    title: 'Pupunan Niya ang Kailangan Mo',
    body: 'Pansinin ang salitang "kailangan," hindi "gusto." Hindi ito pangako '
        'na makukuha mo ang bawat naisin mo, kundi na hindi mo kukulangin sa '
        'tunay mong kailangan. At tingnan kung saan kukuha ang Diyos: "ayon sa '
        'kaniyang mga kayamanan" — hindi mula sa kakaunti, kundi mula sa '
        'kasaganaan na hindi nauubos. Sinulat ni Pablo ito sa mga taong '
        'nagbigay sa kaniya kahit sila mismo ay may kakulangan; kaya alam niya '
        'ang tungkol sa pagtitiwala sa Diyos para sa panustos. Sa panahong '
        'nag-aalala ka tungkol sa pera, trabaho, o pang-araw-araw na '
        'pangangailangan, ang paalala: may nakakaalam ng kailangan mo, at may '
        'kakayahang magbigay. Hindi ibig sabihin walang kahirapan, kundi hindi '
        'ka mag-iisa sa pagharap dito. Isang araw muna; ibigay mo ang '
        'pangamba mo sa Isang nagmamalasakit.',
    prompt: 'Anong pangangailangan ang ikinakaba mo ngayon na kaya mong '
        'ipagkatiwala sa Diyos na nakakaalam nito?',
  ),
  _Seed(
    id: 58,
    book: 'Deuteronomio',
    chapter: 31,
    verseStart: 6,
    verseEnd: 6,
    ref: 'Deuteronomio 31:6',
    tl: 'Kayo\'y magpakalakas at magpakatapang, huwag kayong matakot, ni '
        'manglupaypay sa kanila: sapagka\'t ang Panginoon mong Dios ay siyang '
        'yumayaong kasama mo; hindi ka niya iiwan ni pababayaan ka.',
    en: 'Be strong and courageous. Don\'t be afraid or scared of them; for '
        'Yahweh your God himself is who goes with you. He will not fail you nor '
        'forsake you.',
    title: 'Hindi Ka Niya Iiwan',
    body: 'Ang pinakamalakas na parte ng verse na ito ay ang dulo: "hindi ka '
        'niya iiwan ni pababayaan ka." Marami sa atin ang may takot na maiwan — '
        'ng tao, ng suporta, ng mga minamahal. Pero may pangako dito na iba: '
        'ang Diyos ay hindi umaalis. Sinabi ito ni Moises sa mga taga-Israel '
        'bago sila pumasok sa isang bagong lupain na puno ng hindi tiyak. '
        'Natatakot sila, at ang paalala ay hindi "kaya niyo iyan" kundi '
        '"kasama niyo siya." Ang tapang ay hindi galing sa pagiging malakas '
        'mag-isa, kundi sa katiyakang may kasama ka. Kung natatakot kang '
        'harapin ang isang bago o mahirap na yugto, tandaan: hindi ka '
        'pababayaan. Hindi ka niya iiwan sa gitna. Kasama mo siya sa bawat '
        'hakbang, kahit sa hindi mo nakikitang paraan.',
    prompt: 'Saang bahagi ng buhay mo pakiramdam mong mag-isa ka, at paano '
        'nakakatulong ang pangakong hindi ka pababayaan?',
  ),
  _Seed(
    id: 59,
    book: 'Awit',
    chapter: 30,
    verseStart: 5,
    verseEnd: 5,
    ref: 'Awit 30:5',
    tl: 'Sapagka\'t ang kaniyang galit ay sangdali lamang; ang kaniyang paglingap '
        'ay habang buhay: ang iyak ay magtatagal ng magdamag, nguni\'t ang saya '
        'ay dumarating sa kinaumagahan.',
    en: 'For his anger is but for a moment. His favor is for a lifetime. '
        'Weeping may stay for the night, but joy comes in the morning.',
    title: 'Darating ang Umaga',
    body: 'May napakagandang larawan dito: "ang iyak ay magtatagal ng '
        'magdamag, nguni\'t ang saya ay dumarating sa kinaumagahan." Hindi '
        'sinasabi na walang gabi ng pag-iyak — kinikilala nito ang sakit. Pero '
        'may pangako: hindi habang buhay ang gabi. May umaga na darating. '
        'Sinulat ni David ito matapos siyang makaranas ng paggaling at pagbangon '
        'mula sa mahirap na panahon. Ang gabi ay tunay — hindi ito minamaliit. '
        'Pero pansamantala ito. Kung nasa gitna ka ng isang mahabang gabi '
        'ngayon — kalungkutan, pagkawala, kabiguan — hindi ito ang huling '
        'kabanata. Ang mga luha ngayon ay hindi walang hanggan. Kapit lang; '
        'may umagang darating, kahit hindi mo pa ito nakikita mula sa dilim. '
        'Ang paglingap ng Diyos ay habang buhay, mas matagal kaysa sa anumang '
        'gabi.',
    prompt: 'Anong "gabi" ang pinagdadaanan mo ngayon, at ano ang magbibigay '
        'sa iyo ng pag-asang darating ang umaga?',
  ),
  _Seed(
    id: 60,
    book: 'Apocalipsis',
    chapter: 21,
    verseStart: 4,
    verseEnd: 4,
    ref: 'Apocalipsis 21:4',
    tl: 'At papahirin niya ang bawa\'t luha sa kanilang mga mata; at hindi na '
        'magkakaroon ng kamatayan; hindi na magkakaroon pa ng dalamhati, o ng '
        'pananambitan man, o ng hirap pa man: ang mga bagay nang una ay '
        'naparam na.',
    en: 'He will wipe away every tear from their eyes. Death will be no more; '
        'neither will there be mourning, nor crying, nor pain any more. The '
        'first things have passed away.',
    title: 'May Darating na Wakas sa Lahat ng Luha',
    body: 'Ito ang isa sa pinakamatamis na pangako sa buong Bibliya — isang '
        'sulyap sa hinaharap kung saan ang Diyos mismo ang papahid ng bawat '
        'luha. Hindi lang basta matatapos ang sakit; may personal na haplos '
        'ng Diyos sa bawat pighati. Sinulat ito ni Juan bilang pangitain ng '
        'pag-asang naghihintay sa lahat ng nagtitiwala sa Diyos. Sa gitna ng '
        'mundong puno ng kamatayan, luha, at hirap, mahalagang malaman na hindi '
        'ito ang huling kabanata ng kasaysayan. May darating na panahon na '
        'walang sakit, walang pananambitan, walang kamatayan. Hindi ito '
        'pagtakas sa realidad ngayon, kundi pag-asa na nagbibigay-lakas sa '
        'kasalukuyan. Kung bigat na bigat ka ngayon sa hirap ng buhay, tandaan '
        'na ang lahat ng ito ay may katapusan — at ang katapusang iyon ay '
        'puno ng lambing, hindi paghuhukom.',
    prompt: 'Anong sakit o luha ang hinihintay mong pahirin ng Diyos, at paano '
        'nakakatulong ang pag-asa ng darating na wakas nito?',
  ),
];

/// Drift companions for the `verses` table, built from the DRAFT seed list.
List<VersesCompanion> get seedVerses => _seeds
    .map(
      (s) => VersesCompanion.insert(
        id: s.id,
        book: s.book,
        chapter: s.chapter,
        verseStart: s.verseStart,
        verseEnd: s.verseEnd,
        textTl: s.tl,
        textEn: s.en,
        referenceDisplay: s.ref,
      ),
    )
    .toList();

/// Drift companions for the `reflections` table, built from the DRAFT seed list.
/// One reflection per verse; reflection id mirrors the verse id for simplicity.
List<ReflectionsCompanion> get seedReflections => _seeds
    .map(
      (s) => ReflectionsCompanion.insert(
        id: s.id,
        verseId: s.id,
        titleTaglish: s.title,
        bodyTaglish: s.body,
        applicationPrompt: s.prompt,
      ),
    )
    .toList();
