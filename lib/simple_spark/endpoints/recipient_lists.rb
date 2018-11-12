module SimpleSpark
  module Endpoints
    # Provides access to the /recipient-lists endpoint
    # @note See: https://developers.sparkpost.com/api/recipient-lists
    class RecipientLists
      attr_accessor :client

      def initialize(client)
        @client = client
      end

      # List all recipient lists
      # @return [Array] an array of abbreviated recipient list objects
      # @note See: https://developers.sparkpost.com/api/recipient-lists/#recipient-lists-get-list-all-recipient-lists
      def list
        @client.call(method: :get, path: 'recipient-lists')
      end

      # Retrieve recipient list details
      # @param id [Integer] the recipient list ID to retrieve
      # @param show_recipients [Boolean] if true, return all the recipients contained in the list
      # @return [Hash] details about a specified recipient list
      # @note See: https://developers.sparkpost.com/api/recipient-lists/#recipient-lists-get-retrieve-a-recipient-list
      def retrieve(id, show_recipients = false)
        params = { show_recipients: show_recipients }.compact
        @client.call(method: :get, path: "recipient-lists/#{id}", query_values: params)
      end

      # Update a recipient list
      # @param id [Integer] the recipient list ID to update
      # @param params [Hash] hash of params to update, valid keys: [:name, :description, :attributes, :recipients]
      # @return [Hash] details on update operation
      # @note See: https://developers.sparkpost.com/api/recipient-lists/#recipient-lists-put-update-a-recipient-list
      def update(id, params = {})
        @client.call(method: :put, path: "recipient-lists/#{id}", body_values: params.slice(:name, :description, :attributes, :recipients))
      end
    end
  end
end
