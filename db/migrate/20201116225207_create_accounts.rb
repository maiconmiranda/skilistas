class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.bigint :account_number
      t.string :first_name
      t.string :last_name
      t.bigint :mobile
      t.string :address
      t.integer :postcode
      t.string :suburb
      t.string :social_media
      t.string :business_name
      t.bigint :abn
      t.bigint :phone
      t.string :website
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
