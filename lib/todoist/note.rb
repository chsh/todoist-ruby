module Todoist
  class Note
    def initialize(attrs)
      alfter_hash attrs
    end
    def item
      @item ||= Item.get self.item_id
    end
  end
end
