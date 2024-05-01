import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mayak/ui/constants.dart';

class AboutRestaurantPage extends StatefulWidget {
  @override
  _AboutRestaurantPageState createState() {
    return _AboutRestaurantPageState();
  }
}

class _AboutRestaurantPageState extends State<AboutRestaurantPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Color.fromARGB(180, 52, 52, 52)),
          backgroundColor: kPrimaryColor,
          title: Text('О ресторане',
              style: TextStyle(
                  color: Color.fromARGB(201, 67, 67, 67), fontSize: 18))),
      body: Center(
        child: Container(
          width: width * 0.9,
          child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: [
                Padding(padding: EdgeInsets.only(top: 20)),
                Text(
                  'О нас',
                  style: TextStyle(fontSize: 80, fontFamily: 'Moniqa'),
                ),
                Padding(padding: EdgeInsets.only(top: 5)),
                Text(
                  'mayak? Да!',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                Text(
                  'Валентино умеет удивлять. И его новое заведение вобрало в себя всё самое лучшее из бережно собранного Маэстро за его длинный и интересный профессиональный путь. Было бы намного правильнее и проще доверить обустройство нового заведения рукам профессионалов, но команда Валентино точно знала, как и что должно быть и вложила в каждый элемент заведения лучшее из впечатлений, эмоций, чтобы атмосфера напоминала лучшие моменты вашей жизни, оставляя приятное послевкусие и ощущение комфорта.',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                Text(
                  'Каждое блюдо приготовлено с соблюдением авторских технологий и не оставляет никого равнодушным. Уютное пространство, верность качеству, лучшие ингредиенты, итальянская щедрость и радушие - создают неповторимую атмосферу заведения, в котором хочется, чтобы время остановилось.mayak? Да!',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                Text(
                  'Как Бонтемпи удаётся сохранять в себе любовь к еде, а главное – искреннее и тёплое отношение к своему Гостю? Всё просто - ему повезло встретить свою главную Любовь, которая стала главной в его жизни, и по другому – невозможно!',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                Container(
                  width: width * 0.9,
                  child: Column(children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(
                                  color: Colors.white, width: 0.3) // <-- Radius
                              ),
                          elevation: 5,
                          minimumSize: Size(height * 0.43, width * 0.13),
                        ),
                        onPressed: () {
                          // showDialog(
                          //   context: context,
                          //   builder: (BuildContext context) {
                          //     return TableDialog();
                          //   },
                          // );
                        },
                        child: Text('Забронировать столик',
                            style: TextStyle(
                                color: Color.fromARGB(206, 53, 53, 53)))),
                  ]),
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                Text(
                  'Наш бренд шеф',
                  style: TextStyle(fontSize: 60, fontFamily: 'Moniqa'),
                ),
                Text(
                  'Валентино Бонтемпи \n (mayak Bontempi)',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Moniqa',
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  width: width / 1.3,
                  height: height / 1.8,
                  padding: EdgeInsets.all(2), // Border width
                  decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(15.0)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: SizedBox.fromSize(
                      size: Size.fromRadius(70), // Image radius
                      child: CachedNetworkImage(
                          filterQuality: FilterQuality.low,
                          imageUrl:
                              'https://mayak-vrn.ru/upload/iblock/26f/zp74zkpwkxbfybi9o1cn3imo1k52oex0.jpg',
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                Text(
                  'Известный итальянский шеф-повар, уже много лет живущий в России и искренне влюбленный в нашу страну. В ресторанном бизнесе он уже около 40 лет и достиг в нем феноменального успеха, став не только успешным ресторатором, но и выпустив несколько кулинарных книг-бестселлеров.',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                Text(
                  'Валентино родом из города Качезиа (Ломбардия), с «красным дипломом» окончил престижную высшую школу Caterina De Medici, где получил специальность шеф-повара. Маэстро Валентино стажировался и сотрудничал с лучшими итальянскими шеф-поварами, известными во всем мире. Опыт работы в легендарном ресторане Beauty Farm Villa Paradiso (Фазано, озеро Гарда, Италия), полученный во время сотрудничества с легендарным шеф-поваром Энцо Боски, особенно пригодился Валентино. Именно там он изучил технологию и основные приемы приготовления блюд высокой диетической гастрономии.',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                Container(
                  width: width * 0.9,
                  child: Column(children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(
                                  color: Colors.white, width: 0.3) // <-- Radius
                              ),
                          elevation: 5,
                          minimumSize: Size(height * 0.43, width * 0.13),
                        ),
                        onPressed: () {
                          // showDialog(
                          //   context: context,
                          //   builder: (BuildContext context) {
                          //     return TableDialog();
                          //   },
                          // );
                        },
                        child: Text('Забронировать столик',
                            style: TextStyle(
                                color: Color.fromARGB(210, 60, 60, 60)))),
                  ]),
                ),
                Padding(padding: EdgeInsets.only(top: 40)),
              ]),
        ),
      ),
    );
  }
}
