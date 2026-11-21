import JapanTaxLaw.TaxFinance

/-
# ConsumptionTaxRateThreePercent — 税制改革法 第十条 (消費税の創設, 1988)

Pinned source:
  Law id: 363AC0000000107
  Revision: 363AC0000000107_19881230_000000000000000
  Raw snapshot: data/raw/363AC0000000107_19881230_000000000000000.law.json
  sha256: 65abd2145fc6c71615ba5752d906f16e4efd54b47381675bff9e50f274c6a9df
  Statutory article: 第十条 (art. 10; raw JSON Article attr.Num = "10")

原文逐語（pinned, 一字一句改変なし）:
  「消費税は、事業者による商品の販売、役務の提供等の各段階において課税し、経済に対する中立性を確保するため、課税の累積を排除する方式によるものとし、その税率は、百分の三とする。」

Variable contract:
  `base : Nat` = 課税標準 (単位 円, whole yen).
  `tax : Nat` = 消費税額 (単位 円, whole yen).
  税率 = 百分の三 = 3/100, expressed as exact integer cross-multiplication:
    tax * rateDenominator == base * rateNumerator, i.e. tax * 100 == base * 3.

Scope: ONLY the explicit numeric rate 百分の三 = 3/100 is modelled. This is a
  HISTORIC 1988 statute rate (税制改革法), distinct from the current consumption
  tax rates (消費税法 art. 29). 課税の累積を排除する方式 and 中立性 are normative,
  non-numeric language and are OUT OF SCOPE. No division or rounding is used:
  the relation is exact rational equality, so a base not divisible by 100 has
  no exact integer tax and the predicate is false there.

No `sorry`, `admit`, `axiom` or `Classical.choice`. The predicate is a direct
Bool relation; no order typeclass is used.
-/

namespace JapanTaxLaw.ConsumptionTaxRateThreePercent

/-- 百分の三 — the statutory rate numerator = 3. -/
def rateNumerator : Nat := 3

/-- 百分の三 — the statutory rate denominator = 100. -/
def rateDenominator : Nat := 100

/-- Sanity: the rate 3/100 is exactly three percent (3 * 100 == 3 * 100). -/
def rateIsThreePercent : Bool := decide (rateNumerator * 100 == 3 * rateDenominator)

/-- Exact rational relation: `taxEquals base tax` is true iff tax = base * 3/100
    with no rounding. Encoded as integer cross-multiplication to avoid division
    and its truncation semantics. -/
def taxEquals (base tax : Nat) : Bool :=
  decide (tax * rateDenominator == base * rateNumerator)

/-- 3/100 = 3% sanity witness. -/
theorem rateIsThreePercent_true : rateIsThreePercent = true := by
  decide

/-- 課税標準 100 円 → 消費税額 3 円 (百分の三, exact). -/
theorem taxEquals100 : taxEquals 100 3 = true := by
  decide

/-- 課税標準 1000 円 → 消費税額 30 円 (百分の三, exact). -/
theorem taxEquals1000 : taxEquals 1000 30 = true := by
  decide

/-- 4 円 on a 100 円 base is not 百分の三 (reject wrong tax). -/
theorem taxEquals100_wrong : taxEquals 100 4 = false := by
  decide

/-- 0 円 base → 0 円 tax. -/
theorem taxEqualsZero : taxEquals 0 0 = true := by
  decide

end JapanTaxLaw.ConsumptionTaxRateThreePercent
