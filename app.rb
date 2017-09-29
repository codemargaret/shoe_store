Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


class CreateBrands < ActiveRecord::Migration[5.1]
  def change
    create_table(:brands) do |t|
      t.column(:name, :string)
      t.column(:price, :decimal)

      t.timestamps()
    end
  end
end

class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table(:stores) do |t|
      t.column(:name, :string)

      t.timestamps()
    end
  end
end

class CreateBrandsStores < ActiveRecord::Migration[5.1]
  def change
    create_table(:stores) do |t|
      t.column(:brand_id, :integer)
      t.column(:store_id, :integer)

      t.timestamps()
    end
  end
end
