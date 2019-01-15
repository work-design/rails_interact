class RailsInteractInit < ActiveRecord::Migration[5.2]
  def change

    create_table :comments do |t|
      t.references :commentable, polymorphic: true
      t.references :user
      t.references :parent
      t.string :title
      t.text :content
      t.string :state
      t.float :score
      t.integer :liked_count
      t.integer :star_count
      t.timestamps
    end

    create_table :attitudes do |t|
      t.references :attitudinal, polymorphic: true
      t.references :user
      t.string :opinion
      t.timestamps
    end

    create_table :stars do |t|
      t.references :starred, polymorphic: true
      t.references :user
      t.timestamps
    end

  end
end
