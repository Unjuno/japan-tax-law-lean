import JapanTaxLaw.ConsumptionTaxRateThreePercent

/-
# ConsumptionTaxRateThreePercentSpec — independent spec for 税制改革法 第十条

Pinned source:
  Law id: 363AC0000000107
  Revision: 363AC0000000107_19881230_000000000000000
  Raw snapshot: data/raw/363AC0000000107_19881230_000000000000000.law.json
  sha256: 65abd2145fc6c71615ba5752d906f16e4efd54b47381675bff9e50f274c6a9df
  Statutory article: 第十条 (art. 10; raw JSON Article attr.Num = "10")
  原文逐語: 「消費税は、事業者による商品の販売、役務の提供等の各段階において課税し、経済に対する中立性を確保するため、課税の累積を排除する方式によるものとし、その税率は、百分の三とする。」

INDEPENDENT FORMULATION. This module owns its own statutory constants
`specNum : Nat := 3` and `specDen : Nat := 100` (百分の三 = 3/100) and
deliberately reverses the operands of the cross-multiplication:
  spec: base * specNum == tax * specDen
  impl: tax * rateDenominator == base * rateNumerator
No implementation identifier (rateNumerator / rateDenominator /
rateIsThreePercent / taxEquals) occurs in any independent formula. The only
bridge is the universal, kernel-checked omega theorem agreeTaxEquals below,
which uses commutativity of Nat multiplication. Out of scope, as in the impl:
累積排除方式, 中立性, and the current (消費税法 art. 29) rates.
-/

namespace JapanTaxLaw.ConsumptionTaxRateThreePercent

/-- Independent 百分の三 numerator = 3. -/
def specNum : Nat := 3

/-- Independent 百分の三 denominator = 100. -/
def specDen : Nat := 100

/-- Independent exact relation, operands reversed vs the impl:
    `base * specNum == tax * specDen` (vs impl `tax * rateDen == base * rateNum`). -/
def specTaxEquals (base tax : Nat) : Bool :=
  decide (base * specNum == tax * specDen)

/-- Universal bridge: omega proves the two operand orderings equivalent for
    every base/tax, so no implementation identifier leaks into the formulas. -/
theorem agreeTaxEquals (base tax : Nat) :
    taxEquals base tax = specTaxEquals base tax := by
  unfold taxEquals specTaxEquals rateNumerator rateDenominator specNum specDen
  by_cases h : tax * 100 = base * 3
  · simp [h]
  · have h' : ¬ base * 3 = tax * 100 := by omega
    simp [h, h']

-- Spec-local, kernel-decided spot checks (scaffolding, not the statutory formula).
example : specNum = 3 := by decide
example : specDen = 100 := by decide
example : specTaxEquals 0 0 = true := by decide
example : specTaxEquals 100 3 = true := by decide
example : specTaxEquals 1000 30 = true := by decide
example : specTaxEquals 100 4 = false := by decide
example : specTaxEquals 1 0 = false := by decide

end JapanTaxLaw.ConsumptionTaxRateThreePercent
