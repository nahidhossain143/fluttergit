import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          title: const Text(
            'Book List',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueGrey[500],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          BookCard(
            'Priyotomeshu',
            'Humayun Ahmed',
            '4.7',
            'https://i.pinimg.com/564x/9e/8a/0e/9e8a0ef25fe5633a740aa9ad193f01de.jpg',
          ),
          BookCard(
            'Aronno',
            'Humayun Ahmed',
            '4.4',
            'https://i.pinimg.com/564x/e2/ba/84/e2ba84e23cd8eb41e19e19277a255c42.jpg',
          ),
          BookCard(
            'Epitaph',
            'Humayun Ahmed',
            '4.6',
            'https://i.pinimg.com/564x/84/d6/fd/84d6fde76367357487435d7f33f9ba3b.jpg',
          ),
        ],
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  final String bookName;
  final String authorName;
  final String rating;
  final String img;

  const BookCard(this.bookName, this.authorName, this.rating, this.img);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Image.network(
              img,
              width: 120,
              height: 150,
              fit: BoxFit.cover,
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(bookName),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(authorName),
                          Text('Rating: $rating'),
                        ],
                      ),
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white60,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BuyNowPage(
                              bookName: bookName,
                              imageUrl: img,
                              author: authorName,
                              description: 'Romantic novel',
                              price: 6.25,
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.add_shopping_cart),
                      label: const Text('Buy Now'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuyNowPage extends StatelessWidget {
  final String bookName;
  final String imageUrl;
  final String author;
  final String description;
  final double price;

  const BuyNowPage({
    required this.bookName,
    required this.imageUrl,
    required this.author,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buy Now'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            Text('Book Name: $bookName'),
            const SizedBox(height: 8.0),
            Text('Author: $author'),
            const SizedBox(height: 8.0),
            Text('Description: $description'),
            const SizedBox(height: 8.0),
            Text('Price: \$$price'),
            const SizedBox(height: 16.0),


            DropdownButton<String>(
              items: const [
                DropdownMenuItem(
                  child: Text('Payment Method'),
                  value: 'Payment Method',
                ),
                DropdownMenuItem(
                  child: Text('Bkash'),
                  value: 'Bkash',
                ),
                DropdownMenuItem(
                  child: Text('Nagad'),
                  value: 'Nagad',
                ),
                DropdownMenuItem(
                  child: Text('Cash On Delivery'),
                  value: 'Cash On Delivery',
                ),
              ],
              onChanged: (String? value) {

              },
              value: 'Payment Method',
            ),

            const Spacer(),


            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
