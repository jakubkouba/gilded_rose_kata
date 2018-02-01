## GR Specs

- product is ordinary SellIn = -1 quality 2 => quality = 0, sell_in = -2 
- product is ordinary SellIn = 0 quality 2 => quality = 0
- product is ordinary SellIn > 0 quality 2, sell_in: 2, quality: 2 => quality: 1
- product is ordinary SellIn > 0 quality 0, sell_in: 2, quality: 0 => quality: 0
- product is `Aged Brie` quality is 50; quality: 50 => quality: 50
- product is `Aged Brie` SellIn > 0; Quality < 50; SellIn = 10; Quality = 40 => Quality = 41 
- product is `Sulfura` SellIn > 0; Quality > 0; SellIn = 10; Quality = 30 => Quality = 30; SellIn = 10
- product is `Backstage Pass` with SellIn > 10; Quality > 0; SellIn = 15; Quality = 10 => Quality = 9
- product is `Backstage Pass` with SellIn <= 10; Quality > 0; SellIn = 10; Quality = 9 => Quality = 11
- product is `Backstage Pass` with SellIn <= 5 ; Quality > 0; SellIn = 4; Quality = 9 => Quality = 13
- product is `Backstage Pass` with SellIn < 5
- product is `Backstage Pass` with SellIn < 0
- product is `Conjured`

