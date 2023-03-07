# frozen_string_literal: true

require 'rails_helper'

describe Users::Create do
  let!(:user_data) do
    [
      {
        :id=>1,
        :first_name=>"Terry",
        :last_name=>"Medhurst",
        :maiden_name=>"Smitham",
        :age=>50,
        :gender=>"male",
        :email=>"atuny0@sohu.com",
        :phone=>"+63 791 675 8914",
        :username=>"atuny0",
        :password=>"9uQFF1Lh",
        :birth_date=>"2000-12-25",
        :image=>"https://robohash.org/hicveldicta.png",
        :blood_group=>"A−",
        :height=>189,
        :weight=>75.4,
        :eye_color=>"Green",
        :hair=>{:color=>"Black", :type=>"Strands"},
        :domain=>"slashdot.org",
        :ip=>"117.29.86.254",
        :address=>
        {:address=>"1745 T Street Southeast",
          :city=>"Washington",
          :coordinates=>{:lat=>38.867033, :lng=>-76.979235},
          :postal_code=>"20020",
          :state=>"DC"},
        :mac_address=>"13:69:BA:56:A3:74",
        :university=>"Capitol University",
        :bank=>
        {:card_expire=>"06/22",
          :card_number=>"50380955204220685",
          :card_type=>"maestro",
          :currency=>"Peso",
          :iban=>"NO17 0695 2754 967"},
        :company=>
        {:address=>
          {:address=>"629 Debbie Drive",
            :city=>"Nashville",
            :coordinates=>{:lat=>36.208114, :lng=>-86.58621199999999},
            :postal_code=>"37076",
            :state=>"TN"},
          :department=>"Marketing",
          :name=>"Blanda-O'Keefe",
          :title=>"Help Desk Operator"},
        :ein=>"20-9487066",
        :ssn=>"661-64-2976",
        :user_agent=>
        "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/534.24 (KHTML, like Gecko) Chrome/12.0.702.0 Safari/534.24"
      }
    ]
  end

  context 'when valid data' do
    it 'create user' do
      expect { described_class.run(users_data: user_data) }.to change(User, :count).by(1)
    end
  end
end
