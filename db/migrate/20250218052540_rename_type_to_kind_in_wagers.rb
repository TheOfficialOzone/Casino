# Rename the word type to kind because type is reserved keyword
class RenameTypeToKindInWagers < ActiveRecord::Migration[8.0]
  def change
    rename_column :wagers, :type, :kind
  end
end
