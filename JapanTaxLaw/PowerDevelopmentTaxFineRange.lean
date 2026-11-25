import JapanTaxLaw.TaxFinance

/-!
# PowerDevelopmentTaxFineRange — 電源開発促進税法 art. 12(4) 罰金の上限（bounded computational slice）

Sources (pinned):
  Law id: 349AC0000000079
  Revision: 349AC0000000079_20250601_504AC0000000068
  Raw snapshot: data/raw/349AC0000000079_20250601_504AC0000000068.law.json
  Normative id: NORM|34a573f53421262fb9326c5c32576f2fca6484ced306c8bed76190fd5c4f2cc5
  Article Num 12, paragraph 4.

原文逐語（pinned clause, extracted from the raw snapshot）:
  「前項の犯罪に係る販売電気に対する電源開発促進税に相当する金額が五十万円を超える場合には、情状により、同項の罰金は、五十万円を超え当該電源開発促進税に相当する金額以下とすることができる。」

Computation（単位: 円。税額 > 500,000 のときのみ、
  500,000 < 罰金 <= 税額）:
  withinFineRange(taxAmount, fine) =
    if taxAmount > 500000 then 500000 < fine && fine <= taxAmount else false

Scope / NOT MODELLED:
  - 「情状により」の認定、前項の犯罪成立・税額の算定、併科・手続は
    NOT MODELLED。
  - 本モデルは有限の整数入力上の区間判定スライスのみを扱い、
    法的レビューを提供しない。
-/

namespace JapanTaxLaw.PowerDevelopmentTaxFineRange

/-- 罰金が五十万円超・税額以下の区間にあるか。 -/
def withinFineRange (taxAmount : Nat) (fine : Nat) : Bool :=
  if 500000 < taxAmount then 500000 < fine && fine <= taxAmount else false

example : withinFineRange 500001 500001 = true := by decide
example : withinFineRange 500001 500000 = false := by decide
example : withinFineRange 700000 600000 = true := by decide

end JapanTaxLaw.PowerDevelopmentTaxFineRange
