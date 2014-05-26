
require 'spec_helper'
require 'todoist'

describe Todoist::Project do
  before :each do
    # It's possible to define stubbed request outside a test adapter block.
    stubs = Faraday::Adapter::Test::Stubs.new do |stub|
      stub.get('/getProjects') { [200, {}, '[]'] }
    end
  end
  it "should return all projects" do
    puts Todoist::Project.list.inspect
    expect(Todoist::Project.list) == []
  end
end
