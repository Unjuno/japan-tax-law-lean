import JapanTaxLaw.ResidentialAreaRatioInterval

/-
# ResidentialAreaRatioIntervalSpec — 独立整数定式（地価税法施行令 第九条）

Pinned source: law 403CO0000000174,
  revision 403CO0000000174_20250722_507CO0000000249.
  原文逐語: 「居住面積割合が百分の二十五を超え百分の五十以下である場合」

INDEPENDENT FORMULATION. This module owns its OWN constants
  specLower = 25 (百分の二十五), specUpper = 50 (百分の五十), specScale = 100 (百分)
and writes the interval with the operands in a DIFFERENT surface order:
  `specScale * residential > specLower * total` (the `>` operator, impl uses `<`)
  conjoined with `specScale * residential <= specUpper * total`.
No implementation identifier (lowerPct / upperPct / scale / ratioInInterval)
occurs in any independent definition above. The ONLY impl/spec bridge is the
universal, kernel-checked omega theorem `agree_ratioInInterval` below.
Finite `example` points are scaffolding, not the statutory formula.
-/

namespace JapanTaxLaw.ResidentialAreaRatioInterval

/-- 百分の二十五 = 25/100。独立定数。 -/
def specLower : Nat := 25

/-- 百分の五十 = 50/100。独立定数。 -/
def specUpper : Nat := 50

/-- 百分 = 100。独立定数。 -/
def specScale : Nat := 100

/-- 独立定式: 被演算子の順序を入れ替え、下限は `>` で表す（impl は `<`）。 -/
def specInInterval (residential total : Nat) : Bool :=
  decide (specScale * residential > specLower * total &&
          specScale * residential <= specUpper * total)

-- Spec-local, kernel-decided spot-checks (scaffolding only).
example : specInInterval 26 100 = true := by decide
example : specInInterval 25 100 = false := by decide
example : specInInterval 50 100 = true := by decide
example : specInInterval 51 100 = false := by decide
example : specInInterval 26 0 = false := by decide

/-- Universal, kernel-checked bridge for every Nat residential and total.
    omega proves the swapped-operand `>` lower bound equivalent to the impl's
    `<` bound and checks the inclusive `<=` upper bound. -/
theorem agree_ratioInInterval (residential total : Nat) :
    ratioInInterval residential total = specInInterval residential total := by
  unfold ratioInInterval specInInterval lowerPct upperPct scale specLower specUpper specScale
  by_cases hlow : 25 * total < 100 * residential
  · by_cases hup : 100 * residential <= 50 * total
    · have hgt : 100 * residential > 25 * total := by omega
      simp [hlow, hgt, hup]
    · have hgt : 100 * residential > 25 * total := by omega
      simp [hlow, hgt, hup]
  · by_cases hup : 100 * residential <= 50 * total
    · have hngt : ¬ 100 * residential > 25 * total := by omega
      simp [hlow, hngt, hup]
    · have hngt : ¬ 100 * residential > 25 * total := by omega
      simp [hlow, hngt, hup]

end JapanTaxLaw.ResidentialAreaRatioInterval
