class CreateKill < ActiveRecord::Migration[7.0]
  def change
    create_table :kills do |t|
      t.references      :killer, foreign_key: { to_table: :players }, null: true
      t.references      :victim, foreign_key: { to_table: :players }
      t.references      :match, foreign_key: true

      t.timestamps
    end
  end
end
