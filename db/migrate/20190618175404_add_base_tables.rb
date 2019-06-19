class AddBaseTables < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email

      t.timestamps
    end

    create_table :projects do |t|
      t.string :name
      t.references :user,index: true, foreign_key: true

      t.timestamps
    end

    create_table :suit_tests do |t|
      t.string :name
      t.string :description
      t.references :user,index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true

      t.timestamps
    end

    create_table :tests do |t|
      t.string :name
      t.string :description
      t.string :spec
      t.references :user,index: true, foreign_key: true
      t.references :suit_test  ,index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true

      t.timestamps
    end

    create_table :suit_test_runs do |t|
      t.string :execution_time
      t.integer :status
      t.references :user, index: true, foreign_key: true
      t.references :test, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true

      t.timestamps
    end


    create_table :test_runs do |t|
      t.string :execution_time
      t.integer :status
      t.references :user, index: true, foreign_key: true
      t.references :test, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true
      t.references :suit_test_run, index: true, foreign_key: true

      t.timestamps
    end
  end
end
