module Types
  class QueryType < Types::BaseObject
    field :get_users, [Types::UserType], null: false, description: 'Returns a list of users'

    field :get_pairings, [Types::PairingType], null: false, description: 'Returns all pairings'

    field :get_user, Types::UserType, null: false, description: 'Returns a single user by id' do
      argument :id, ID, required: true
    end

    field :get_user_by_firebase_i_d, Types::UserType, null: false, description: 'Returns a single user by firebase id' do
      argument :id, ID, required: true
    end

    field :get_user_pairings, [Types::PairingType], null: false, description: 'Returns a single user pairings by id' do
      argument :id, ID, required: true
    end

    field :get_pairing, Types::PairingType, null: false, description: 'Returns a single pairing by id' do
      argument :id, ID, required: true
    end

    field :get_user_by_firebase_i_d, Types::UserType, null: false, description: 'Returns a single user by firebase id' do
      argument :id, ID, required: true
    end

    def get_user_pairings(id:)
      Pairing.where('pairer_id = ? AND pairee_id IS NOT NULL OR pairee_id = ?', id, id)
    end

    def get_users
      User.all
    end

    def get_user(id:)
      User.find(id)
    end

    def get_user_by_firebase_i_d(id:)
      User.where(firebase_id: id).first
    end

    def get_pairings
      Pairing.all
    end

    def get_pairing(id:)
      Pairing.find(id)
    end
  end
end
