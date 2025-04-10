module Card::Golden
  extend ActiveSupport::Concern

  included do
    scope :golden, -> { joins(:goldness) }

    has_one :goldness, dependent: :destroy, class_name: "Card::Goldness"

    scope :with_golden_first, -> do
      left_outer_joins(:goldness).tap do |relation|
        relation.order_values.unshift("card_goldnesses.id IS NULL")
      end
    end
  end

  def golden?
    goldness.present?
  end

  def promote_to_golden
    create_goldness! unless golden?
  end

  def demote_from_golden
    goldness&.destroy
  end
end
