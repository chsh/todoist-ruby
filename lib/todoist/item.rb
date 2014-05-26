module Todoist
  class Item
    def initialize(attrs)
      alfter_hash attrs
    end
    def project
      @project ||= Project.get self.project_id
    end
    def notes
      @notes ||= ItemNotes.new self
    end
    def self.get(id)
      Item.new self.class.getItemsById(id).first
    end

    def getItemsById(*ids)
      ids = [ids].flatten
      get('getItemsById', ids: ids.to_json)
    end
  end
end
