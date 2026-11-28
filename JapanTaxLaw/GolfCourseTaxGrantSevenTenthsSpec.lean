import JapanTaxLaw.GolfCourseTaxGrantSevenTenths

/-! # GolfCourseTaxGrantSevenTenths spec — 独立定式 (law 329M50000002023 / art.8の13)

面積割合を `area * tax / total` として独立に再記述し、交付額を
`(控除後) * 7 / 10` として再記述する。実装の識別子は使わない。 -/

namespace JapanTaxLaw.GolfCourseTaxGrantSevenTenths

def specShare (tax : Nat) (area : Nat) (total : Nat) : Nat :=
  if total = 0 then 0 else area * tax / total

def specGrant (tax : Nat) (area : Nat) (total : Nat) (refund : Nat) : Nat :=
  (specShare tax area total - refund) * 7 / 10

example : specGrant 100 3 4 0 = 52 := by decide
example : specGrant 100 4 4 0 = 70 := by decide
example : specGrant 100 3 4 100 = 0 := by decide

/-- 実装と独立仕様の一致: 乗法の可換性と条件Splitのみ、公理なし。 -/
theorem spec_agrees (tax : Nat) (area : Nat) (total : Nat) (refund : Nat) :
    grantAmount tax area total refund = specGrant tax area total refund := by
  unfold grantAmount netAmount prorated specGrant specShare
  by_cases h : total = 0
  · simp [h]
  · simp [h]
    rw [Nat.mul_comm tax area]

end JapanTaxLaw.GolfCourseTaxGrantSevenTenths
