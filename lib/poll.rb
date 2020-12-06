require 'date'

class Poll
  attr_reader :title, :candidates, :date, :votes
  class InvalidCandidateError < StandardError
  end
  class InvalidVoterError < StandardError
  end
  class InvalidDateError < StandardError
  end

  def initialize(title, candidates, date = nil)
    @title = title
    @candidates = candidates
    if date != nil
      @date = Date.parse(date)
    end
    @votes = []
  end

  def add_vote(vote)
    unless candidates.include?(vote.candidate)
      raise InvalidCandidateError
    end

    @votes.each do |voter|
      if voter.voter == vote.voter
        raise InvalidVoterError
      end
    end
    
    if @date != nil
      if vote.date > @date
        raise InvalidDateError
      end
    end

    @votes.push(vote)
  end
  def count_votes
    result = {}
    @candidates.each do |candidate|
      result[candidate] = 0
    end

    @votes.each do |vote|
      result[vote.candidate] += 1
    end

    result.sort_by { |_key, value| value}.reverse.to_h
  end
end
