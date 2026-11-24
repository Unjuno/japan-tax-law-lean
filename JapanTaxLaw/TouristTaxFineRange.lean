import JapanTaxLaw.TaxFinance

/-!
# TouristTaxFineRange — 国際観光旅客税法 art. 24(2) 罰金の上限（bounded computational slice）

Sources (pinned):
  Law id: 430AC0000000016
  Revision: 430AC0000000016_20260701_508AC0000000012
  Raw snapshot: data/raw/430AC0000000016_20260701_508AC0000000012.law.json
  Normative id: NORM|aab84fc32ce58c8a9c2f3b4ea9e1cb70a7ea86a00cefd2b0b7a1f8e1fcbcfae2
  Article Num 24, paragraph 2.

原文逐語（pinned clause, extracted from the raw snapshot）:
  「前項の納付しなかった国際観光旅客税の額が二百万円を超えるときは、情状により、同項の罰金は、二百万円を超えその納付しなかった国際観光旅客税の額に相当する金額以下とすることができる。」

Computation（単位: 円。納付しなかった税額 > 2,000,000 のときのみ、
  2,000,000 < 罰金 <= 納付しなかった税額）:
  withinFineRange(unpaid, fine) =
    if unpaid > 2000000 then fine > 2000000 && fine <= unpaid else false

Scope / NOT MODELLED:
  - 「情状により」の認定、前項の犯罪成立・納付しなかった税額の算定、
    併科・公告・手続は NOT MODELLED。
  - 本モデルは有限の整数入力上の区間判定スライスのみを扱い、
    法的レビューを提供しない。
-/

namespace JapanTaxLaw.TouristTaxFineRange

/-- 罰金が二百万円超・未納税額以下の区間にあるか。 -/
def withinFineRange (unpaid : Nat) (fine : Nat) : Bool :=
  if 2000000 < unpaid then 2000000 < fine && fine <= unpaid else false

example : withinFineRange 2000001 2000001 = true := by decide
example : withinFineRange 2000001 2000000 = false := by decide
example : withinFineRange 3000000 2500000 = true := by decide
example : withinFineRange 3000000 3000001 = false := by decide

end JapanTaxLaw.TouristTaxFineRange
