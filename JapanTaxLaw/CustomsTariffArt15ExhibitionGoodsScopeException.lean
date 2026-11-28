import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt15ExhibitionGoodsScopeException — EXCEPTION

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Raw snapshot: data/raw/143AC0000000054_*.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|b8c681082e69caab3f288bf5c824986816c4dde9fb96a4ff4338c23802a970a4
  Source path: LawBody[1]/MainProvision/MainProvision[28]/Article:15/Article#15/Paragraph#1/Item#5_2/ItemSentence/Sentence#2

原文逐語（pinned, 一字一句改変なし）:
  「ただし、博覧会等の開催の期間及び規模、物品の種類及び価格その他の事情を勘案して相当と認められるものに限る。」

Norm kind: EXCEPTION — the exhibition-goods relief is limited to what is
recognized as reasonable given the exhibition's period/scale, goods' kind/price
and other circumstances. The computable slice models the three consideration
gates. The statutory quote above is byte-verbatim from the pinned source;
English prose here is descriptive only.

Variable contract (meaning / domain / type):
  periodScaleReasonable : Bool — caller-established period/scale reasonableness.
  kindPriceReasonable : Bool — caller-established kind/price reasonableness.
  otherCircumstancesReasonable : Bool — caller-established other-circumstances
    reasonableness.
  inScope : Bool -> Bool -> Bool -> Bool — conjunction of the three gates.
  No numeric amount/unit applies (structural gate). What counts as reasonable,
  the exhibition itself and legal correctness are NOT MODELLED. Human legal
  review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt15ExhibitionGoodsScopeException

/-- All three consideration gates. -/
def inScope (periodScaleReasonable kindPriceReasonable otherCircumstancesReasonable : Bool) : Bool :=
  periodScaleReasonable && kindPriceReasonable && otherCircumstancesReasonable

/-- All three gates true puts the goods in scope. -/
theorem all_true_in_scope : inScope true true true = true := rfl

/-- Unreasonable period/scale takes the goods out of scope. -/
theorem bad_period_scale_out_of_scope : inScope false true true = false := rfl

/-- Unreasonable kind/price takes the goods out of scope. -/
theorem bad_kind_price_out_of_scope : inScope true false true = false := rfl

/-- Unreasonable other circumstances take the goods out of scope. -/
theorem bad_other_out_of_scope : inScope true true false = false := rfl

end JapanTaxLaw.CustomsTariffArt15ExhibitionGoodsScopeException
