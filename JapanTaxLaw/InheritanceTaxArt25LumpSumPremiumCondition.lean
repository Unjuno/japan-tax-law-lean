import JapanTaxLaw.TaxFinance

/-!
# InheritanceTaxArt25LumpSumPremiumCondition — CONDITION

Pinned source:
  Law id: 325AC0000000073
  Official title: 相続税法
  Law number: 昭和二十五年法律第七十三号
  Law type: Act (法律)
  Raw snapshot: data/raw/325AC0000000073_*.law.json
  sha256: c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7
  Normative unit id: NORM|fa8a8f71f0be091e2a94232147a20ebd42a46628962557f1d83fdafcdab82cbb
  Source path: LawBody[3]/MainProvision/MainProvision[2]/Article:25/Article#25/Paragraph#1/Item#1/Subitem1#1/Subitem1Sentence/Column#1/Sentence#1

原文逐語（pinned, 一字一句改変なし）:
  「当該契約に係る掛金又は保険料が一時に払い込まれた場合」

Norm kind: CONDITION — a valuation-rule branch condition: 当該契約に係る掛金又は保険料 (the premium
or insurance payment under the contract) was paid in a lump sum (一時に払い込まれた).
The computable slice models the payment-timing discriminator that selects this
branch. All statutory terms below are reproduced programmatically from the
verbatim needle; the canonical quote is byte-verbatim.

Variable contract (meaning / domain / type):
  PaymentTiming : Type — lumpSum (一時に払い込まれた) or other.
  isLumpSum : PaymentTiming -> Bool — true for the lump-sum branch.
  No numeric amount/unit applies (structural branch discriminator); the actual
  valuation amount is caller-established.

Scope: only the payment-timing discriminator. The column's valuation amount, the
other items' branches, and legal correctness are NOT MODELLED.
Human legal review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.InheritanceTaxArt25LumpSumPremiumCondition

/-- The payment timings relevant to the valuation branch. -/
inductive PaymentTiming : Type
  | lumpSum : PaymentTiming
  | other : PaymentTiming

/-- 一時に払い込まれた場合: the lump-sum branch. -/
def isLumpSum (t : PaymentTiming) : Bool :=
  match t with
  | PaymentTiming.lumpSum => true
  | PaymentTiming.other => false

/-- The lump-sum timing selects this branch. -/
theorem lump_sum_selected : isLumpSum PaymentTiming.lumpSum = true := rfl

/-- Other timing does not select this branch. -/
theorem other_not_selected : isLumpSum PaymentTiming.other = false := rfl

end JapanTaxLaw.InheritanceTaxArt25LumpSumPremiumCondition
