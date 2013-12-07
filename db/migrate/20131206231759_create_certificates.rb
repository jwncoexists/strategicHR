class CreateCertificates < ActiveRecord::Migration
  def change
    create_table :certificates do |t|
      t.references :course, index: true
      t.references :user, index: true
      t.date :purchase_date
      t.float :purchase_price, precision: 8, scale: 2
      t.string :slug

      t.timestamps
    end
  end
end
