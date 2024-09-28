import 'package:flutter/material.dart';
import 'board_game_card.dart';
import 'board_game_detail_page.dart';
import 'notes.dart';
import 'add_note_screen.dart';



final Note Sample1 = Note(
  name: 'Каркассон',
  text: 'Настольная игра про строительство города.',
  imageUrl: 'https://hobbyworld.cdnvideo.ru/image/cache/hobbyworld/data/HobbyWorld/Karkasson/1000/Karkasson00-1200x800.jpg',
  fullinfo: 'Настольная игра \"Каркассон\" пользуется славой одной из лучших настольных игр мира. В чём превосходство \"Каркассона\"? В простых правилах, в многообразии партий, в их небольшой продолжительности, в отсутствии открытой конфронтации между игроками – это классический образец игры \"в германском стиле\".'
);

final Note Sample2 = Note(
    name: 'Unmatched',
    text: 'Настольная игра про сражения величайших легенд.',
    imageUrl: 'https://hobbygames.ru/image/data/Gaga/Unmatched_Bitva_Legend/UnMatched.jpg',
    fullinfo: 'Мифологические персонажи, герои мультфильмов и художественной литературы появляются на одном поле для сражения! "Unmatched. Битва Легенд" – игра с простыми правилами, воплощающая в реальность детские фантазии о невозможных встречах вымышленных героев из разных вселенных. Каждый том содержит в себе карты с новыми персонажами, которые можно мешать с колодами из других серий.'
);

final Sample3 = Note(
    name: 'Подземелья и пёсики',
    text: 'Настольная игра про побег из подземелья.',
    imageUrl: 'https://hobbygames.ru/image/cache/hobbygames_beta/data/-new/hobby-world/podzemelja-i-pjosiki/podzemelja-i-pesiki-00-1024x1024-wm.jpg',
    fullinfo: 'Добро пожаловать на состязание по побегу из подземелья! Нашим смелым хорошим мальчикам и девочкам предстоит спуститься в очень глубокие помещения (мы не знаем, кто их вырыл) и дать отпор страшным монстрам! Но наши участники не простые пёсики, а самые настоящие приключенцы. Кто из них соберёт больше всего вкусняшек и первым покинет мрачное подземелье?'
);


class HomePage extends StatefulWidget {
  @override
  _NotesListScreenState createState() => _NotesListScreenState();
}

class _NotesListScreenState extends State<HomePage> {
  List<Note> notes = [Sample1, Sample2, Sample3];

  void _navigateToAddNoteScreen(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddNoteScreen(onNoteAdded:  this.addNewNote)),
    );

    if (result != null && result.isNotEmpty) {
      setState(() {
        notes.add(result);
      });
    }
  }

  void addNewNote(Note newNote) {
    setState(() {
      notes.add(newNote);
    });
  }

  void _removeNote(int index) async {
    bool confirm = await ConfirmDialog(context);
    if (confirm) {
      setState(() {
        notes.removeAt(index);
      });
    }
  }

  Future<bool> ConfirmDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Подтверждение удаления'),
          content: Text('Вы уверены, что хотите удалить эту позицию?'),
          actions: <Widget>[
            TextButton(
              child: Text('Нет'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: Text('Да'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    ) ?? false;
  }


  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Настольные Игры'),
      ),
      body: notes.isEmpty
          ? Center(child: Text('Пока что тут пусто, добавьте что-нибудь!'))
          : ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            final note = notes[index];
            return ListTile(
              title: BoardGameCard(
                  name: note.name,
                  imageUrl: note.imageUrl,
                  shortDescription: note.text,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            BoardGameDetailPage(
                                name: note.name,
                                imageUrl: note.imageUrl,
                                fullDescription: note.fullinfo
                            ),
                      ),
                    );
                  }),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => _removeNote(index),
              ),
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToAddNoteScreen(context),
        child: Icon(Icons.add),
        tooltip: 'Add Note',
      ),
    );
  }
}


