class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :note
      t.boolean :watched, :default => false

      t.timestamps
    end
    
    add_reference :movies, :user, index: true
  end
end
