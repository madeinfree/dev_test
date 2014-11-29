class CreateTerms < ActiveRecord::Migration
  def change
    create_table :terms do |t|
      t.integer :post_id
      t.string :tag

      t.timestamps
    end
  end
end
