
module Mutations
  module Pairings
    class CancelMentorPairing < ::Mutations::BaseMutation
      argument :id, ID, required: true
      type Types::PairingType

      def resolve(attributes)
        pairing = Pairing.find(attributes[:id])
        notifications(pairing)
        pairing.update(pairee_id: nil)
        pairing
      end

      private

      def create_message(pairing)
        name = pairing.pairer_name
        date = pairing.date
        time = pairing.time
        MessageGenerator.new.cancel_notification(name, date, time)
      end

      def notifications(pairing)
        message = create_message(pairing)
        contact_info = pairing.pairee_contact_info
        NotificationsWorker.perform_later(contact_info, message)
      end
    end
  end
end
