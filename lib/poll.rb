class Poll
  attr_reader :title, :candidates, :date

  def initialize(title, candidates, date = nil)
    @title = title
    @candidates = candidates
    @date = date
  end
end
