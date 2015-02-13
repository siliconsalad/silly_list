module SillyList
  # Class UniqFifo designed to manage First In First Out array.
  # It ensures that items are uniq.
  #
  # The array can have a max size or be illimited (then max_size must be 0)
  #
  # @example
  #   my_array = SillyList::UniqFifo.new([1,2,3], max_size: 2)
  #   my_array.list #=> [1,2]
  #   my_array.add(3)
  #   my_array.list #=> [3,1]
  #   my_array.add([4,5])
  #   my_array.list #=> [4,5]
  class UniqFifo

    attr_reader :list, :max_size

    def initialize(list=[], max_size: 0)
      @list     = init_list(list, max_size)
      @max_size = max_size
    end

    # Checks if list is empty
    #
    # @return [Boolean]
    def empty?
      list.empty?
    end

    # Adds an item to the list
    #
    # @param [<Object, Array>] object to be added
    # @return [Nothing]
    def add(item)
      return unless item

      delete(item)
      add_at_beginning(item)
      remove_last if size_exceeded?
    end

    private

    # Removes the excess of items
    #
    # @return [Nothing]
    def remove_last
      index = list.size - max_size
      list.pop(index)
    end

    # Ensures that the list does not exceed the max size
    #
    # @param [<Array>] list to be initialized
    # @return [<Array>] list
    def init_list(list, max_size)
      list[0..max_size-1]
    end

    # Delete all the occurence of item in the list
    #
    # @param [<Object>] item to be deleted
    # @return [Nothing]
    def delete(item)
      list.delete(item)
    end

    # Insert item at the beginning of the list
    #
    # @param [<Object>] item to be added
    # @return [Nothing]
    def add_at_beginning(item)
      list.unshift(*item)
    end

    # Checks if list have exceeded the max size
    #
    # @return [Boolean]
    def size_exceeded?
      return false if max_size.zero?
      list.size > max_size
    end

  end
end
