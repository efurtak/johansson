class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :imie_i_nazwisko
      t.text :email
      t.text :komentarz

      t.timestamps
    end
  end
end
