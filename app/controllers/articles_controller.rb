# frozen_string_literal: true

class ArticlesController < ApplicationController
  resource :article

  def index
    render @articles.latest
  end

  def show
    render @article
  end
end
