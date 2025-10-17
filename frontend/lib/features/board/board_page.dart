import 'package:conference_bingo/config.dart';
import 'package:conference_bingo/features/board/bingo_checker.dart';
import 'package:conference_bingo/features/board/board_generator.dart';
import 'package:conference_bingo/features/board/board_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoardPage extends ConsumerStatefulWidget {
  final String boardHash;
  const BoardPage({super.key, required this.boardHash});

  @override
  ConsumerState<BoardPage> createState() => _BoardPageState();
}

class _BoardPageState extends ConsumerState<BoardPage> {
  List<String>? _boardItems;
  int _notifiedBingoCount = 0;

  @override
  void initState() {
    super.initState();
    _generateBoardItems();
  }

  void _generateBoardItems() {
    final activities = ref.read(bingoActivitiesProvider);
    final boardSize = ref.read(boardSizeProvider);
    _boardItems = generateBoardItems(widget.boardHash, activities, boardSize);
  }

  void _showBingoDialog(int bingoCount) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('BINGO!'),
        content:
            Text('Congratulations, you have completed $bingoCount line(s)!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Awesome!'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedItems = ref.watch(boardStateProvider(widget.boardHash));
    final notifier = ref.read(boardStateProvider(widget.boardHash).notifier);
    final boardSize = ref.watch(boardSizeProvider);
    final linesToWin = ref.watch(linesToWinProvider);

    ref.listen(boardStateProvider(widget.boardHash), (previous, next) {
      final currentBingoCount = BingoChecker.countBingos(next, boardSize);
      if (currentBingoCount >= linesToWin &&
          currentBingoCount > _notifiedBingoCount) {
        _showBingoDialog(currentBingoCount);
        setState(() {
          _notifiedBingoCount = currentBingoCount;
        });
      }
    });

    if (_boardItems == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Your BINGO Board'),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your BINGO Board'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: boardSize,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: boardSize * boardSize,
        itemBuilder: (context, index) {
          final isSelected = selectedItems.contains(index);
          return GestureDetector(
            onTap: () => notifier.toggle(index),
            child: Card(
              color: isSelected ? Colors.green.shade300 : Colors.blue.shade100,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _boardItems![index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
