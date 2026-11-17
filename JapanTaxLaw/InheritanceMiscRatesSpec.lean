import JapanTaxLaw.InheritanceMiscRates

/-!
# InheritanceMiscRates spec — 相続税法 art. 21の十三 / art. 26 / art. 17

Sources (pinned; identical to InheritanceMiscRates.lean):

  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01

Independent integer restatements（impl が `TaxRate.applyFloor` を使うのに対し、
spec は整数式 `m * num / den` で独立定式）:

  * art. 21の十三: 控除後課税価格 × 20 / 100
  * art. 26:       時価 × 85 / 100
  * art. 17:       総額 × num / den（割合は caller-established）

Scope boundaries identical to the implementation. `agreeInheritanceMiscRates` は
`==` による定数一致確認であり、法的意味の等価証明ではない。
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: art. 21の十三 相続時精算課税に係る贈与税額（独立整数式）。 -/
def specInheritanceSettlementGiftTax (taxable num den : Money) : Money :=
  taxable * num / den

/-- Spec: art. 26 立木の価額（独立整数式）。 -/
def specStandingTimberValue (market num den : Money) : Money :=
  market * num / den

/-- Spec: art. 17 各相続人等の相続税額（独立整数式）。 -/
def specHeirInheritanceTax (total num den : Money) : Money :=
  total * num / den

-- ==== points (kernel-decided) ====

example : specInheritanceSettlementGiftTax 1_000_000 20 100 = 200_000 := by decide
example : specInheritanceSettlementGiftTax 101 20 100 = 20 := by decide
example : specStandingTimberValue 1_000_000 85 100 = 850_000 := by decide
example : specStandingTimberValue 1_000 85 100 = 850 := by decide
example : specHeirInheritanceTax 1_000_000 1 4 = 250_000 := by decide

/-- Agreement checks between implementation and Spec. -/
def agreeInheritanceMiscRates : Bool :=
  let r21 : TaxRate := ⟨20, 100, by decide⟩
  let r26 : TaxRate := ⟨85, 100, by decide⟩
  let r17 : TaxRate := ⟨1, 4, by decide⟩
  inheritanceSettlementGiftTax 1_000_000 == specInheritanceSettlementGiftTax 1_000_000 20 100
    && inheritanceSettlementGiftTax 101 == specInheritanceSettlementGiftTax 101 20 100
    && inheritanceSettlementGiftTax 0 == specInheritanceSettlementGiftTax 0 20 100
    && standingTimberValue 1_000_000 == specStandingTimberValue 1_000_000 85 100
    && standingTimberValue 1_000 == specStandingTimberValue 1_000 85 100
    && heirInheritanceTax 1_000_000 r17 == specHeirInheritanceTax 1_000_000 1 4
    && heirInheritanceTax 0 r17 == specHeirInheritanceTax 0 1 4
    && (r21.applyFloor 1_000_000) == specInheritanceSettlementGiftTax 1_000_000 20 100
    && (r26.applyFloor 1_000_000) == specStandingTimberValue 1_000_000 85 100

example : agreeInheritanceMiscRates = true := by decide

end JapanTaxLaw
