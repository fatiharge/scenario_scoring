# Scenario Scoring

Bu proje, belirli türdeki verileri skorlayan ve raporlar oluşturan dinamik bir yazılımdır.

## Açıklama

Bu yazılım, belirlenen kurallara göre verileri skorlar ve bu skorlara dayalı bir rapor oluşturur.
Yazılım, çeşitli veri türlerini ve kuralları işleyebilme yeteneğine sahiptir. Bu, yazılımın geniş
bir veri yelpazesini ve karmaşık iş kurallarını işleyebileceği anlamına gelir. Yazılım, JSON, dizi
ve birleştirme senaryolarını destekler. Bu, yazılımın farklı veri yapılarıyla çalışabilmesini
sağlar. Her senaryo için özelleştirilebilir filtreler mevcuttur. Bu filtreler, belirli bir
senaryonun hangi verileri işleyeceğini belirler.

Her filtre için özelleştirilebilir skorlama mevcuttur. Bu, her filtre için belirli bir skorlama
algoritmasının uygulanabileceği anlamına gelir. Yazılım ayrıca toplam skorlama süresini hesaplar.
Bu, her senaryonun ne kadar sürede tamamlandığını belirler.

Yazılım, skorları temel alarak bir rapor oluşturur. Bu rapor, skorların bir özeti ve analizi içerir.
Rapor, farklı formatlarda oluşturulabilir. Bu, raporun çeşitli ihtiyaçlara göre
özelleştirilebileceği anlamına gelir.

Sonuç olarak, bu yazılım, belirlenen kurallara göre verileri skorlayan ve bu skorlara dayalı bir
rapor oluşturan dinamik bir araçtır. Yazılımın esnekliği ve özelleştirilebilirliği, geniş bir veri
ve kural setini işleyebilmesini sağlar.

## Özellikler

- JSON, dizi ve birleştirme senaryolarını destekler
- Her senaryo için özelleştirilebilir filtreler
- Her filtre için özelleştirilebilir skorlama
- Toplam skorlama süresini hesaplar

## Bağımlılıklar

- Dart: '>=3.3.3 <4.0.0'
- Flutter SDK
- very_good_analysis: ^5.1.0

## Kullanım

Senaryoları ve filtreleri `lib/scenarios` dizininde bulabilirsiniz. Her senaryo için bir Dart
dosyası bulunmaktadır. Bu dosyalar, senaryonun nasıl çalıştığını ve hangi filtrelerin kullanıldığını
belirler.

## Gerçek Hayat Örneği

Bu örnek, belirli bir veri setini filtrelemek ve skorlamak için kullanılan test senaryolarını temsil
eder. Bu senaryolar, bir dizi filtre kullanarak belirli koşulları karşılayan verileri belirler ve bu
filtrelerin her biri belirli bir skorla sonuçlanır.

Öncelikle, `data1` adlı bir veri seti oluşturulmuştur. Bu veri seti, bir kişinin adı, yaşı,
becerileri, adresi ve projeleri gibi bilgileri içerir.

Sonra, `ConcatenateFilter` adlı bir filtre oluşturulmuştur. Bu filtre, bir dizi alt filtreyi
birleştiren bir üst filtre görevi görür. Bu örnekte, alt filtreler `JsonFilter`
ve `JsonFilter.array` kullanılarak oluşturulmuştur. Bu filtreler, belirli bir anahtarın belirli bir
değere sahip olup olmadığını kontrol eder. Örneğin, `JsonFilter` filtresi, 'age' anahtarının
değerinin 45'ten küçük veya eşit olup olmadığını kontrol eder.

`ConcatenateFilter` filtresi, alt filtrelerin sonuçlarını birleştirmek için bir işlem kullanır. Bu
örnekte, 'and' işlemi kullanılmıştır, yani tüm alt filtrelerin sonuçları 'true' olmalıdır.

Son olarak, `Scenario` adlı bir nesne oluşturulmuştur. Bu nesne, filtreleri uygulayarak ve sonuçları
hesaplayarak senaryoyu çalıştırır. Bu örnekte, `calculateScore` fonksiyonu, veri setinin skorunu
hesaplar.

Bu kod parçaları, belirli bir veri setini filtrelemek ve skorlamak için bir senaryo oluşturmayı ve
çalıştırmayı gösterir. Bu tür bir senaryo, belirli koşulları karşılayan verileri belirlemek ve bu
verilere bir skor atamak için kullanılabilir.

```dart

final data1 = {
  'name': 'John Doe',
  'age': 30,
  'skills': [
    {'language': 'Java'},
    {'language': 'Dart'},
    {'language': 'Python'},
  ],
  'address': {
    'street': '20 W 34th St',
    'city': 'New York',
    'country': 'United States',
  },
  'projects': [
    {
      'name': 'Project 1',
      'description': 'Description of Project 1',
      'languages': 'Python',
    },
    {
      'name': 'Project 2',
      'description': 'Description of Project 2',
      'languages': 'C++',
    },
    {
      'name': 'Project 3',
      'description': 'Description of Project 3',
      'languages': 'Dart',
    },
  ],
};

final filter = ConcatenateFilter(
  concatenateOperator: ConcatenateOperations.and,
  filters: [
    JsonFilter(
      key: 'age',
      value: 45,
      operator: JsonFilterOperations.lessThanOrEqual,
      successScore: 1,
    ),
    JsonFilter.array(
      key: 'skills.language',
      value: 'Dart',
      arrayOperator: ArrayFilterOperations.contains,
      successScore: 0,
    ),
    JsonFilter(
      key: 'address.country',
      value: 'United States',
      operator: JsonFilterOperations.equals,
      successScore: 0,
    ),
    JsonFilter(
      key: 'age',
      value: 18,
      operator: JsonFilterOperations.greaterThanOrEqual,
      successScore: 0,
    ),
    JsonFilter.array(
      key: 'skills.language',
      value: 'C#',
      arrayOperator: ArrayFilterOperations.notContains,
      successScore: 0,
    ),
    ConcatenateFilter(
      concatenateOperator: ConcatenateOperations.or,
      filters: [
        ConcatenateFilter(
          concatenateOperator: ConcatenateOperations.and,
          successScore: 10,
          filters: [
            JsonFilter(
              key: 'age',
              value: 23,
              operator: JsonFilterOperations.greaterThanOrEqual,
              successScore: 0,
            ),
            JsonFilter(
              key: 'age',
              value: 33,
              operator: JsonFilterOperations.lessThan,
              successScore: 0,
            ),
          ],
        ),
        JsonFilter.array(
          key: 'skills.language',
          value: 'Java',
          arrayOperator: ArrayFilterOperations.contains,
          successScore: 20,
        ),
        JsonFilter.array(
          key: 'skills.language',
          value: 'Python',
          arrayOperator: ArrayFilterOperations.contains,
          successScore: 15,
        ),
        JsonFilter.array(
          key: 'projects.languages',
          value: 'Dart',
          arrayOperator: ArrayFilterOperations.summing,
          successScore: 40,
        ),
        JsonFilter.array(
          key: 'projects.languages',
          value: 'Assembly',
          arrayOperator: ArrayFilterOperations.summing,
          successScore: 23,
        ),
      ],
    ),
  ],
);

final scenario = Scenario<dynamic>(filter: filter);

final response1 = scenario.calculateScore(data1);

print(response1);
```

## Lisans

Bu proje [MIT](LICENSE) lisansı altında lisanslanmıştır.