import JapanTaxLaw.TaxFinance

/-!
# AviationFuelTaxFineRange — 航空機燃料税法 art. 23(3) 罰金の上限（bounded computational slice）

Sources (pinned):
  Law id: 431AC0000000003
  Revision: 431AC0000000003_20260401_508AC0000000002
  Raw snapshot: data/raw/431AC0000000003_20260401_508AC0000000002.law.json
  Normative id: NORM|791b0b89be1a66fddc2c631133e65ebd1ac1c49cc8e10a8ddf6dc62da698ca33
  Article Num 23, paragraph 3.

原文逐語（pinned clause, extracted from the raw snapshot）:
  「前項の納入しなかった金額が二百万円を超える場合には、情状により、同項の罰金の額は、同項の規定にかかわらず、二百万円を超える額でその納入しなかった金額に相当する額以下の額とすることができる。」

Computation（単位: 円。納入しなかった金額 > 2,000,000 のときのみ、
  2,000,000 < 罰金 <= 納入しなかった金額）:
  withinFineRange(unpaid, fine) =
    if unpaid > 2000000 then 2000000 < fine && fine <= unpaid else false

Scope / NOT MODELLED:
  - 「情状により」の認定、前項の犯罪成立・納入額の算定、併科・手続は
    NOT MODELLED。
  - 本モデルは有限の整数入力上の区間判定スライスのみを扱い、
    法的レビューを提供しない。
-/

namespace JapanTaxLaw.AviationFuelTaxFineRange

/-- 罰金が二百万円超・未納入額以下の区間にあるか。 -/
def withinFineRange (unpaid : Nat) (fine : Nat) : Bool :=
  if 2000000 < unpaid then 2000000 < fine && fine <= unpaid else false

example : withinFineRange 2000001 2000001 = true := by decide
example : withinFineRange 2000001 2000000 = false := by decide
example : withinFineRange 3000000 2500000 = true := by decide

end JapanTaxLaw.AviationFuelTaxFineRange
