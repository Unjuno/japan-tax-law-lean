import JapanTaxLaw.TaxFinance

/-!
# InheritanceTaxArt21_16GiftTimeValuation — EFFECT

Pinned source:
  Law id: 325AC0000000073
  Official title: 相続税法
  Law number: 昭和二十五年法律第七十三号
  Law type: Act (法律)
  Raw snapshot: data/raw/325AC0000000073_*.law.json
  sha256: c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7
  Normative unit id: NORM|f700e89529600c036887cb663aa17cca3e9d41bf656bbb9ca383e8a6da537af4
  Source path: LawBody[3]/MainProvision/MainProvision[1]/Article:21_16/Article#21_16/Paragraph#3/Item#1/ItemSentence/Sentence#1

原文逐語（pinned, 一字一句改変なし）:
  「当該財産の価額は、第一項の贈与の時における価額とする。」

Norm kind: EFFECT — 当該財産の価額 (the value of the asset) is 第一項の贈与の時における価額 (the value
at the time of the paragraph-1 gift). The computable slice models the
valuation-time selection: the value is fixed at the gift time, not another time.
All statutory terms below are reproduced programmatically from the verbatim
needle; the canonical quote is byte-verbatim.

Variable contract (meaning / domain / type):
  ValuationTime : Type — giftTime (贈与の時) or other.
  valuationTime : ValuationTime — the selected valuation time.
  No numeric amount/unit applies (structural valuation-time selection); the actual
  asset value is caller-established.

Scope: only the valuation-time selection. The substantive valuation method, the
selection of the asset, and legal correctness are NOT MODELLED.
Human legal review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.InheritanceTaxArt21_16GiftTimeValuation

/-- The valuation times relevant to the provision. -/
inductive ValuationTime : Type
  | giftTime : ValuationTime
  | other : ValuationTime

/-- 第一項の贈与の時における価額とする: value at the time of the gift. -/
def valuationTime : ValuationTime := ValuationTime.giftTime

/-- The valuation time is the gift time. -/
theorem time_is_gift : valuationTime = ValuationTime.giftTime := rfl

/-- The valuation time is not 'other'. -/
theorem time_not_other : valuationTime ≠ ValuationTime.other := by
  unfold valuationTime
  intro h
  cases h

end JapanTaxLaw.InheritanceTaxArt21_16GiftTimeValuation
