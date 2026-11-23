import JapanTaxLaw.LimitRateSevenPercent

/-
# LimitRateSevenPercentSpec — independent spec for 租税条約等実施特例法施行令 art.4(1)(4)（百分の七）

Pinned source:
  Law id: 362CO0000000335
  Revision: 362CO0000000335_20260521_506CO0000000150
  Snapshot: data/raw/362CO0000000335_20260521_506CO0000000150.law.json
  Statutory article: 第四条(1)(4) — 限度税率が百分の七
  原文逐語: 「限度税率が百分の七である場合」
  Normative unit: NORM|dfc45330a683e8b1b033e5b78eaf211d568a0c15cdf9ae0da6cdd3554c54c4fe

The implementation compares percent points directly (`percent == 7`). This
module is an INDEPENDENT formulation: it carries the statutory rate as a
numerator/denominator pair (7/100) and tests equality by cross-multiplication
`percent * 100 == 7 * 100` — a different formulation from the direct compare.
It reuses NO implementation definition inside its own `spec*` defs; the
universal `agree_rate` theorem is the only bridge, and the kernel checks it for
every Nat percent.

Not modelled: the tax base, other rate cases, the gated measure, other
items/paragraphs and enforcement rules.
-/

namespace JapanTaxLaw.LimitRateSevenPercent

/-- Spec-local numerator: 七. Independent of impl. -/
def specRateNumerator : Nat := 7

/-- Spec-local denominator: 百 (per hundred). Independent of impl. -/
def specRateDenominator : Nat := 100

/-- Independent rate test via cross-multiplication, not direct equality. -/
def specIsSevenPercent (percent : Nat) : Bool :=
  decide (percent * specRateDenominator == specRateNumerator * 100)

/-- Universal, kernel-checked correspondence for every Nat percent. -/
theorem agree_rate (percent : Nat) :
    isSevenPercent percent = specIsSevenPercent percent := by
  unfold isSevenPercent statutoryRatePercent specIsSevenPercent
  unfold specRateNumerator specRateDenominator
  by_cases h : percent = 7
  · subst percent
    decide
  · have hm : ¬ percent * 100 = 7 * 100 := by omega
    simp [h, hm]

-- Spec-local sanity example (test scaffolding; excluded from statutory literals).
example : specRateNumerator = 7 := rfl

/-- Finite spec-local grid (Bool scaffolding); the universal theorem is the proof. -/
def specRateGrid : Bool :=
  [0, 1, 6, 7, 8, 100].all fun percent =>
    specIsSevenPercent percent == decide (percent == 7)

example : specRateGrid = true := by decide

end JapanTaxLaw.LimitRateSevenPercent
