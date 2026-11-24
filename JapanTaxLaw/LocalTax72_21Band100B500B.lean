import JapanTaxLaw.TaxFinance

/-
# LocalTax72_21Band100B500B — pinned clause 「千億円を超え五千億円以下の金額」

Pinned source: law 325AC0000000226; revision 325AC0000000226_20261101_508AC0000000002; article 72_21.
Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json; normative unit NORM|0683b64b0396c0ed4c0367851f755225f971c5710c1aba5bc94c20b5772ec56c.
原文逐語: 「千億円を超え五千億円以下の金額」
Scope: ONLY the threshold/tier expressed by this clause. Rates, other tiers,
the underlying computation and other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax72_21Band100B500B

open JapanTaxLaw.TaxFinance

/-- strict lower (を超え). -/
def lower : Money := 100_000_000_000

/-- inclusive upper (以下). -/
def upper : Money := 500_000_000_000

/-- 「千億円を超え五千億円以下の金額」. -/
def inScope (amount : Money) : Prop := lower < amount ∧ amount ≤ upper


/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Money) : Bool := decide (100_000_000_000 < amount ∧ amount ≤ 500_000_000_000)

end JapanTaxLaw.LocalTax72_21Band100B500B
