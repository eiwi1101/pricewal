class CreatePageViews < ActiveRecord::Migration
  def change
    create_table :page_views do |t|
      t.string :session_id
      t.string :url
      t.string :controller
      t.string :action
      t.string :resource_id

      t.timestamps
    end
  end
end
