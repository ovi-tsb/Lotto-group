class AddSenderNameToInvites < ActiveRecord::Migration[5.2]
  def change
    add_column :invites, :sender_name, :string
  end
end
