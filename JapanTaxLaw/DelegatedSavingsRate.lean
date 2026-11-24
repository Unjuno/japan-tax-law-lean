import JapanTaxLaw.TaxFinance

/-!
# DelegatedSavingsRate — 地方税法 art. 72の24の2(2)二 貯蓄保険 7%

Pinned source: law 325AC0000000226, revision
`325AC0000000226_20261101_508AC0000000002`, snapshot
`data/raw/325AC0000000226_20261101_508AC0000000002.law.json`.

Normative unit: `NORM|4ce573224735cd582616b3a9fc89d747f78adfc99af4f10479fa672e1b948b19`
Verbatim: 「貯蓄保険（個人保険のうち貯蓄を主目的とする保険で政令で定めるものを
いう。）にあつては、各事業年度の収入保険料に百分の七を乗じて得た金額」

This is a DELEGATION-kind norm: whether an insurance is a 貯蓄保険 is defined
by cabinet order (政令で定める). That determination is caller-established as a
`Bool`; this unit models only the consequence — the 7/100 rate on the annual
premium when the delegated designation holds. The cabinet order's content,
the premium amount and the other insurance categories are separate units.
-/
namespace JapanTaxLaw.DelegatedSavingsRate

open JapanTaxLaw.TaxFinance

/-- 百分の七 = 7/100 with a positivity-typed denominator. -/
def savingsRate : TaxRate := ⟨7, 100, by decide⟩

/-- Tax amount for this category: 7% of premium iff the cabinet-order
    designation holds; zero otherwise. -/
def categoryAmount (designated : Bool) (premiumYen : Nat) : Nat :=
  if designated then savingsRate.applyFloor premiumYen else 0

theorem rate_components : TaxRate.numDen savingsRate = (7, 100) := by decide
theorem applies_when_designated : categoryAmount true 1_000 = 70 := by decide
theorem none_when_not_designated : categoryAmount false 1_000 = 0 := by decide

end JapanTaxLaw.DelegatedSavingsRate
