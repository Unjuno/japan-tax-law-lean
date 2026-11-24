import JapanTaxLaw.TaxFinance

/-
# LocalTax71_14MidTier — pinned clause 「五十万円を超え三百万円以下の部分に相当する金額」

Pinned source:
  Law id: 325AC0000000226; revision 325AC0000000226_20261101_508AC0000000002; article 71_14.
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  Normative unit: NORM|23f1875b99e1ca9530b8448cc0bde166becab06b599c9fc71510b967df026cb4

原文逐語: 「五十万円を超え三百万円以下の部分に相当する金額」

Scope: ONLY the threshold/tier interval expressed by this clause. Rates,
other tiers, the underlying computation and other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax71_14MidTier

open JapanTaxLaw.TaxFinance

/-- strict lower bound (を超え). -/
def lower : Money := 500_000

/-- inclusive upper bound (以下). -/
def upper : Money := 3_000_000

/-- 金額が五十万円を超え三百万円以下の部分に相当する金額. -/
def inScope (amount : Money) : Prop := lower < amount ∧ amount ≤ upper


/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Money) : Bool := decide (500_000 < amount ∧ amount ≤ 3_000_000)

end JapanTaxLaw.LocalTax71_14MidTier
