module Todoist
  BASE_URL = 'https://api.todoist.com/API/'
  class Base
    def self.token=(token)
      @@token = token
    end
    def self.http_get(path, params = {})
      run :get, path, params
    end
    def self.http_post(path, params = {})
      run :post, path, params
    end
    def http_get(path, params = {})
      self.class.get(path, params)
    end
    def http_post(path, params = {})
      self.class.post(path, params)
    end
    private
    def self.faraday
      @@faraday ||= Faraday.new(url: BASE_URL)
    end
    def self.run(method, path, params = {})
      params = params.merge(token: Configuration.token)
      response = faraday.send(method, path, params)
      JSON.parse(response.body)
    end
    protected
    def alfter_hash(hash)
      hash.each do |key, value|
        iv = "@#{key}"
        instance_variable_set iv, value
        unless self.respond_to? key
          self.class.send :define_method, key do
            instance_variable_get iv
          end
        end
      end
    end
  end
end
