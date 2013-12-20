class AddCeuIdToCertificate < ActiveRecord::Migration
  def change
    add_reference :certificates, :ceu, index: true
  end
end
