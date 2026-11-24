import JapanTaxLaw.TaxFinance

/-!
# RateCeilingTwoPercent — 地方税法 art. 51 ただし書 (2% ceiling)

Pinned source: law 325AC0000000226, revision
`325AC0000000226_20261101_508AC0000000002`, snapshot
`data/raw/325AC0000000226_20261101_508AC0000000002.law.json`.

Normative unit: `NORM|c6450946afa36af4ed52b19ff5433b84df5afb14341f23ab94d02f93d73b7450`
Verbatim: 「ただし、標準税率を超える税率で課する場合においても、百分の二を
超えることができない。」

Scope: only the ceiling test for a rate expressed as `num / den`. Callers must
supply `den > 0`; for `den = 0` the comparison is not a valid rate. The
standard rate and the local decision to exceed it are separate units.
-/
namespace JapanTaxLaw.RateCeilingTwoPercent

open JapanTaxLaw.TaxFinance

/-- 百分の二 = 2/100, as numerator / denominator. -/
def ceilingNum : Nat := 2
def ceilingDen : Nat := 100

/-- True iff `num/den` strictly exceeds 2/100. Cross-multiplication avoids
    division and keeps the statement total over Nat. -/
def exceedsCeiling (num den : Nat) : Bool :=
  decide (ceilingNum * den < num * ceilingDen)

theorem at_ceiling : exceedsCeiling 2 100 = false := by decide
theorem above_ceiling : exceedsCeiling 3 100 = true := by decide
theorem below_ceiling : exceedsCeiling 1 100 = false := by decide
theorem equivalent_fraction : exceedsCeiling 20 1_000 = false := by decide
theorem above_equivalent : exceedsCeiling 21 1_000 = true := by decide

end JapanTaxLaw.RateCeilingTwoPercent
