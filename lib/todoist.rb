require 'uri'
require 'json'
require 'faraday'

require 'todoist/configuration'

require 'todoist/base'
require 'todoist/project'
require 'todoist/item'
require 'todoist/note'

require 'todoist/version'

module Todoist
  class InvalidURIError < StandardError; end
  class InvalidJSONPathError < StandardError; end
  class InvalidJSONError < StandardError; end
  def configure
    raise InvalidArgument.new unless block_given?
    yield(Configuration)
  end
end
