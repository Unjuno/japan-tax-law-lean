import JapanTaxLaw.CorporateSpecialTaxRate2_5

/-
# CorporateSpecialTaxRate2_5Spec — independent spec for 法人特別税法 第十条

Pinned source:
  Law id: 404AC0000000015
  Revision: 404AC0000000015_20010401_413AC0000000006
  Raw snapshot: data/raw/404AC0000000015_20010401_413AC0000000006.law.json
  sha256: 603e33a8712eb9db5652935ae8d8fd793bcee4a2b5ed6fe513d2686435ffa5b8
  Statutory article: 第十条 (art. 10; raw JSON Article attr.Num = "10", Caption （税率）).
  原文逐語: 「法人特別税の額は、各課税事業年度の課税標準法人税額に百分の二・五の税率を乗じて計算した金額とする。」

INDEPENDENT FORMULATION. This module owns its own statutory constants
`specNum : Nat := 25` and `specDen : Nat := 1000` (百分の二・五 = 2.5/100 =
25/1000) and deliberately reverses the operands of the cross-multiplication:
  spec: specDen * tax == specNum * base
  impl: tax * rateDenominator == base * rateNumerator
No implementation identifier (rateNumerator / rateDenominator /
rateIsTwoPointFivePercent / taxEquals) occurs in any independent formula. The
only bridge is the universal, kernel-checked theorem agreeTaxEquals below,
which uses commutativity of Nat multiplication (a pure rewrite: no by_cases,
no omega, no Classical.choice, no quotient). Out of scope, as in the impl:
the computation of 課税標準法人税額, 各課税事業年度, 累積 and other provisions.
-/

namespace JapanTaxLaw.CorporateSpecialTaxRate2_5

/-- Independent 百分の二・五 numerator = 25. -/
def specNum : Nat := 25

/-- Independent 百分の二・五 denominator = 1000. -/
def specDen : Nat := 1000

/-- Independent exact relation, operands reversed vs the impl:
    `specDen * tax == specNum * base` (vs impl `tax * rateDen == base * rateNum`). -/
def specTaxEquals (base tax : Nat) : Bool :=
  decide (specDen * tax == specNum * base)

/-- Universal bridge: commutativity of Nat multiplication is the only bridge;
    no classical choice / quotient, no implementation identifier in the formula. -/
theorem agreeTaxEquals (base tax : Nat) :
    taxEquals base tax = specTaxEquals base tax := by
  unfold taxEquals specTaxEquals rateNumerator rateDenominator specNum specDen
  rw [Nat.mul_comm 1000 tax, Nat.mul_comm 25 base]

-- Spec-local, kernel-decided spot checks (scaffolding, not the statutory formula).
example : specNum = 25 := by decide
example : specDen = 1000 := by decide
example : specTaxEquals 0 0 = true := by decide
example : specTaxEquals 1000 25 = true := by decide
example : specTaxEquals 4000 100 = true := by decide
example : specTaxEquals 1000 26 = false := by decide
example : specTaxEquals 1 0 = false := by decide

end JapanTaxLaw.CorporateSpecialTaxRate2_5
