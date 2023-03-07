require 'active_interaction'

module Users
  class Create < ActiveInteraction::Base
    # Add validations

    array :users_data do
      hash do
        integer :id
        string :first_name
        string :last_name
        string :maiden_name
        integer :age
        string :gender
        string :email
        string :phone
        string :username
        string :password
        string :birth_date
        string :image
        string :blood_group
        integer :height
        decimal :weight
        string :eye_color
        hash :hair do
          string :color
          string :type
        end
        string :domain
        string :ip
        hash :address do
          string :address
          string :city
          hash :coordinates do
            float :lat
            float :lng
          end
          string :postal_code
          string :state
        end

        string :mac_address
        string :university
        hash :bank do
          string :card_expire
          string :card_number
          string :card_type
          string :currency
          string :iban
        end
        hash :company do
          string :department
          string :name
          string :title
          hash :address do
            string :address
            string :address
            string :city
            hash :coordinates do
              float :lat
              float :lng
            end
            string :postal_code
            string :state
          end
        end
        string :ein
        string :ssn
        string :user_agent
      end
    end

    def execute
      User.upsert_all(users_data)
    end
  end
end
