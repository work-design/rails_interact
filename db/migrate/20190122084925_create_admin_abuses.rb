class CreateAdminAbuses < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_abuses do |t|
      t.string :abusement
      t.string :state
      t.string :note
      t.string :user

      t.timestamps
    end
  end
end
