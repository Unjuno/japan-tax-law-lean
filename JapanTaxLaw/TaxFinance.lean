import Std

/-!
# TaxFinance — shared tax-calculation primitives

Foundation types shared across Japanese national and local taxes while we
formalize them (PHASE C — 共通形式意味論 in the project plan):

* `Money` — yen amounts (natural numbers; see below about signed amounts);
* `TaxRate` — a rate as a fraction with a positivity-typed denominator,
  plus floor / ceiling application and mechanical facts about them;
* `Period` — an inclusive calendar range with an ordering inhabitant;
* `Priority` — an explicit precedence ladder for competing regimes
  （法律 → 政令 → 省令/告示） plus a *decide*-friendly comparator.

Japanese tax statutes round the tax amounts in a law-specific way:
the common `applyFloor` / `applyCeil` here are the two primitives; each
per-law model records its own rounding rule (never hard-coded silently).
Rounding rules are per-law business data, not universal facts.

Sign note: Phase D will extend with signed amounts for loss carry-forward,
borrowings and negative deductions; this module keeps amounts strictly
`Nat` for now and documents that boundary instead of pretending otherwise.
-/

namespace JapanTaxLaw.TaxFinance

/-- Money in yen. Amounts are non-negative; loss carry-forward is Phase D+. -/
abbrev Money := Nat

/-- A tax rate as a fraction `num/den`. The denominator carries a positivity
    proof, so `den = 0` is unrepresentable. -/
structure TaxRate where
  num : Nat
  den : Nat
  den_pos : 0 < den

namespace TaxRate

/-- The raw numerator/denominator, for laws that carry e.g. 所得税为 10% as 10/100. -/
def numDen (r : TaxRate) : Nat × Nat := (r.num, r.den)

/-- Apply a rate with floor rounding (切り捨て). -/
def applyFloor (r : TaxRate) (m : Money) : Money := m * r.num / r.den

/-- Apply a rate with ceiling rounding (切り上げ). -/
def applyCeil (r : TaxRate) (m : Money) : Money :=
  (m * r.num + (r.den - 1)) / r.den

/-- `num = 0` kills any amount; the multiply vanishes by decision. -/
theorem applyFloor_zero (r : TaxRate) (h : r.num = 0) (m : Money) :
    r.applyFloor m = 0 := by
  simp [applyFloor, h]

-- Rounding check: rates written as num/den with the same factor cancel exactly
example : (⟨2 * 7, 7, by decide⟩ : TaxRate).applyFloor (5 : Money) = 10 := by
  decide
example : (⟨100 * 35, 35, by decide⟩ : TaxRate).applyFloor (3 : Money) = 300 := by
  decide

-- Example: 10% on 1000 = 100
example : (⟨10, 100, by decide⟩ : TaxRate).applyFloor (1000 : Money) = 100 := by
  decide

-- Example: 10% ceiling on 1050 = 105 == floor
example : (⟨10, 100, by decide⟩ : TaxRate).applyCeil (1050 : Money) = 105 := by
  decide

-- Example: 7.75% on 104, small remainder — floor rounds down
example : (⟨775, 10000, by decide⟩ : TaxRate).applyFloor (104 : Money) = 8 := by
  decide

end TaxRate

/-- An inclusive calendar range (e.g. one tax-assessment year). -/
structure Period where
  start : Nat
  finish : Nat
  wf : start ≤ finish

namespace Period

def span (p : Period) : Nat := p.finish - p.start + 1

theorem span_positive (p : Period) : 0 < p.span := by
  have h := p.wf
  simp [span]

-- Example: 2026 tax year (inclusive) = 12-month accounting reference year
example : (Period.mk 2026 2026 (by decide)).span = 1 := by decide

end Period

/-- Precedence ladder for competing rules: statute > cabinet order >
administrative order / notice. `rank` is a total order ground-carried by
`decide`; `beats a b` means `a` displaces `b` when both would apply. -/
inductive Priority where
  | notice
  | cabinetOrder
  | statute

namespace Priority

def rank : Priority → Nat
  | .notice => 1
  | .cabinetOrder => 2
  | .statute => 3

theorem statute_rank : rank .statute = 3 := by decide
theorem cabinet_rank : rank .cabinetOrder = 2 := by decide
theorem notice_rank : rank .notice = 1 := by decide

theorem statute_gt_cabinetOrder : rank .statute > rank .cabinetOrder := by decide
theorem cabinetOrder_gt_notice : rank .cabinetOrder > rank .notice := by decide
theorem statute_gt_notice : rank .statute > rank .notice := by decide

theorem rank_injective : rank a = rank b → a = b := by
  cases a <;> cases b <;> intro h
  all_goals first
    | rfl
    | exact absurd h (by decide)

/-- `x` displaces `y`: x outranks y. -/
abbrev beats (x y : Priority) : Prop := rank x > rank y

theorem beats_irreflexive (x : Priority) : ¬ beats x x := by
  unfold beats
  exact Nat.lt_irrefl (rank x)

theorem beats_transitive {x y z : Priority} : beats x y → beats y z → beats x z := by
  unfold beats
  intro hxy hyz
  exact Nat.lt_trans hyz hxy

end Priority

end JapanTaxLaw.TaxFinance
