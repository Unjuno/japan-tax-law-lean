import JapanTaxLaw.TaxFinance

/-
# CorporateSpecialTaxRate2_5 — 法人特別税法 第十条（税率, 2001）

Pinned source:
  Law id: 404AC0000000015
  Revision: 404AC0000000015_20010401_413AC0000000006
  Raw snapshot: data/raw/404AC0000000015_20010401_413AC0000000006.law.json
  sha256: 603e33a8712eb9db5652935ae8d8fd793bcee4a2b5ed6fe513d2686435ffa5b8
  Statutory article: 第十条 (art. 10; raw JSON Article attr.Num = "10", Caption （税率）).
  Law title: 法人特別税法 (Act, 平成四年法律第十五号); revision enforced 2001-04-01.

原文逐語（pinned, 一字一句改変なし）:
  「法人特別税の額は、各課税事業年度の課税標準法人税額に百分の二・五の税率を乗じて計算した金額とする。」

Variable contract:
  `base : Nat` = 課税標準法人税額 (単位 円, whole yen).
  `tax : Nat` = 法人特別税の額 (単位 円, whole yen).
  税率 百分の二・五 = 2.5/100 = 25/1000 = 1/40, expressed as exact integer
    cross-multiplication: tax * 1000 == base * 25.

Scope: ONLY the explicit numeric rate 百分の二・五 = 25/1000 is modelled. This is
  a HISTORIC statute rate (法人特別税法 art. 10, enforced 2001-04-01). The
  『各課税事業年度』 timing, the computation of 課税標準法人税額, 累積 and all other
  provisions are OUT OF SCOPE. No division or rounding is used: the relation is
  exact rational equality, so a base with no exact integer tax at 25/1000 makes
  the predicate false there.

No `sorry`, `admit`, `axiom` or `Classical.choice`. The predicate is a direct
Bool relation; no order typeclass, no by_cases and no omega is used.
-/

namespace JapanTaxLaw.CorporateSpecialTaxRate2_5

/-- 百分の二・五 = 2.5/100 = 25/1000 — statutory rate numerator = 25. -/
def rateNumerator : Nat := 25

/-- 百分の二・五 — statutory rate denominator = 1000. -/
def rateDenominator : Nat := 1000

/-- Sanity: 25/1000 reduces to 1/40 (25 * 40 == 1 * 1000). -/
def rateIsTwoPointFivePercent : Bool := decide (rateNumerator * 40 == 1 * rateDenominator)

/-- Exact rational relation: `taxEquals base tax` is true iff tax = base * 25/1000
    with no rounding. Encoded as integer cross-multiplication to avoid division
    and its truncation semantics. -/
def taxEquals (base tax : Nat) : Bool :=
  decide (tax * rateDenominator == base * rateNumerator)

/-- 25/1000 = 1/40 = 2.5% sanity witness. -/
theorem rateIsTwoPointFivePercent_true : rateIsTwoPointFivePercent = true := by
  decide

/-- 課税標準法人税額 1000 円 → 法人特別税額 25 円 (百分の二・五, exact). -/
theorem taxEquals1000 : taxEquals 1000 25 = true := by
  decide

/-- 課税標準法人税額 4000 円 → 法人特別税額 100 円 (百分の二・五, exact). -/
theorem taxEquals4000 : taxEquals 4000 100 = true := by
  decide

/-- 26 円 on a 1000 円 base is not 百分の二・五 (reject wrong tax). -/
theorem taxEquals1000_wrong : taxEquals 1000 26 = false := by
  decide

/-- 0 円 base → 0 円 tax. -/
theorem taxEqualsZero : taxEquals 0 0 = true := by
  decide

end JapanTaxLaw.CorporateSpecialTaxRate2_5
