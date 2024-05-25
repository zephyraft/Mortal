# 游戏开始 start_game
```json
{"type":"start_game"}
```

# 一局的开始 start_kyoku
```json
{
  "type": "start_kyoku",
  "bakaze": "E",
  "dora_marker": "3s",
  "kyoku": 3,
  "honba": 0,
  "kyotaku": 0,
  "oya": 2,
  "scores": [
    22000,
    23700,
    26000,
    28300
  ],
  "tehais": [
    [
      "?",
      "?",
      "?",
      "?",
      "?",
      "?",
      "?",
      "?",
      "?",
      "?",
      "?",
      "?",
      "?"
    ],
    [
      "?",
      "?",
      "?",
      "?",
      "?",
      "?",
      "?",
      "?",
      "?",
      "?",
      "?",
      "?",
      "?"
    ],
    [
      "1m",
      "1m",
      "4m",
      "5m",
      "1p",
      "5p",
      "8p",
      "1s",
      "4s",
      "4s",
      "6s",
      "8s",
      "N"
    ],
    [
      "?",
      "?",
      "?",
      "?",
      "?",
      "?",
      "?",
      "?",
      "?",
      "?",
      "?",
      "?",
      "?"
    ]
  ]
}
```

- bakaze（场风）: 东风（E）
- dora_marker（宝牌指示牌）: 三索（3s）
- kyoku（局数）: 第三局
- honba（本场数）: 0
- kyotaku（供托数）: 0
- oya（庄家）: 2
- scores（分数）: [22000, 23700, 26000, 28300]
- tehais（手牌）: 四个玩家的初始手牌（第3个玩家的手牌已知）

东1局的东南西北四个玩家分别是玩家0,1,2,3

# 摸牌 tsumo
```json
{"type":"tsumo","actor":2,"pai":"6p"}
```

玩家2摸到了6筒。

# 打牌 dahai
```json
{"type":"dahai","actor":2,"pai":"1s","tsumogiri":false}
```

玩家2打出了1索，tsumogiri为false表示这张牌不是直接摸到就打出的，而是从手牌中选择的。

# 鸣牌（pon、reach等）
```json
{"type":"pon","actor":0,"target":1,"pai":"W","consumed":["W","W"]}
```
玩家0碰了玩家1打出的西风牌（W），并使用了另外两张西风牌。
