import JapanTaxLaw.BenefitTariffLowerRate

/-! # BenefitTariffLowerRate spec — 独立定式 (law 330CO0000000237 / art.3)

実装の識別子を使わず、第二項の「低い税率の適用を妨げない」を
`Nat.min`（下界としての低い税率）として再記述する。
-/

namespace JapanTaxLaw.BenefitTariffLowerRate

def specTableRate : Nat := 0 -- 表の税率は入力として与える（固定値ではない）

def specEffective (tableRate : Nat) (lower : Option Nat) : Nat :=
  match lower with
  | none => tableRate
  | some lower => Nat.min lower tableRate

example : specEffective 20 none = 20 := by decide
example : specEffective 20 (some 10) = 10 := by decide
example : specEffective 20 (some 25) = 20 := by decide

/-- 実装と独立仕様の一致: `cases` + 算術のみ、公理なし。 -/
theorem spec_agrees (tableRate : Nat) (lower : Option Nat) :
    effectiveRate tableRate lower = specEffective tableRate lower := by
  cases lower with
  | none => rfl
  | some lower =>
      unfold effectiveRate specEffective
      by_cases h : lower < tableRate
      · simp [h]
        exact (Nat.min_eq_left (Nat.le_of_lt h)).symm
      · simp [h]
        exact (Nat.min_eq_right (Nat.le_of_not_gt h)).symm

end JapanTaxLaw.BenefitTariffLowerRate
