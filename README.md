# StokTakipSistemi
Microsoft SQL Server ile Stok Takip Sistemi
1.Kısa Sistem Açıklaması
 Projemizin temel amacı bir iş yerinin ürünlerinin satışını, girişini, miktarını, ürünü alan müşterileri ve girişi yapan personel takibini yapacak bir stok takip ve barkod sisteminin analizini ve tasarımını yapmaktır.
Toptan ve perakende satış yapan bir mağaza için olmazsa olmazlardan biri ürünlerinin stok takibidir. Bizzat proje sahibi olarak babamın da bu sektörde iş yaptığı dönemde iş yerimizdeki en büyük ihtiyaç bir stok takip sistemdir. Toptan alan bayilerin takibi ve perakende ile toptan satış arasındaki fiyat takipsizliği en can sıkıcı olaydır. Bu sebeplerden ötürü stok takip sistemimiz müşterinin ihtiyaçlarını tam karşılamak dikkatlice düşünülmelidir.
 Bu sistem bir masaüstü program olarak tasarlanmıştır. Sistemimizin hedefleri şunlardır:
1.	Satıcının ürün takibine kolaylık sağlaması
2.	Toptan ve perakende müşterilerin ayrılması ve ürün fiyatlarının buna göre değişim göstermesi
3.	Toptan ürün alan bayilerin sistemde tutulması
4.	Ürünü alan müşteri bilgilerinin tutulması
5.	Ürünü sistemi giren personel kaydı
6.	Uygulanan indirimlerin fiyatlara sistemde yansıması
7.	Müşteri iadeleri ve şikâyetlerinin sistemde kaydı tutulması
   1.2. Kapsam Tanımı
 Stok takip ve barkod sistemi masaüstü uygulama olarak tasarlanmıştır. Bu sistem geliştirildikten sonra satıcının ürünlerini stok durumu ve müşteri takibi gibi temel sorunlarından tamamen kurtulmuş olacaktır.

 
1.2. Sistem Gereksinimlerini Belirleme
 Piyasada hâlâ eski usul deftere ürün adedi yazma ya da toptan ürün satılan müşterilerin takibini yapma gibi devrin gerisinde uygulamalar dönmektedir. Bu projemizde amaçlanan piyasada daha çok alım satım ile uğraşan firmaların stok takibinin çağın gereklerine uygun şekilde firmaları piyasadaki büyük rekabette birkaç adım öne geçirmektir.
 Sistemimiz tamamen firma sahibi ve personeli için masaüstü bir uygulama olarak tasarlanmış olup hâli hazırda bir firmanın ihtiyaçlarına tasarlanmıştır. Sistemimizde ürünün bilgileri, hangi firmadan alındığı, toptan alan bayilerin tutulduğu, çalışan bilgilerinin, markaların hatta firma isterse ürünlerine toplu indirim uygulaması için indirim bölümü, müşteri bilgileri ve ürünlerden ne kadar kâr elde edeceğine dair bir iş yerinin bütün ihtiyaçlarını karşılamak üzere programlanmış bir masaüstü uygulamasıdır. Sistemden kullanıcı firmanın firmanın istekleri ise şunlardır:   
1.	Personelin giriş yapabileceği masaüstü uygulama.
2.	Ürün bilgiler girişi.
3.	Kullanıcı sisteme farklı işlemler gerçekleştirebilir.
4.	Kullanıcı verileri değiştirebilir.
5.	Kullanıcı tüm ürün bilgilerini görebilir.
6.	Kullanıcı net kârını görebilir.
7.	Kullanıcı toptan ürün alan bayilerini görebilir.
8.	 Ürün iadesi yapılabilir.
9.	Müşteri şikâyetleri alınabilir.
10.	Ürünlere indirim uygulanabilir.
  1.3. Ana Kısıtlar 
Veri Tutarlılığı
İstenilen bilgilerden herhangi biri girilmediği takdirde uyarı verilmeli.

Zaman
Sistemde zaman kısıtlaması yoktur.

Uyumluluk
Sadece masaüstü uygulaması olarak tasarlanmış olup veri tabanı ile uyumlu çalışması amaçlanmaktadır. 

   1.4. Kavramsal Tasarım
Sistemde müşterinin adı, soyadı, mail adresi, ev telefonu, iş telefonu, cep telefonu, adresi, doğum tarihi, yaşadığı şehir, müşteri tipi (toptan ya da perakende) ve toptancı müşteri ise bayi bilgileri tutulmakta. Bu bilgiler müşteri takibi kolaylaştırmakta ve ürün iade ve şikâyet bölümlerinde kolaylık sağlamaktadır. Stok takibinin kolaylaştırılması açısından ürün bilgileri ürün adı, modeli, seri numarası, adedi, geliş tarihi, geliş fiyatı, perakende satış fiyatı, toptan satış fiyatı, geliş fiyatı ve satış fiyatı çıkarılınca elde edilen kâr, ürünü sisteme giren personelin bilgileri ve ürün markası gibi parametreli tutmaktadır. Bu bilgiler firmanın stok takibini, satış fiyatlarını ve kârını hesaplamak takip etmek için mükemmel derecede kolaylık sağlamaktadır ve ürün bilgileri ürün iade ve indirimlerin hesaplanmasında yardımcı olmaktadır. Sistemde firma dilerse indirim yapabilmesi ve bu indirimli fiyatları sistemde gösterebilmek için indirim kodu, indirim yüzdesi, indirim tarihi, indirimli fiyatı, indirimli fiyat ile elde edilen kâr ve ürün bilgileri yer alan bir bölümde mevcuttur. Ürün bilgilerini hangi çalışanın girdiğine dair bilgileri içinde bulunduran bölümde ise çalışanın yaşadığı şehir, adı, soyadı, mail adresi, ev telefonu, cep telefonu, adresi ve doğum tarihi gibi bilgileri içinde bulunduran kısımda ürünlerin bilgilerini değiştiren personelin bilinmesi firma içinde personel takibi ve güvenlik açısından oldukça öneme sahip olacaktır. Ürünlerin hangi markanın ürünü olduğunu bilmek için sistemde markanın hangi şehirde olduğu, hangi ülkede olduğu, adı, numarası, adresi ve ürünü firmaya pazarlayan kişi gibi bilgiler tutulmaktadır. Firma sadece perakende satış yapmadığı için müşteri tipini belirlemesi şarttır. Bu yüzden perakende müşteri (1) ve toptan müşteri (2) diye iki farklı müşteri tipi bulunmaktadır. Şikâyetler bölümünde ise müşteri bilgileri, müşteri tipi, şikâyet detayları, tarihi ve durumu gibi parametreler bulunmaktadır. Ürün iade kısmında ise müşteri bilgileri, ürün bilgileri, indirimli ise indirim bilgileri, ürün markası ve iade sebebi tutulur. Toptan müşteriler içinde bayi bölümü vardır bu bölümde bayinin olduğu şehir, müşterinin adı, soyadı, firmasının adı, adresi, iş telefonu ve cep telefonu gibi bilgiler bulunmaktadır. Bunlara ek olarak personele kolaylık sağlamak için sistemde şehirlerin isimleri ve plaka numaraları sabittir. Firma sadece Marmara ve Ege bölgelerine çalıştığı için bu bölgelerde bulunan şehirlerin isimler kayıt altındandır.           
1.5.Potansiyel Sistem Kullanıcıları
Firma Sahibi: Tüm stok takibi müşteri takibini görür.
Çalışanlar (Personel): Ürün giriş çıkışlarını ve müşteri bilgilerini sisteme girebilir.




