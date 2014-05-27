
require 'spec_helper'
require 'todoist'

describe Todoist::Project do
  before :each do
    # It's possible to define stubbed request outside a test adapter block.
    stubs = Faraday::Adapter::Test::Stubs.new do |stub|
      stub.get("/API/getProjects?token=#{Todoist::Configuration.token}") {
        [200, {}, '[]']
      }
    end
    Todoist::Configuration.set_adapter :test, stubs
  end
  it "should return all projects" do
    puts Todoist::Project.list.inspect
    expect(Todoist::Project.list) == []
  end
end
