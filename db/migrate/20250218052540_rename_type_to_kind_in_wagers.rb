class RenameTypeToKindInWagers < ActiveRecord::Migration[8.0]
  def change
	rename_column :wagers, :type, :kind
  end
end
