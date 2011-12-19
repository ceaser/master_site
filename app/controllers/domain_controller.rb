class DomainController < ApplicationController
  around_filter :get_customer

  private

  def get_customer
    @customer = Customer.find_by_domain!(request.domain)
    configurations = @customer.configurations[Rails.env].clone
    configurations["database"] = @customer.database unless @customer.database.nil?

    if @customer.host.nil?
      configurations["socket"] = @customer.socket
    else
      configurations["host"] = @customer.host
    end

    begin
      ActiveRecord::Base.establish_connection(configurations)
      yield
    ensure
      ActiveRecord::Base.establish_connection(@customer.configurations[Rails.env])
    end
  end
end
