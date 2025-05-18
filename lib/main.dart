import 'package:flutter/material.dart';

List<double> listaCoisas = [9.99, 17.99, 11.99, 3.99, 8.99, 7.99];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loja',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const GridScreen(),
    );
  }
}

class GridScreen extends StatefulWidget {
  const GridScreen({super.key});

  @override
  State<GridScreen> createState() => _GridScreenState();
}

double valorTotal = 0.0;

class _GridScreenState extends State<GridScreen> {
  List<Map<String, String>> items = [
    {
      'title': 'Farinha\nR\$${listaCoisas[0]}',
      'image':
          'https://dcdn-us.mitiendanube.com/stores/003/776/300/products/farinha-deusa-biju-500g-a6028844b31ce2af3317055251146125-1024-1024.png',
    },
    {
      'title': 'Café\nR\$${listaCoisas[1]}',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5Pt4kUCULOFOIyRRU1YgNt0SjDCG7ZxKRDA&s',
    },
    {
      'title': 'Maçã\nR\$${listaCoisas[2]} por Kg',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_2KiYYM3IQPuc007U4EU_Z__oW2tGW-ZK6g&s',
    },
    {
      'title': 'Banana\nR\$${listaCoisas[3]} por Kg',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEHTv3-_lQogGhExylbvUHianXvOuwk6nI8g&s',
    },
    {
      'title': 'Refrigerante\nR\$${listaCoisas[4]}',
      'image':
          'https://phygital-files.mercafacil.com/catalogo/uploads/produto/refrigerante_conti_3l_laranja_7ca3e766-8829-4279-9322-8bb28792557d.png',
    },
    {
      'title': 'Leite\nR\$${listaCoisas[5]}',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShZKdKT-Oike0Lkl3pxi6aT7gAcyn7xDyFLg&s',
    },
  ];

  double valorTotal = 0.0;
  void adicionarAoCarrinho(double valor) {
    setState(() {
      valorTotal += valor;
    });
    print('Total: R\$${valorTotal.toStringAsFixed(2)}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Loja')),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 colunas
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),

                  child: ElevatedButton(
                    onPressed: () {
                      adicionarAoCarrinho(listaCoisas[index]);
                    },

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          items[index]['image']!,
                          width: 175,
                          height: 175,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          items[index]['title']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Retângulo azul
          Container(
            width: 700,
            height: 80,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 0, 0, 0),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                'Carrinho: R\$${valorTotal.toStringAsFixed(2)}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
