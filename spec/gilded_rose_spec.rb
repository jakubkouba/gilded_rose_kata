require_relative '../gilded_rose'

describe GildedRose do

  describe '#update_quality' do
    context 'item name is not Aged Brie' do
      context 'and quality is bigger than 0' do
        context 'and item name is not Sulfuras, Hand of Ragnaros' do
          it 'decrease item quality' do
            items       = [Item.new('Some name', 10, 5)]
            gilded_rose = GildedRose.new(items)
            expect { gilded_rose.update_quality }.to change { items.first.quality }.by(-1)
          end
        end
      end
    end
  end
end
