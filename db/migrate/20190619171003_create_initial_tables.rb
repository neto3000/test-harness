class CreateInitialTables < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email

      t.index :email, unique: true
      t.timestamps
    end

    create_table :projects do |t|
      t.string :name

      t.index :name, unique: true
      t.timestamps
    end

    create_table :tests do |t|
      t.string :name
      t.text :description
      t.text :spec

      t.index :name, unique: true
      t.timestamps
    end

    create_table :suite_tests do |t|
      t.string :name
      t.text :description

      t.index :name, unique: true
      t.timestamps
    end

    create_table :test_runs do |t|
      t.string :execution_time
      t.string :status
      t.text :warning
      t.text :success
      t.text :failures

      t.timestamps
    end

    create_table :suite_test_runs do |t|
      t.string :execution_time
      t.string :status
      t.text :warning
      t.text :success
      t.text :failures

      t.timestamps
    end

    add_reference :projects, :user, foreign_key: true
    add_reference :tests, :user, foreign_key: true
    add_reference :suite_tests, :user, foreign_key: true
    add_reference :test_runs, :user, foreign_key: true
    add_reference :suite_test_runs, :user, foreign_key: true

    add_reference :tests, :project, foreign_key: true
    add_reference :suite_tests, :project, foreign_key: true
    add_reference :test_runs, :project, foreign_key: true
    add_reference :suite_test_runs, :project, foreign_key: true

    add_reference :tests, :suite_test, foreign_key: true
    add_reference :test_runs, :suite_test, foreign_key: true
  end
end
