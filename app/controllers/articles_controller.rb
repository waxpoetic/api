# frozen_string_literal: true

class ArticlesController < ApplicationController
  resource :article

  api! 'List all articles'
  def index
    respond_with @articles
  end

  api! 'View a single article'
  def show
    respond_with @article
  end
end
