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
  def update(attrs)
    updateItem(self.id, attrs)
  end
  def delete
    deleteItem(self.id)
  end

  def self.getItemsById(*ids)
    ids = [ids].flatten
    http.get('getItemsById', ids: ids.to_json)
  end
  def updateItem(id, attrs)
    http.get('updateItem', attrs.merge(id: id))
  end
  def self.deleteItems(*ids)
    ids = [ids].flatten
    http.get('deleteItems', ids: ids.to_json)
  end
  def deleteItem(id)
    self.class.deleteItems id
  end
end
