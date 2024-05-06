# frozen_string_literal: true

module GraphqlHelper
  def body
    JSON.parse(response.body, symbolize_names: true)
  end

  def errors
    body[:errors]
  end
end
