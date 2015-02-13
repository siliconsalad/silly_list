require 'spec_helper'

class FakeList < SillyList::UniqFifo
end


describe SillyList::UniqFifo do

  subject { FakeList.new }

  describe '#empty?' do

    it 'is empty after creation if web pass nothing to it' do
      expect(subject.empty?).to eq true
    end

    it 'is not empty when not empty list is given' do
      list = subject.class.new([double, double])
      expect(list.empty?).to eq false
    end

    it 'is no more empty after an addition' do
      subject.add(double)
      expect(subject.empty?).to eq false
    end

  end

  describe '#list' do
    it 'limits size of list at initialization' do
      limit          = 3
      list           = [double, double, double, double]
      uniq_fifo_list = subject.class.new(list, max_size: limit)
      expect(uniq_fifo_list.list.size).to eq limit
    end

    it 'does not limit size of the list when max size is not defined' do
      list           = [double, double, double, double]
      uniq_fifo_list = subject.class.new(list)
      expect(uniq_fifo_list.list.size).to eq list.size
    end
  end

  describe '#add' do
    it 'adds en item' do
      item_1 = double
      subject.add(item_1)
      expect(subject.list).to eq [item_1]
    end

    it 'does not add nil' do
      subject.add(nil)
      expect(subject.empty?).to eq true
    end

    it 'adds an array' do
      arr_1 = [double]
      subject.add(arr_1)
      expect(subject.list).to eq(arr_1)
    end

    it 'adds the last insertion at the last position of the list' do
      item_1 = double
      item_2 = double
      subject.add(item_1)
      subject.add(item_2)
      expect(subject.list).to eq([item_1, item_2])
    end

  end

  describe '#remove' do
    it 'returns the first added item' do
      item_1 = double
      item_2 = double
      subject.add(item_1)
      subject.add(item_2)
      expect(subject.remove).to eq item_1
    end

    it 'removes the first added item' do
      item_1 = double
      item_2 = double
      subject.add(item_1)
      subject.add(item_2)
      subject.remove
      expect(subject.list).to eq [item_2]
    end

  end

end