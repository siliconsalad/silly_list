require 'silly_list'

class RSpec::Mocks::Double
  def *(n)
    doubles = []
    n.times do
      doubles << self.class.new
    end
    doubles
  end
end
