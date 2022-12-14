# IBAN Utilities Library

## Türkiye'de IBAN

**IBAN (International Bank Account Number - Uluslararası Banka Hesap Numarası)**, Türkiyede **26** karakterlik harf ve sayılardan oluşan uluslararası kabul görmüş bir koddur. Bu kod içerisindeki belirli her karakter grubu, ayrı bir bilgiyi içerir.

### Türkiye IBAN Standartları ([Vikipedi](https://tr.wikipedia.org/wiki/IBAN))

Türkiye'nin **IBAN** uzunluğu **26** hane olarak belirlenmiştir. Türkiye IBAN’ın biçimi aşağıdadır:

![IBAN Biçimi](https://upload.wikimedia.org/wikipedia/commons/b/b9/IBAN-Structure-TR.png)

- Oluşturulan **IBAN** içinde **“İ,Ç,Ğ,Ö,Ş,Ü”** harfleri ve **küçük harf** kullanılmaz .
- Türkiye’nin ülke kodu **ISO 3166** No.lu standarda göre “**TR**”dir.
- (Değişik fıkra: RG-5/8/2021 – 2021/5 Sayılı Tebliğ/3. md.) IBAN oluşturulurken kullanılacak ödeme hizmeti sağlayıcısı kodları Türkiye Cumhuriyet Merkez Bankası tarafından belirlenir.
- (Değişik fıkra: RG-5/8/2021 – 2021/5 Sayılı Tebliğ/3. md.) Hesap numarası alanı için standart bir format yoktur. Ancak hesap numarası olarak tespit edilen 16 hanenin sağa dayalı olarak yazılması ve varsa sol tarafındaki boşlukların sıfır ile doldurulması zorunludur.
- Rezerv Alan Bölümü, tüm hesap numaraları için **sıfır** olarak doldurulur.
- Kontrol basamaklarının hesaplanması ve doğrulanması, bu Tebliğin 2 ve 3 numaralı ekinde gösterilen ISO 7064 No.lu standarda göre oluşturulan MOD 97-10 yöntemi kullanılarak yapılır.


### IBAN Kodunun Detayları

**Türkiye**'de **IBAN** kodları **26** karakterden oluşur:

Bilgi | Karakter Grubu | Açıklama
------------ | ------------- | -------------
Örnek IBAN | TR330006100519786457841326 | Türkiye IBAN Numarası
Ülke Kodu | TR | 2 harfli ülke kodu
Kontrol Numarası | 33 | 2 haneli kontrol numarası
Banka Kodu | 00061 | Bankanın banka kodundan 5 karakter
Ulusal Kontrol Sayısı | 0 | Ulusal kod için 1 haneli kod
Banka Hesap Numarası | 0519786457841326 | Banka hesap numarası için 16 haneli kod

## Dünya'da IBAN

### İngiltere

**İngiltere**'de **IBAN** kodları **22** karakterden oluşur:

Bilgi | Karakter Grubu | Açıklama
------------ | ------------- | -------------
Örnek IBAN | GB29 NWBK 6016 1331 9268 19 | İngiltere IBAN Numarası
Ülke Kodu | GB | 2 harfli ülke kodu
Kontrol Numarası | 29 | 2 haneli kontrol numarası
Banka Kodu | NWBK | Bankanın banka kodundan 4 karakter
Sıralama Kodu | 601613 | Banka şubesi için 6 haneli sıralama kodu
Banka Hesap Numarası | 31926819 | Banka hesap numarası için 8 haneli kod

### Almanya

**Almanya**'de **IBAN** kodları **22** karakterden oluşur:

Bilgi | Karakter Grubu | Açıklama
------------ | ------------- | -------------
Örnek IBAN | DE89 3704 0044 0532 0130 00 | Almanya IBAN Numarası
Ülke Kodu | DE | 2 harfli ülke kodu
Kontrol Numarası | 89 | 2 haneli kontrol numarası
Banka Kodu (BLZ code) | 37040044 | Bankanın banka kodundan 8 karakter
Banka Hesap Numarası | 0532013000 | Banka hesap numarası için 10 haneli kod

### Fransa

**Fransa**'da **IBAN** kodları **27** karakterden oluşur:

Bilgi | Karakter Grubu | Açıklama
------------ | ------------- | -------------
Örnek IBAN | FR14 2004 1010 0505 0001 3M02 606 | Fransa IBAN Numarası
Ülke Kodu | FR | 2 harfli ülke kodu
Kontrol Numarası | 14 | 2 haneli kontrol numarası
Banka Kodu | 20041 | Bankanın banka kodundan 5 karakter
Şube Kodu | 01005 | Banka şubesi için 5 haneli kod
Ulusal Kontrol Sayısı | 06 | Ulusal kod için 2 haneli kod
Banka Hesap Numarası | 0500013M026 | Banka hesap numarası için 11 haneli kod

### İtalya

**İtalya**'da **IBAN** kodları **27** karakterden oluşur:

Bilgi | Karakter Grubu | Açıklama
------------ | ------------- | -------------
Örnek IBAN | IT60 X054 2811 1010 0000 0123 456 | İtalya IBAN Numarası
Ülke Kodu | IT | 2 harfli ülke kodu
Kontrol Numarası | 60 | 2 haneli kontrol numarası
Ulusal Kontrol Sayısı | X | Ulusal kod için 1 haneli kod
Banka Kodu | 05428 | Bankanın banka kodundan 5 karakter
Şube Kodu | 11101 | Banka şubesi için 5 haneli kod
Banka Hesap Numarası | 000000123456 | Banka hesap numarası için 12 haneli kod