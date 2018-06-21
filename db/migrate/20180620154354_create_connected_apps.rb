class CreateConnectedApps < ActiveRecord::Migration[5.2]
  def change
    create_table :connected_apps do |t|
      t.string :name
      t.string :app_url

      t.timestamps
    end
  end
end
