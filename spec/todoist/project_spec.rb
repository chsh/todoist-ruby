
require 'spec_helper'
require 'todoist'

describe Todoist::Project do
  it "should return all projects" do
    expect(Todoist::Project.list) == []
  end
end
