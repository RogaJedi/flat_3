import 'package:flutter/material.dart';
import 'board_game_card.dart';
import 'board_game_detail_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Настольные Игры'),
      ),
      body: ListView(
        children: [
          BoardGameCard(
            name: 'Каркассон',
            imageUrl: 'https://hobbyworld.cdnvideo.ru/image/cache/hobbyworld/data/HobbyWorld/Karkasson/1000/Karkasson00-1200x800.jpg',
            shortDescription: 'Настольная игра про строительство города.',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BoardGameDetailPage(
                    name: 'Каркассон',
                    imageUrl: 'https://hobbyworld.cdnvideo.ru/image/cache/hobbyworld/data/HobbyWorld/Karkasson/1000/Karkasson00-1200x800.jpg',
                    fullDescription: 'Настольная игра \"Каркассон\" пользуется славой одной из лучших настольных игр мира. В чём превосходство \"Каркассона\"? В простых правилах, в многообразии партий, в их небольшой продолжительности, в отсутствии открытой конфронтации между игроками – это классический образец игры \"в германском стиле\".',
                  ),
                ),
              );
            },
          ),
          BoardGameCard(
            name: 'Unmatched',
            imageUrl: 'https://hobbygames.ru/image/data/Gaga/Unmatched_Bitva_Legend/UnMatched.jpg',
            shortDescription: 'Настольная игра про сражения величайших легенд.',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BoardGameDetailPage(
                    name: 'Unmatched',
                    imageUrl: 'https://hobbygames.ru/image/data/Gaga/Unmatched_Bitva_Legend/UnMatched.jpg',
                    fullDescription: 'Мифологические персонажи, герои мультфильмов и художественной литературы появляются на одном поле для сражения! "Unmatched. Битва Легенд" – игра с простыми правилами, воплощающая в реальность детские фантазии о невозможных встречах вымышленных героев из разных вселенных. Каждый том содержит в себе карты с новыми персонажами, которые можно мешать с колодами из других серий.',
                  ),
                ),
              );
            },
          ),
          BoardGameCard(
            name: 'Подземелья и пёсики',
            imageUrl: 'https://hobbygames.ru/image/cache/hobbygames_beta/data/-new/hobby-world/podzemelja-i-pjosiki/podzemelja-i-pesiki-00-1024x1024-wm.jpg',
            shortDescription: 'Настольная игра про побег из подземелья.',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BoardGameDetailPage(
                    name: 'Подземелья и пёсики',
                    imageUrl: 'https://hobbygames.ru/image/cache/hobbygames_beta/data/-new/hobby-world/podzemelja-i-pjosiki/podzemelja-i-pesiki-00-1024x1024-wm.jpg',
                    fullDescription: 'Добро пожаловать на состязание по побегу из подземелья! Нашим смелым хорошим мальчикам и девочкам предстоит спуститься в очень глубокие помещения (мы не знаем, кто их вырыл) и дать отпор страшным монстрам! Но наши участники не простые пёсики, а самые настоящие приключенцы. Кто из них соберёт больше всего вкусняшек и первым покинет мрачное подземелье?',
                  ),
                ),
              );
            },
          ),

        ],
      ),
    );
  }
}
