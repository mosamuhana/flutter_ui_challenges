import '../../../../core/constants.dart';
import 'article.dart';

Article getArticle() {
  return Article(
    title: 'Lorem ipsum dolor sit amet',
    author: 'DLohani',
    description:
        'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Aperiam, ullam? Fuga doloremque repellendus aut sequi officiis dignissimos, enim assumenda tenetur reprehenderit quam error, accusamus ipsa? Officiis voluptatum sequi voluptas omnis. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Aperiam, ullam? Fuga doloremque repellendus aut sequi officiis dignissimos, enim assumenda tenetur reprehenderit quam error, accusamus ipsa? Officiis voluptatum sequi voluptas omnis.',
    image: '$STORE_BASE_URL/img%2F2.jpg?alt=media',
    category: 'Technology',
    date: 'Oct 21, 2017',
    likes: '20.2k',
    comments: '2.2k',
  );
}
