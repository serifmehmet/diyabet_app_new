import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class PrivacyTextView extends StatelessWidget {
  const PrivacyTextView({Key? key}) : super(key: key);

  final String privacyText = '''KarbApp Gizlilik Sözleşmesi
===========================

**Son güncelleme tarihi: 04.05.2023**

Burada belirtilen gizlilik politikası ve kullanım koşulları; KARBAPP'ın Google Play Store ve IOS App Store'da yayınlanan bütün mobil uygulamaları için geçerlidir. Bu uygulamaları mobil cihazınıza yükleyerek, bu metinde yer alan gizlilik politikasını ve kullanım koşullarını kabul etmiş sayılırsınız. Bu koşulları kabul etmiyorsanız bu uygulamaları mobil cihazınıza yüklemeyiniz.

KARBAPP diyabetli bireyler için geliştirilmiş bir karbonhidrat sayımı uygulamasıdır. Tükettiğiniz besinleri uygulamaya girerek her öğünde aldığınız karbonhidrat miktarını hesaplayabilir ve besin tüketim kaydı günlüğü tutabilirsiniz. Kayıtlı kullanıcı olarak giriş sağladığınızda uygulama diyabet ile ilgili bazı bilgilerinizi (insülin düzeltme faktörü, insülin/karbonhidrat oranları, açlık kan şekeri değeri, açlık kan şekeri hedefleri) kaydetmenizi isteyecektir. İleri düzey (3.düzey) karbonhidrat sayımı uygulaması yapan bir diyabetli iseniz, her öğünde yapacağınız bolus insülin dozunu uygulama yardımıyla hesaplayabileceksiniz. Girilen bilgilerin doğruluğu kişinin kendi sorumluğunda olup, KARBAPP buradan doğacak herhangi olumsuz bir durumdan sorumlu tutulamaz. Uygulamamızda girilen tüm veriler şifreli sunucularda sadece sizlerin görebileceği şekilde depolanacaktır ve 3. şahıs ya da kurumlar ile paylaşım izni vermediğiniz sürece paylaşılmayacaktır.

KARBAPP, kaliteli ve yararlı bir uygulama hizmeti sunmak için her zaman gereken özeni ve duyarlılığı gösterecektir. Buna rağmen, uygulamamızda yer alan içeriklerin beklentilerinizi karşılayacağı, size yararlı olacağı veya kesin doğru bilgiler içereceğine dair hiçbir taahhütte bulunmamaktayız. Bu sebeple, uygulamamızdan kaynaklı yaşanacak herhangi bir olumsuz durum için KARBAPP'ı sorumlu tutamayacağınızı kabul etmektesiniz.

KARBAPP, bu uygulamaların güvenliği konusunda alınabilecek tüm önlemleri almak için gereken ölçüde çaba sarf eder ve Google Play Geliştirici Programı Politikaları sözleşmesi kapsamındaki yükümlülükleri yerine getirir. Bununla birlikte; internet ve dijital ortamlar yeterli düzeyde güvenli alanlar değildir. Bu yüzden size yüzde yüz güvenli bir hizmet sunacağımız konusunda herhangi bir garantide bulunmamaktayız.

Uygulamalarımız sadece Google Play Store ve IOS App Store'da yer almaktadır. Bu uygulamaların bizim bilgimiz dışında başka bir android ya da IOS mağazasında yer alması durumunda, buradan yapılacak yüklemelerden KARBAPP sorumlu tutulamaz.

Bu uygulamalarda, üçüncü taraflara ait reklamlar ve linkler yer alabilir. Bu üçüncü taraflara ait reklamların ve linklerin niteliğinden, içeriğinden, güvenliğinden veya bunlardan kaynaklı oluşabilecek zararlardan KARBAPP'ı sorumlu tutamayacağınızı kabul etmektesiniz. Google tarafından yayınlanan reklamlara ilişkin ayarlarınızı nasıl düzenleyeceğinizi, reklam ayarları sayfasından öğrenebilirsiniz.

Bu uygulamada yer alan sesli, yazılı ve görsel öğelerden ve yazılımlardan oluşan bütün içeriğe ilişkin her türlü telif hakkı KARBAPP'a aittir. Uygulamanın telif haklarıyla korunan içeriğini; kopyalama, çoğaltma, yeniden yayımlama, parçalarına ayırma, tekrar kamuya sunma vb. eylemlerde bulunmayacağınızı kabul etmektesiniz.

Burada belirtilen koşullarla ilgili görüş ve önerilerinizi, <karbapp@opentec.agency> mail adresinden bize iletebilirsiniz.

KARBAPP; bu Gizlilik Politikası ve Kullanım Koşulları metninde değişiklik yapabilir. Yapılan değişiklikler anında yürürlüğe girecektir. Değişiklik yaptığımız tarihi, "son güncelleme tarihi" olarak en alt kısımda belirtiriz.''';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        actionsIconTheme: const IconThemeData(
          color: Color(0xff000000),
        ),
        iconTheme: const IconThemeData(
          color: Color(0xff000000),
        ),
      ),
      body: Markdown(data: privacyText),
    );
  }
}
