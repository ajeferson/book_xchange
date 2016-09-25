module PublishersHelper

  def publishers_options_for_select
    publishers = Publisher.all
    publishers.map { |publisher| [publisher.name, publisher.cnpj] }
  end

end
