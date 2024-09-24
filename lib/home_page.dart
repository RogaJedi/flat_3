import 'package:flutter/material.dart';
import 'board_game_card.dart';
import 'board_game_detail_page.dart';
import 'notes.dart';

final List<Note> notes = [
  Note(
      'Каркассон',
      'Настольная игра про строительство города.',
      'https://hobbyworld.cdnvideo.ru/image/cache/hobbyworld/data/HobbyWorld/Karkasson/1000/Karkasson00-1200x800.jpg',
      'Настольная игра \"Каркассон\" пользуется славой одной из лучших настольных игр мира. В чём превосходство \"Каркассона\"? В простых правилах, в многообразии партий, в их небольшой продолжительности, в отсутствии открытой конфронтации между игроками – это классический образец игры \"в германском стиле\".'),
  Note(
      'Unmatched',
      'Настольная игра про сражения величайших легенд.',
      'https://hobbygames.ru/image/data/Gaga/Unmatched_Bitva_Legend/UnMatched.jpg',
      'Мифологические персонажи, герои мультфильмов и художественной литературы появляются на одном поле для сражения! "Unmatched. Битва Легенд" – игра с простыми правилами, воплощающая в реальность детские фантазии о невозможных встречах вымышленных героев из разных вселенных. Каждый том содержит в себе карты с новыми персонажами, которые можно мешать с колодами из других серий.'),
  Note(
      'Подземелья и пёсики',
      'Настольная игра про побег из подземелья.',
      'https://hobbygames.ru/image/cache/hobbygames_beta/data/-new/hobby-world/podzemelja-i-pjosiki/podzemelja-i-pesiki-00-1024x1024-wm.jpg',
      'Добро пожаловать на состязание по побегу из подземелья! Нашим смелым хорошим мальчикам и девочкам предстоит спуститься в очень глубокие помещения (мы не знаем, кто их вырыл) и дать отпор страшным монстрам! Но наши участники не простые пёсики, а самые настоящие приключенцы. Кто из них соберёт больше всего вкусняшек и первым покинет мрачное подземелье?'),
];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Настольные Игры'),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (BuildContext context, int index){
          final note = notes[index];
          return BoardGameCard(
            name: note.name,
            imageUrl: note.imageUrl,
            shortDescription: note.text,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>BoardGameDetailPage(
                          name: note.name,
                          imageUrl: note.imageUrl,
                          fullDescription: note.fullinfo
                      ),
                  ),
              );
            },
          );
        }
      ),
    );
  }
}
