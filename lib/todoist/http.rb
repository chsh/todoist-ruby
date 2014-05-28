
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
    body = response.body
    return 'ok' if body == 'ok'
    begin
      JSON.parse(body)
    rescue
      raise Todoist::InvalidResponseError.new body
    end
  end
  def self.build_faraday
    Faraday.new(url: Todoist::Configuration.base_url) do |builder|
      builder.adapter *Todoist::Configuration.adapter
    end
  end
end
