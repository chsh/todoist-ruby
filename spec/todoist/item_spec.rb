
require 'spec_helper'
require 'todoist'

describe Todoist::Item do
  before :each do
    @project = Todoist::Project.new id: 1000200

    @item_hash_1 = {
        due_date: nil, assigned_by_uid: 123, is_archived: 0, labels: [],
        sync_id: 12345, in_history: 0, has_notifications: 0,
        date_added: 'Wed 21 May 2014 04:15:51 +0000',
        indent: 1, children: nil, content: 'hello-item', is_deleted: 0,
        user_id: 123, due_date_utc: nil, id: 2000100, priority: 1,
        item_order: 5, responsible_uid: nil, project_id: 1000200, collapsed: 0,
        checked: 0, date_string: ''
    }

    # It's possible to define stubbed request outside a test adapter block.
    stubs = Faraday::Adapter::Test::Stubs.new do |stub|
      stub.get("/API/addItem?token=#{Todoist::Configuration.token}&project_id=#{@project.id}&content=hello-item&priority=1") {
        [200, {}, @item_hash_1.to_json]
      }
      stub.get("/API/updateItem?token=#{Todoist::Configuration.token}&id=#{@item_hash_1[:id]}&content=hello-world") {
        item_hash_1_after = @item_hash_1.merge content: 'hello-world'
        [200, {}, item_hash_1_after.to_json]
      }
      stub.get("/API/deleteItems?token=#{Todoist::Configuration.token}&ids=%5B#{@item_hash_1[:id]}%5D") {
        [200, {}, 'ok']
      }
    end
    Todoist::Configuration.set_adapter :test, stubs
  end
  it 'should create item with content/ update/delete.' do
    item = @project.items.create content: 'hello-item', priority: 1
    expect(item) == Todoist::Item.new(@item_hash_1)
    expect(item.content) == 'hello-item'
    item.update content: 'hello-world'
    expect(item.content) == 'hello-world'
    expect(item.delete) == 'ok'
  end
end
