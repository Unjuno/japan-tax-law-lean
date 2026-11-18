import JapanTaxLaw.TaxFinance

/-!
# LandValueTaxRate — 地価税法 art. 22 (税率 千分の三) bounded L4 model

Source (pinned):
  Law id: 403AC0000000069
  Revision: 403AC0000000069_20250601_504AC0000000068
  Raw snapshot: data/raw/403AC0000000069_20250601_504AC0000000068.law.json

Models 地価税法 art. 22 (税率):

  地価税の額は、課税価格から基礎控除の額を控除した残額に
  千分の三の税率を乗じて計算した金額とする。

i.e.  tax = floor( (課税価格 − 基礎控除) × 3 / 1000 )

Scope and honesty notes:

* This is a **bounded** L4 model of the art. 22 tax-amount arithmetic only.
* 課税価格 (taxableBase), 基礎控除の額 (basicDeduction) and the question of
  whether the artefact falls under 地価税 at all are **caller-established** facts;
  they are passed as `Money` values, never encoded as `Bool` inside the formula.
* The deduction uses **saturating Nat subtraction**: when `taxableBase <
  basicDeduction`, the residual is 0 (not a negative). Exact theorems for the
  boundary cases are provided below.
* Rounding is `TaxRate.applyFloor` (切り捨て / truncation), as written by the
  statute's "乗じて計算した金額"; no other rounding rule is hard-coded here.
* art. 23 (評価の原則 — 課税時期における時価) is a **valuation principle with no
  monetary arithmetic** and is **NOT MODELLED** here. See docs/STAGING_LVT.md.
-/

namespace JapanTaxLaw.LandValueTaxRate

open JapanTaxLaw.TaxFinance

/-- 千分の三 = 3/1000 — 地価税法 art. 22 税率. -/
def landValueTaxRate : TaxRate := ⟨3, 1000, by decide⟩

/-- art. 22: 地価税の額 = floor((課税価格 − 基礎控除) × 3/1000).
    The subtraction is saturating on `Nat` (base below deduction ⇒ residual 0). -/
def landValueTax (taxableBase : Money) (basicDeduction : Money) : Money :=
  landValueTaxRate.applyFloor (taxableBase - basicDeduction)

-- ==== positivity / smoke ====

/-- Rate binding: 千分の三 is stored as num=3, den=1000. -/
example : landValueTaxRate.numDen = (3, 1000) := by rfl

/-- The denominator positivity witness is the one carried by the rate. -/
example : 0 < landValueTaxRate.den := landValueTaxRate.den_pos

/-- Smoke: 0 tax on 0 base (any deduction). -/
example : landValueTax 0 500 = 0 := by decide

/-- Smoke: an exact multiple — ¥1,000 residual gives ¥3. -/
example : landValueTax 1_000 0 = 3 := by decide

-- ==== verified facts ====

/-- 課税価格 0 ⇒ 税額 0 (saturating subtraction). -/
theorem landValueTax_zero (basicDeduction : Money) : landValueTax 0 basicDeduction = 0 := by
  unfold landValueTax landValueTaxRate JapanTaxLaw.TaxFinance.TaxRate.applyFloor
  simp

/-- 課税価格 = 基礎控除 ⇒ residual 0 ⇒ 税額 0. -/
theorem landValueTax_at_deduction (basicDeduction : Money) :
    landValueTax basicDeduction basicDeduction = 0 := by
  unfold landValueTax landValueTaxRate JapanTaxLaw.TaxFinance.TaxRate.applyFloor
  simp

/-- 課税価格 < 基礎控除 ⇒ saturating residual 0 ⇒ 税額 0 (exact). -/
theorem landValueTax_below_deduction {taxableBase basicDeduction : Money}
    (h : taxableBase < basicDeduction) : landValueTax taxableBase basicDeduction = 0 := by
  have hs : taxableBase - basicDeduction = 0 := Nat.sub_eq_zero_of_le (Nat.le_of_lt h)
  unfold landValueTax landValueTaxRate JapanTaxLaw.TaxFinance.TaxRate.applyFloor
  rw [hs]
  simp

/-- Nondecreasing in 課税価格 with the deduction held fixed. -/
theorem landValueTax_monotone_base {b1 b2 basicDeduction : Money} (h : b1 ≤ b2) :
    landValueTax b1 basicDeduction ≤ landValueTax b2 basicDeduction := by
  unfold landValueTax landValueTaxRate JapanTaxLaw.TaxFinance.TaxRate.applyFloor
  exact Nat.div_le_div_right (Nat.mul_le_mul_right 3 (Nat.sub_le_sub_right h basicDeduction))

end JapanTaxLaw.LandValueTaxRate
