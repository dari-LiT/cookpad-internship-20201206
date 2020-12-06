class Vote
  attr_reader :voter, :candidate, :date

  def initialize(voter, candidate, date = nil)
    @voter = voter
    @candidate = candidate
    if date == nil
      @date = Date.today
    else
      @date = Date.parse(date)
    end
  end
end
