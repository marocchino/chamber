class AlterVersionToBook < ActiveRecord::Migration
  def self.up
    change_column(:books, :version, :string, limit: 4, default: '0.1')
  end

  def self.down
    change_column(:books, :version, :integer)
  end
end
