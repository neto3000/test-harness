class AddBaseTables < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false

      t.timestamps
      t.timestamp :deleted_at, { index: true }
    end

    create_table :projects do |t|
      t.string :name, null: false
      t.references :user,index: true, foreign_key: true

      t.timestamps
      t.timestamp :deleted_at, { index: true }
    end

    create_table :suit_tests do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.references :user,index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true

      t.timestamps
      t.timestamp :deleted_at, { index: true }
    end

    create_table :tests do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :spec, null: false
      t.references :user,index: true, foreign_key: true
      t.references :suit_test  ,index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true

      t.timestamps
      t.timestamp :deleted_at, { index: true }
    end

    create_table :suit_test_runs do |t|
      t.string :execution_time
      t.integer :status
      t.integer :warnings
      t.integer :successes
      t.integer :failures
      t.references :user, index: true, foreign_key: true
      t.references :test, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true

      t.timestamps
      t.timestamp :deleted_at, { index: true }
    end


    create_table :test_runs do |t|
      t.string :execution_time
      t.integer :status
      t.integer :warnings
      t.integer :successes
      t.integer :failures
      t.references :user, index: true, foreign_key: true
      t.references :test, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true
      t.references :suit_test_run, index: true, foreign_key: true

      t.timestamps
      t.timestamp :deleted_at, { index: true }
    end
  end
end
