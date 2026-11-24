import JapanTaxLaw.TaxFinance

/-
# LocalTax37_2Over40M — pinned clause 「四千万円を超える金額」

Pinned source:
  Law id: 325AC0000000226; revision 325AC0000000226_20261101_508AC0000000002; article 37_2.
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  Normative unit: NORM|816a9b3ed494c525f1b3970bb086dc444def10430a0483525f23f6c845f93a6c

原文逐語: 「四千万円を超える金額」

Scope: ONLY the threshold/tier interval expressed by this clause. Rates,
other tiers, the underlying computation and other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax37_2Over40M

open JapanTaxLaw.TaxFinance

/-- 四千万 — strict lower bound (を超え). -/
def threshold : Money := 40_000_000

/-- 金額が四千万円を超える金額. -/
def inScope (amount : Money) : Prop := threshold < amount


/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Money) : Bool := decide (40_000_000 < amount)

end JapanTaxLaw.LocalTax37_2Over40M
