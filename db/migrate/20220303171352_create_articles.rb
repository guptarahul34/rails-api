class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :body
      t.date :release_date

      t.timestamps
    end
  end
end
