require 'easypost'
class Account::ReturnController < ApplicationController
  def show
    EasyPost.api_key = ENV['EASYPOST_API_KEY']

    to_address = EasyPost::Address.create(
      :name => 'ReBook',
      :street1 => '1331 17th St',
      :street2 => 'll100',
      :city => 'Denver',
      :state => 'CO',
      :zip => '80202',
      :country => 'US',
      :phone => '(303) 731-3117'
    )
    from_address = EasyPost::Address.create(
      :company => current_user.name,
      :street1 => current_user.street_address,
      :city => current_user.city,
      :state => current_user.state,
      :zip => current_user.zip,
      :phone => current_user.phone_number
    )

    parcel = EasyPost::Parcel.create(
      :width => 15.2,
      :length => 18,
      :height => 9.5,
      :weight => 35.1
    )

    customs_item = EasyPost::CustomsItem.create(
      :description => 'EasyPost T-shirts',
      :quantity => 2,
      :value => 23.56,
      :weight => 33,
      :origin_country => 'us',
      :hs_tariff_number => 123456
    )
    customs_info = EasyPost::CustomsInfo.create(
      :integrated_form_type => 'form_2976',
      :customs_certify => true,
      :customs_signer => 'Dr. Pepper',
      :contents_type => 'gift',
      :contents_explanation => '', # only required when contents_type => 'other'
      :eel_pfc => 'NOEEI 30.37(a)',
      :non_delivery_option => 'abandon',
      :restriction_type => 'none',
      :restriction_comments => '',
      :customs_items => [customs_item]
    )

    shipment = EasyPost::Shipment.create(
      :to_address => to_address,
      :from_address => from_address,
      :parcel => parcel,
      :customs_info => customs_info
    )

    shipment.buy(
      :rate => shipment.lowest_rate
    )

    shipment.insure(amount: 100)

    label_url = shipment.postage_label.label_url
    redirect_to label_url
  end
end
