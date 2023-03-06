class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :maiden_name
      t.integer :age
      t.string :gender
      t.string :email
      t.string :phone
      t.string :username
      t.string :password
      t.string :birth_date
      t.string :image
      t.string :blood_group
      t.integer :height
      t.decimal :weight
      t.string :eye_color
      t.jsonb :hair, null: false, default: '{}'
      t.string :domain
      t.string :ip
      t.jsonb :address, null: false, default: '{}'
      t.string :mac_address
      t.string :university
      t.jsonb :bank, null: false, default: '{}'
      t.jsonb :company, null: false, default: '{}'
      t.string :ein
      t.string :ssn
      t.string :user_agent

      t.timestamps
    end
  end
end
