require_relative 'spec_helper'
require_relative '../lib/gilded_rose'

describe GildedRose do

  describe '#update_quality' do
    let(:sell_in) {}
    let(:quality) {}
    let(:product_name) { 'Ordinary Product' }
    let(:product) { Item.new(product_name, sell_in, quality) }
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

    describe 'ordinary product with sell_in = 2 and quality 0' do
      let(:sell_in) { 2 }
      let(:quality) { 0 }

      it 'does not change quality from 0' do
        expect { update_quality }.not_to change { product.quality }.from(0)
      end
    end

    describe 'Aged Brie' do
      let(:product_name) { 'Aged Brie' }

      describe 'with sell_in = 10 and quality 50' do
        let(:sell_in) { 10 }
        let(:quality) { 50 }

        it 'does not change quality from 50' do
          expect { update_quality }.not_to change { product.quality }.from(50)
        end
      end

      describe 'with sell_in = 10 and quality 40' do
        let(:sell_in) { 10 }
        let(:quality) { 40 }

        it 'increase quality by 1' do
          expect { update_quality }.to change { product.quality }.by(1)
        end
      end

      context 'when SellIn is -1 and Quality 40' do
        let(:sell_in) { -1 }
        let(:quality) { 40 }

        it 'increase quality by 1' do
          expect { update_quality }.to change { product.quality }.to(42)
        end
      end
    end

    describe 'Sulfuras, Hand of Ragnaros' do
      let(:product_name) { 'Sulfuras, Hand of Ragnaros' }

      describe 'when SellIn is 10 and quality is 30' do
        let(:sell_in) { 10 }
        let(:quality) { 30 }

        it 'does not decrease sell_in value' do
          expect { update_quality }.not_to change { product.sell_in }.from(10)
        end

        it 'does not decrease quality' do
          expect { update_quality }.not_to change { product.quality }.from(30)
        end
      end
    end

    describe 'Backstage passes to a TAFKAL80ETC concert' do
      let(:product_name) { 'Backstage passes to a TAFKAL80ETC concert' }

      context 'when SellIn is 15 and Quality is 9' do
        let(:sell_in) { 15 }
        let(:quality) { 9 }

        it 'decrease SellIn by 1' do
          expect { update_quality }.to change { product.sell_in }.to(14)
        end

        it 'increase Quality by 1' do
          expect { update_quality }.to change { product.quality }.to(10)
        end
      end

      context 'when SellIn is 10 and Quality 9' do
        let(:sell_in) { 10 }
        let(:quality) { 9 }

        it 'increase Quality by 2' do
          expect { update_quality }.to change { product.quality }.to(11)
        end
      end

      context 'when SellIn is 4 and Quality 9' do
        let(:sell_in) { 4 }
        let(:quality) { 9 }

        it 'increase Quality by 3' do
          expect { update_quality }.to change { product.quality }.to(12)
        end
      end

      context 'when SellIn is 0 and Quality 9' do
        let(:sell_in) { 0 }
        let(:quality) { 9 }

        it 'drops Quality to 0' do
          expect { update_quality }.to change { product.quality }.to(0)
        end
      end

      context 'when SellIn is 20 and Quality 50' do
        let(:sell_in) { 20 }
        let(:quality) { 50 }

        it 'Does not increase Quality above 50' do
          expect { update_quality }.not_to change { product.quality }.from(50)
        end
      end

      context 'when SellIn is -1 and Quality 20' do
        let(:sell_in) { -1 }
        let(:quality) { 20 }

        it 'drops quality to 0' do
          expect { update_quality }.to change { product.quality }.to(0)
        end
      end
    end
  end
end
