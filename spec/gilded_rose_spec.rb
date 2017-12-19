require_relative '../gilded_rose'

describe GildedRose do

  describe '#update_quality' do
    let(:product) { Item.new('Ordinary Product', -1, 2) }
    let(:products) { [product] }
    let(:gilded_rose) { GildedRose.new(products) }

    subject { gilded_rose.update_quality }

    describe 'ordinary product with sell_in = -1 and quality = 2' do

      it 'decreases quality by 2' do
        expect { subject }.to change { product.quality }.by(-2)
      end

      it 'decreases sell_in by 1' do
        expect { subject }.to change { product.sell_in }.by(-1)
      end
    end

    describe 'ordinary product with sell_in = 0 and quality = 2' do

      it 'decreases quality by 2' do
        expect { subject }.to change { product.quality }.by(-2)
      end
    end
  end
end
