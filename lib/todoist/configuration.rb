class Todoist::Configuration
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
  def self.set_adapter(*args)
    Todoist::HTTP.clear_faraday
    @default_adapter = args
  end
  def self.adapter
    @default_adapter || [Faraday.default_adapter]
  end
end
