import JapanTaxLaw.PromulgationEffective

/-! Independent spec: promulgation-day effect means zero-day offset. -/

namespace JapanTaxLaw.PromulgationEffective

def specPromulgationDay (offset : Nat) : Prop := offset = 0

theorem agreePromulgationOffset : specPromulgationDay daysAfterPromulgation := by
  unfold specPromulgationDay daysAfterPromulgation
  rfl

theorem uniqueZero (n : Nat) (h : specPromulgationDay n) : n = 0 := h

end JapanTaxLaw.PromulgationEffective
