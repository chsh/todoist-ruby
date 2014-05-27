class Todoist::Item < Todoist::Base
  def initialize(attrs)
    alter_hash attrs
  end
  def project
    @project ||= Todoist::Project.get self.project_id
  end
  def notes
    @notes ||= Todoist::ItemNotes.new self
  end
  def self.get(id)
    Todoist::Item.new getItemsById(id).first
  end

  def getItemsById(*ids)
    ids = [ids].flatten
    http.get('getItemsById', ids: ids.to_json)
  end
end
