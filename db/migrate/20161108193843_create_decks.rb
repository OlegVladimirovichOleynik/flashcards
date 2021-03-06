class CreateDecks < ActiveRecord::Migration[5.0]
  def change
    create_table :decks do |t|
      t.string :name
      t.integer :user_id
      t.integer :card_id
    end
    add_column :cards, :deck_id, :integer
    add_column :users, :current_deck_id, :integer
    add_index :cards, :user_id
    add_index :cards, :deck_id
  end
end
