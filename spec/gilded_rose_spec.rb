require_relative '../gilded_rose'

describe GildedRose do

  describe '#update_quality' do

    describe 'ordinary product with sell_in = -1 and quality = 2' do

      it 'decreases quality by 2' do
        product     = Item.new('Ordinary Product', -1, 2)
        products    = [product]
        gilded_rose = GildedRose.new(products)

        expect { gilded_rose.update_quality }.to change { product.quality }.by(-2)
      end
    end
  end
end
