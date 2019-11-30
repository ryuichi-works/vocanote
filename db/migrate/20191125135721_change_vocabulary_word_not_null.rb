class ChangeVocabularyWordNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :vocabularies, :word, false
  end
end
