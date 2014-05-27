
require 'spec_helper'

describe Todoist::Project do
  before :each do
    @project_hash_1 = {
        last_updated: "1401070591.7", color: "#dddddd", collapsed: 0, inbox_project: true,
        archived_date: nil, cache_count: 0, id: 1000100, indent: 1, name: "Inbox",
        user_id: 123, is_deleted: 0, item_order: 0, archived_timestamp: 0, is_archived: 0
    }
    @project_hash_2 = {
        last_updated: "1401108075.88", color: "#dc4fad", collapsed: 0,
        archived_date: nil, cache_count: 0, id: 1000200, indent: 1, name: "project-2nd",
        user_id: 123, is_deleted: 0, item_order: 1, archived_timestamp: 0, is_archived: 0
    }
    # It's possible to define stubbed request outside a test adapter block.
    stubs = Faraday::Adapter::Test::Stubs.new do |stub|
      stub.get("/API/getProjects?token=#{Todoist::Configuration.token}") {
        [200, {}, [@project_hash_1, @project_hash_2].to_json]
      }
    end
    Todoist::Configuration.set_adapter :test, stubs
  end
  it "should return all projects" do
    expect(Todoist::Project.list) == [
        Todoist::Project.new(@project_hash_1),
        Todoist::Project.new(@project_hash_2)
    ]
  end
end
