module SillyList
  class UniqFifo
    include List

    attr_reader :list

    def initialize(list=[], max_size: 0)
      @list = init_list(list, max_size)
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
      list.push(*item) unless item.nil?
      list.pop if size_exceeded?
    end

    def remove
      list.delete_at(0)
    end

    private

    # Ensures that the list does not exceed the max size
    #
    # @param [Array<Object>] list to be initialized
    # @param [Integer] max size
    # @return [Array<Object>] list
    def init_list(list, max_size)
      list[0..max_size-1]
    end

    # Checks if list have exceeded the max size
    #
    # @return [Boolean]
    def size_exceeded?
      return false if @max_size.zero?
      list.size > @max_size
    end

  end
end