module SillyList
  # Class UniqLifo designed to manage Last In First Out array (stack)
  # It ensures that items are uniq.
  #
  # The array can have a max size or be illimited (then max_size must be 0)
  #
  # @example
  #   my_array = SillyList::UniqLifo.new([1,2,3], max_size: 2)
  #   my_array.list #=> [1,2]
  #   my_array.add(3)
  #   my_array.list #=> [3,1]
  #   my_array.add([4,5])
  #   my_array.list #=> [4,5]
  #   my_array.remove #=> 4
  #   my_array.list #=> [5]
  class UniqLifo

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
    # @return [UniqLifo]
    def add(item)
      return unless item

      delete(item)
      add_at_beginning(item)
      remove_last if size_exceeded?

      self
    end

    # Deletes the first item of the list
    #
    # @return [Object] removed item
    def remove
      list.delete_at(0)
    end

    private

    # Removes the excess of items
    #
    # @return [Array<Object>] array of removed item
    def remove_last
      index = list.size - max_size
      list.pop(index)
    end

    # Ensures that the list does not exceed the max size
    #
    # @param [Array<Object>] list to be initialized
    # @param [Integer] max size
    # @return [Array<Object>] list
    def init_list(list, max_size)
      list[0..max_size-1]
    end

    # Delete all the occurence of item in the list
    #
    # @param [Object] item to be deleted
    # @return [Object, nil] deleted item or nil
    def delete(item)
      list.delete(item)
    end

    # Insert item at the beginning of the list
    #
    # @param [Object] item to be added
    # @return [Array<Object>] list
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
