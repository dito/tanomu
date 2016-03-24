require './app/models/events/base'

module Events
  class PullRequest < Events::Base
    attr_reader :payload

    def initialize(payload:)
      @payload = payload
    end

    def hook
      return unless payload
      return if assignee
      return unless team_name
      return unless new_assignee

      update_pull_request
    end

    private
    alias_method :team_name, :repository_name

    def new_assignee
      candidates.sample
    end
  end
end
