class AddUserIdToVocabularies < ActiveRecord::Migration[5.2]
  
  def up
    execute 'DELETE FROM vocabularies;'
    add_reference :vocabularies, :user, null: false, index: true
  end

  def down
    remove_reference :vocabularies, :user, index: true
  end
end
