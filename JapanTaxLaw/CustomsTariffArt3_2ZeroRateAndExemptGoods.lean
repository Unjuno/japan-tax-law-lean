import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt3_2ZeroRateAndExemptGoods — REFERENCE

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Raw snapshot: data/raw/143AC0000000054_*.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|3860b04f653665e60dc8012064fa44884eddeb064ba1d0724372454c2946bb5a
  Source path: LawBody[1]/MainProvision/MainProvision[3]/Article:3_2/Article#3_2/Paragraph#2/Item#1/ItemSentence/Sentence#1

原文逐語（pinned, 一字一句改変なし）:
  「この法律その他関税に関する法律の規定により関税の率が無税とされている貨物及び関税が免除される貨物」

Norm kind: REFERENCE — the referenced class comprises goods whose customs rate
is zero under this or other customs laws, and goods exempted from customs duty.
The computable slice models the class selection by category. The statutory
quote above is byte-verbatim from the pinned source; English prose here is
descriptive only.

Variable contract (meaning / domain / type):
  GoodClass : Type — zeroRate, exempt, other.
  inScope : GoodClass -> Prop — whether the class is referenced by the item.
  No numeric amount/unit applies (structural classification). Actual goods
  lists and legal correctness are NOT MODELLED.
  Human legal review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt3_2ZeroRateAndExemptGoods

/-- Goods classes relevant to the referenced item. -/
inductive GoodClass : Type
  | zeroRate : GoodClass
  | exempt : GoodClass
  | other : GoodClass

/-- The item references zero-rate and exempt goods. -/
def inScope : GoodClass -> Prop
  | GoodClass.zeroRate => True
  | GoodClass.exempt => True
  | GoodClass.other => False

/-- A zero-rate good is in scope. -/
theorem zero_rate_in_scope : inScope GoodClass.zeroRate := by trivial

/-- An exempt good is in scope. -/
theorem exempt_in_scope : inScope GoodClass.exempt := by trivial

/-- An unrelated good is not in scope. -/
theorem other_not_in_scope : ¬ inScope GoodClass.other := by
  intro h
  cases h

end JapanTaxLaw.CustomsTariffArt3_2ZeroRateAndExemptGoods
