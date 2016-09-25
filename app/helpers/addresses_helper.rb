module AddressesHelper

  def addresses_options_for_select
    addresses = Address.all
    addresses.map { |address| ["#{address.street.kind} #{address.street.name} - #{address.number}", address.id] }
  end

end
