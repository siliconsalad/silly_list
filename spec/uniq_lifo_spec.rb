require 'spec_helper'

class FakeList < SillyList::UniqLifo
end

describe SillyList::UniqLifo do

  describe '#empty?' do
    it 'is empty after creation if we pass nothing to it' do
      expect(subject.empty?).to eq true
    end

    it 'is not empty when not empty list is given' do
      @list = double * 2
      expect(subject.empty?).to eq false
    end

    it 'is no more empty after an addition' do
      subject.add(double)
      expect(subject.empty?).to eq false
    end
  end

  describe '#list' do
    it 'limits size of list at initialization' do
      @max_size = 3
      @list     = double * 4
      expect(subject.list.size).to eq @max_size
    end

    it 'does not limit size of the list when max size is not defined' do
      @list = double * 4
      expect(subject.list.size).to eq @list.size
    end
  end

  describe '#add' do
    it 'adds an item' do
      item_1 = double
      subject.add(item_1)
      expect(subject.list).to eq([item_1])
    end

    it 'does not add nil' do
      subject.add(nil)
      expect(subject.empty?).to eq(true)
    end

    it 'adds an array' do
      arr_1 = [double]
      subject.add(arr_1)
      expect(subject.list).to eq(arr_1)
    end

    it 'adds the last insertion at the first position of the list' do
      item_1, item_2 = double * 2
      subject.add(item_1)
      subject.add(item_2)
      expect(subject.list).to eq([item_2, item_1])
    end

    context 'max size is reached' do
      it 'does not change the size of the list' do
        @max_size  = 2
        @list      = double * 2
        subject.add(double)
        expect(subject.list.size).to eq 2
      end

      it 'pushes out the oldest item' do
        @max_size = 2
        oldest_item, item, newest_item = double * 3
        subject.add(oldest_item).add(item).add(newest_item)
        expect(subject.list).not_to include(oldest_item)
      end

      it 'adds the item' do
        limit = 2
        item_1, item_2, item_3 = double * 3
        uniq_lifo_list = subject.class.new([item_1], max_size: limit)
        uniq_lifo_list.add(item_2)
        uniq_lifo_list.add(item_3)
        expect(uniq_lifo_list.list).to include(item_3)
      end

    end

    context 'item is added twice' do
      before do
        @an_item = double
        subject.add(@an_item)
        subject.add(double)
        subject.add(@an_item)
      end

      it 'keeps only one item' do
        expect(subject.list.count(@an_item)).to eq(1)
      end

      it 'keeps the last insertion and remove the first' do
        expect(subject.list.index(@an_item)).to eq(0)
      end
    end
  end

  describe '#remove' do
    it 'returns the last added item' do
      item = double
      subject.add(item)
      expect(subject.remove).to eq(item)
    end

    it 'removes the last added item' do
      item_1, item_2 = double * 2
      subject.add(item_1).add(item_2)
      subject.remove
      expect(subject.list).to eq [item_1]
    end
  end

  private

  def subject
    @subject ||= FakeList.new(@list, max_size: @max_size)
  end

end
