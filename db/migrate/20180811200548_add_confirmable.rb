class AddConfirmable < ActiveRecord::Migration[5.2]
  def change
    t.confirmable
  end
end
