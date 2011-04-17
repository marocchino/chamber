class RenameVersionToTag < ActiveRecord::Migration
  def self.up
    rename_column(:books, :version, :tag)
  end

  def self.down
    rename_column(:books, :tag, :version)
  end
end
