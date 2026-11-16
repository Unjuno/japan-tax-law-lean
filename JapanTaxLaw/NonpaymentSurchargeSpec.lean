import JapanTaxLaw.NonpaymentSurcharge

/-!
# NonpaymentSurcharge spec — 国税通則法 art. 67（不納付加算税）

Sources (pinned; identical to NonpaymentSurcharge.lean):

  Law id: 337AC0000000066
  Revision: 337AC0000000066_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01

Independent restatement of:
  * 1項: 不納付加算税 = 税額 × 10%（百分の十）
  * 2項: 軽減時 = 税額 × 5%（百分の五）
  impl が TaxRate.applyFloor を使うのに対し、spec は整数式 `tax * 10 / 100` / `tax * 5 / 100`
  で独立に定式化。

Scope boundaries identical to the implementation.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: art. 67(1) 基本（独立定式）。 -/
def specNonpaymentSurchargeBasic (tax : Money) : Money := tax * 10 / 100

/-- Spec: art. 67(2) 軽減（独立定式）。 -/
def specNonpaymentSurchargeReduced (tax : Money) : Money := tax * 5 / 100

/-- Spec: art. 67(1)(2) 本体。 -/
def specNonpaymentSurcharge (tax : Money) (reduced : Bool) : Money :=
  if reduced then specNonpaymentSurchargeReduced tax else specNonpaymentSurchargeBasic tax

-- ==== points (kernel-decided) ====

example : specNonpaymentSurchargeBasic 100_000 = 10_000 := by decide
example : specNonpaymentSurchargeReduced 100_000 = 5_000 := by decide
example : specNonpaymentSurcharge 100_000 false = 10_000 := by decide
example : specNonpaymentSurcharge 100_000 true = 5_000 := by decide
example : specNonpaymentSurcharge 1 false = 0 := by decide

/-- Agreement checks between implementation and Spec. -/
def agreeNonpaymentSurcharge : Bool :=
  [0, 1, 99, 100, 10_000, 100_000, 1_000_000].all fun tax =>
    nonpaymentSurcharge tax false == specNonpaymentSurcharge tax false
    && nonpaymentSurcharge tax true == specNonpaymentSurcharge tax true

example : agreeNonpaymentSurcharge = true := by decide

end JapanTaxLaw
