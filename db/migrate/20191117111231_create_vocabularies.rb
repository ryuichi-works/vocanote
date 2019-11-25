class CreateVocabularies < ActiveRecord::Migration[5.2]
  def change
    create_table :vocabularies do |t|
      t.string :word
      t.string :meaning
      t.text :comment

      t.timestamps
    end
  end
end
