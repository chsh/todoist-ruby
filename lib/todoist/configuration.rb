module Todoist
  class Configuration
    def self.token=(value)
      @token = value
    end
    def self.token
      @token || ENV['TODOIST_API_TOKEN']
    end
  end
end
