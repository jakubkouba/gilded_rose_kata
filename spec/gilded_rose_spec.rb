require_relative '../gilded_rose'

describe GildedRose do

  describe '#update_quality' do
    let(:sell_in) {}
    let(:quality) {}
    let(:product) { Item.new('Ordinary Product', sell_in, quality) }
    let(:products) { [product] }
    let(:gilded_rose) { GildedRose.new(products) }

    subject(:update_quality) { gilded_rose.update_quality }

    describe 'ordinary product with sell_in = -1 and quality = 2' do
      let(:sell_in) { -1 }
      let(:quality) { 2 }

      it 'decreases quality by 2' do
        expect { update_quality }.to change { product.quality }.by(-2)
      end

      it 'decreases sell_in by 1' do
        expect { update_quality }.to change { product.sell_in }.by(-1)
      end
    end

    describe 'ordinary product with sell_in = 0 and quality = 2' do
      let(:sell_in) { 0 }
      let(:quality) { 2 }

      it 'decreases quality by 2' do
        expect { update_quality }.to change { product.quality }.by(-2)
      end

      it 'decreases sell_in by 1' do
        expect { update_quality }.to change { product.sell_in }.by(-1)
      end
    end

    describe 'ordinary product with sell_in = 2 and quality 2' do
      let(:sell_in) { 2 }
      let(:quality) { 2 }

      it 'decrease quality by 1' do
        expect { update_quality }.to change { product.quality }.by(-1)
      end

    end
  end
end
