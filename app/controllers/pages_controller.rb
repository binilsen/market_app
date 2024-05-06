# frozen_string_literal: true

class PagesController < ApplicationController
  def index
    render json: { api: 'GrapQL', status: 'active', help: 'mk@help.com' }
  end
end
