class CreateUpdateTimestampTrigger < ActiveRecord::Migration[6.0]
    def change
      create_trigger(:livros, :before, :update) do
        "SET NEW.updated_at = NOW();"
      end
    end
  end