require 'uri'
require 'json'
require 'faraday'

module Todoist
  class InvalidResponseError < StandardError; end
  def configure
    raise InvalidArgument.new unless block_given?
    yield(Configuration)
  end
end

require 'todoist/http'
require 'todoist/configuration'

require 'todoist/base'
require 'todoist/project'
require 'todoist/item'
require 'todoist/note'
require 'todoist/project_items'
require 'todoist/item_notes'

require 'todoist/version'
