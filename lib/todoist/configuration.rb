module Todoist
  class Configuration
    def self.token=(value)
      @token = value
    end
    def self.token
      @token || ENV['TODOIST_API_TOKEN']
    end
    def self.base_url=(value)
      @base_url = value
    end
    def self.base_url
      @base_url || 'https://api.todoist.com/API/'
    end
  end
end
