import JapanTaxLaw.TaxFinance

/-!
# ConsumptionTaxRate — 消費税法 art. 29 (税率) L4 tax computation slice

Source (pinned):
  Law id: 363AC0000000108
  Revision: 363AC0000000108_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: 25DCCEBFFB6690902C117A4AB9C16E4D64DB087BBA6D184A10EA6AEB58AB4A82
  (data/raw/363AC0000000108_20261101_507AC0000000013.law.json,
   revision CurrentEnforced per data/INVENTORY.json)

Models 消費税法 art. 29:

  一 課税資産の譲渡等・特定課税仕入れ及び保税地域から引き取られる課税貨物
              （軽減対象課税資産の譲渡等を除く。）
              → 百分の七・八 (7.8%)
  二 軽減対象課税資産の譲渡等及び保税地域から引き取られる軽減対象課税貨物
              → 百分の六・二四 (6.24%)

Scope and honesty notes:

* This is the **national consumption tax** rate (art. 29). The local
  consumption tax (地方消費税, 地方税法 art. 34-2) is a separate law and
  is not modelled here.
* art. 29(1)(二) defines 軽減対象課税資産の譲渡等 by reference to
  art. 7-2(1) (food and certain printed matter subject to reduced rate).
  Whether a given transaction qualifies is an external legal judgment; the
  `reduced : Bool` parameter stands in for that externally established fact.
  The definition of which goods qualify is **out of scope** here.
* art. 30 tax-credit mechanics, art. 28 taxable base, and special refund rules
  are not modelled here.
* The denominator is 1000 / 10000 — as written in the law's
  decimal-literal form ("百分の七・八" / "百分の六・二四"), i.e.
  pct / 1000 / pct / 10000.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- 百分の七・八 — national consumption tax on ordinary taxable supplies/inputs
    (art. 29(1) 一号). -/
def standardRate : TaxRate := ⟨78, 1000, by decide⟩

/-- 百分の六・二四 — national consumption tax on reduced-rate supplies
    (art. 29(1) 二号). -/
def reducedRate : TaxRate := ⟨624, 10000, by decide⟩

/-- Art. 29 rate for a supply: standard 7.8%, or reduced 6.24% when the supply
    qualifies as a 軽減対象課税資産の譲渡等 (art. 29(1) 二号). -/
def rateOf (reduced : Bool) : TaxRate :=
  if reduced then reducedRate else standardRate

/-- The consumption-tax amount on `base` yen at the standard or reduced rate
    (per-product floor). -/
def consumptionTax (base : Money) (reduced : Bool) : Money :=
  (rateOf reduced).applyFloor base

/-- Art. 29 sanity: 0 tax on 0 base. -/
theorem consumptionTax_zero (reduced : Bool) : consumptionTax 0 reduced = 0 := by
  unfold consumptionTax rateOf TaxFinance.TaxRate.applyFloor
  cases reduced <;> rfl

/-- The standard-rate bindings are exact multiples: ¥100,000 gives ¥7,800. -/
example : consumptionTax 100_000 false = 7_800 := by decide
example : consumptionTax 100_000 true = 6_240 := by decide

/-- Exactness witness: the reduced rate is identical to standard × 0.8. -/
example : reducedRate.applyFloor 100_000 * 5 = standardRate.applyFloor 100_000 * 4 := by decide

-- ==== verified facts ====

/-- Standard rate is monotone-increasing wrt the base (national floor semantics). -/
theorem standardRate_monotone {x y : Money} (h : x ≤ y) :
    standardRate.applyFloor x ≤ standardRate.applyFloor y := by
  have hmul : x * 78 ≤ y * 78 := Nat.mul_le_mul_right 78 h
  exact Nat.div_le_div_right hmul

/-- Reduced rate is monotone-increasing wrt the base. -/
theorem reducedRate_monotone {x y : Money} (h : x ≤ y) :
    reducedRate.applyFloor x ≤ reducedRate.applyFloor y := by
  have hmul : x * 624 ≤ y * 624 := Nat.mul_le_mul_right 624 h
  exact Nat.div_le_div_right hmul

end JapanTaxLaw
