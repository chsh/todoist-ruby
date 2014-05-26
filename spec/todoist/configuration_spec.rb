
require 'spec_helper'
require 'todoist'

describe Todoist::Configuration do
  it "should keep token from env" do
    expect(Todoist::Configuration.token) == ENV['TODOIST_API_TOKEN']
  end
end
