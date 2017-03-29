# frozen_string_literal: true
# Be sure to restart your server when you modify this file.

# Add JSON-API MIME type
api_mime_types = %W(
  application/vnd.api+json
  text/x-json
  application/json
)
Mime::Type.register "application/vnd.api+json", :json, api_mime_types
