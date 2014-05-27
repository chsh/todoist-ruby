
class Todoist::HTTP
  def self.get(path, params = {})
    run :get, path, params
  end
  def self.post(path, params = {})
    run :post, path, params
  end
  def self.faraday
    @@faraday ||= build_faraday
  end
  def self.clear_faraday
    @@faraday = nil
  end
  def self.run(method, path, params = {})
    params = params.merge(token: Todoist::Configuration.token)
    response = faraday.send(method, path, params)
    JSON.parse(response.body)
  end
  def self.build_faraday
    Faraday.new(url: Todoist::Configuration.base_url) do |builder|
      builder.adapter *Todoist::Configuration.adapter
    end
  end
end
