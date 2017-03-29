# frozen_string_literal: true

class ArticlesController < ApplicationController
  resource :article

  def index
    render @articles
  end

  def show
    render @article
  end
end
