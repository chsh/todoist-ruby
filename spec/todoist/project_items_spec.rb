
require 'spec_helper'
require 'todoist'

describe Todoist::ProjectItems do
  before :each do
    @project_hash = {
        last_updated: "1401108075.88", color: "#dc4fad", collapsed: 0,
        archived_date: nil, cache_count: 0, id: 1000200, indent: 1, name: "project-2nd",
        user_id: 123, is_deleted: 0, item_order: 1, archived_timestamp: 0, is_archived: 0
    }
    @project = Todoist::Project.new @project_hash

    @item_hash_1 = {
        due_date: nil, assigned_by_uid: 123, is_archived: 0, labels: [],
        sync_id: 12345, in_history: 0, has_notifications: 0,
        date_added: 'Wed 21 May 2014 04:15:51 +0000',
        indent: 1, children: nil, content: '経理がんばろう！', is_deleted: 0,
        user_id: 123, due_date_utc: nil, id: 2000100, priority: 1,
        item_order: 5, responsible_uid: nil, project_id: 1000200, collapsed: 0,
        checked: 0, date_string: ''
    }
    @item_hash_2 = {
        due_date: nil, assigned_by_uid: 123, is_archived: 0, labels: [],
        sync_id: 12346, in_history: 0, has_notifications: 0,
        date_added: 'Mon 05 May 2014 07:32:42 +0000', indent: 1, children: nil,
        content: 'Registration via web', is_deleted: 0,
        user_id: 123, due_date_utc: nil, id: 2000200, priority: 1,
        item_order: 6, responsible_uid: 234, project_id: 1000200,
        collapsed: 0, checked: 0, date_string: ''
    }

    # It's possible to define stubbed request outside a test adapter block.
    stubs = Faraday::Adapter::Test::Stubs.new do |stub|
      stub.get("/API/getUncompletedItems?token=#{Todoist::Configuration.token}&project_id=#{@project.id}") {
        [200, {}, [@item_hash_1, @item_hash_2].to_json]
      }
    end
    Todoist::Configuration.set_adapter :test, stubs
  end
  it 'should return all items at one project' do
    expect(@project.items.uncompleted) == [
        Todoist::Item.new(@item_hash_1),
        Todoist::Item.new(@item_hash_2)
    ]
  end
end
