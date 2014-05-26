module Todoist
  class HTTP
    def self.get(path, params = {})
      run :get, path, params
    end
    def self.post(path, params = {})
      run :post, path, params
    end
    def self.faraday
      @@faraday ||= Faraday.new(url: Todoist::Configuration.base_url)
    end
    def self.run(method, path, params = {})
      params = params.merge(token: Configuration.token)
      response = faraday.send(method, path, params)
      JSON.parse(response.body)
    end
  end
end
