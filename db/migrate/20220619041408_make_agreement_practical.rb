class MakeAgreementPractical < ActiveRecord::Migration[7.0]
  def change
    add_reference :loans, :agreeement, index: true
  end
end
