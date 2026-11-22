import JapanTaxLaw.TaxFinance

/-!
# FilingRoute — 届出の経由経路（酒税法施行令 art.9）bounded L4 モデル

Sources (pinned):
  Law id: 328CO0000000028
  Revision: 328CO0000000028_20220401_504CO0000000151
  Raw snapshot: data/raw/328CO0000000028_20220401_504CO0000000151.law.json
  Article Num 9, flat/normalized leaf text 71 chars, U+3000 count 0.

原文逐語:
  「法第八十七条の規定による届出は、財務省令で定めるところにより、所轄税務署長、
   所轄国税局長又は国税庁長官を経由してするものとする。」

Computation（原文逐語から導出、経由機関の列挙のみ）:
  経由機関 = {所轄税務署長, 所轄国税局長, 国税庁長官}（3 つのみ）
  機関を Nat 列挙: 税務署長=0, 国税局長=1, 国税庁長官=2, その他=3
  isCompetentAuthority(a) = (a <= 2)

Scope / NOT MODELLED:
  - 法87条の届出の内容・財務省令の具体手続は NOT MODELLED。
  - 「所轄」の管轄判定、実際の経由手続は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.FilingRoute

open JapanTaxLaw.TaxFinance

/-- 所轄税務署長 = 0。 -/
def taxOfficeHead : Nat := 0
/-- 所轄国税局長 = 1。 -/
def regionalTaxBureauHead : Nat := 1
/-- 国税庁長官 = 2。 -/
def nationalTaxAgencyHead : Nat := 2
/-- その他 = 3。 -/
def otherAuthority : Nat := 3

/-- 届出を経由できる機関（3 種類）か。 -/
def isCompetentAuthority (authority : Nat) : Bool :=
  authority <= nationalTaxAgencyHead

example : isCompetentAuthority taxOfficeHead = true := by decide
example : isCompetentAuthority regionalTaxBureauHead = true := by decide
example : isCompetentAuthority nationalTaxAgencyHead = true := by decide
example : isCompetentAuthority otherAuthority = false := by decide

end JapanTaxLaw.FilingRoute
