import JapanTaxLaw.CorporateSpecialTaxRate2_5
import JapanTaxLaw.CorporateSpecialTaxRate2_5Spec

/-
# CorporateSpecialTaxRate2_5Tests — kernel-decided checks for 法人特別税法 第十条

Pinned source: law 404AC0000000015, revision 404AC0000000015_20010401_413AC0000000006,
  data/raw/404AC0000000015_20010401_413AC0000000006.law.json,
  sha256 603e33a8712eb9db5652935ae8d8fd793bcee4a2b5ed6fe513d2686435ffa5b8.
Every closed check below is a Nat/Bool expression discharged by `by decide`.
Coverage: zero base/tax, bases 1000/4000/100/40/1, correct tax 25/100/1,
wrong tax 26/2, exact-rational sanity, and impl/spec agreement (concrete points
plus the universal commutativity bridge).
-/

namespace JapanTaxLaw.CorporateSpecialTaxRate2_5

-- (a) zero base / zero tax.
example : taxEquals 0 0 = true := by decide
example : specTaxEquals 0 0 = true := by decide
example : 0 + 0 = 0 := by decide

-- (b) correct tax at 百分の二・五 = 25/1000: 1000 -> 25, 4000 -> 100, 40 -> 1, 0 -> 0.
example : taxEquals 1000 25 = true := by decide
example : taxEquals 4000 100 = true := by decide
example : taxEquals 40 1 = true := by decide
example : taxEquals 0 0 = true := by decide

-- (c) bases with no exact integer tax at 25/1000 (no rounding / truncation).
example : taxEquals 100 2 = false := by decide
example : taxEquals 1 0 = false := by decide
example : taxEquals 1 1 = false := by decide

-- (d) wrong tax rejected: 26 on 1000, 2 on 40.
example : taxEquals 1000 26 = false := by decide
example : taxEquals 40 2 = false := by decide

-- (e) exact rational sanity: 25/1000 = 1/40 = 2.5%.
example : rateIsTwoPointFivePercent = true := by decide
example : rateNumerator = 25 := by decide
example : rateDenominator = 1000 := by decide

-- (f) Nat cross-multiplication identities and boundaries.
example : 1000 * 25 = 25 * 1000 := by decide
example : 1000 * 25 - 25 * 1000 = 0 := by decide
example : 4000 * 25 - 100 * 1000 = 0 := by decide

-- (g) impl/spec agreement at concrete points (kernel-decided).
example : taxEquals 1000 25 = specTaxEquals 1000 25 := by decide
example : taxEquals 4000 100 = specTaxEquals 4000 100 := by decide
example : taxEquals 1000 26 = specTaxEquals 1000 26 := by decide
example : taxEquals 0 0 = specTaxEquals 0 0 := by decide

-- (h) impl/spec agreement for every Nat input (universal commutativity bridge).
example (base tax : Nat) : taxEquals base tax = specTaxEquals base tax := by
  exact agreeTaxEquals base tax

end JapanTaxLaw.CorporateSpecialTaxRate2_5
