import JapanTaxLaw.TaxFinance

/-!
# InspectionCity — 総務大臣が検査を行う市町村（政令 art.3）bounded L4 モデル

Sources (pinned):
  Law id: 333CO0000000117
  Revision: 333CO0000000117_20010106_412CO0000000304
  Raw snapshot: data/raw/333CO0000000117_20010106_412CO0000000304.law.json
  Article Num 3, flat/normalized leaf text 98 chars, U+3000 count 0.

原文逐語:
  「法第十七条の三第一項に規定する政令で定める市町村は、地方自治法
   第二百五十二条の十九第一項の指定都市及び総務大臣が指定する市とする。」

Computation（原文逐語から導出、市町村の区分列挙のみ）:
  対象 = {指定都市, 総務大臣が指定する市}（2 区分のみ）
  区分を Nat 列挙: 指定都市=0, 総務大臣指定市=1, その他=2
  isInspectionCity(c) = (c <= 1)

Scope / NOT MODELLED:
  - 法17条の3第1項の検査の内容・手続は NOT MODELLED。
  - 「指定都市」の認定・総務大臣の指定手続は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.InspectionCity

open JapanTaxLaw.TaxFinance

/-- 指定都市 = 0。 -/
def designatedCity : Nat := 0
/-- 総務大臣が指定する市 = 1。 -/
def ministerDesignatedCity : Nat := 1
/-- その他 = 2。 -/
def otherMunicipality : Nat := 2

/-- 総務大臣が検査を行う市町村（2 区分）か。 -/
def isInspectionCity (city : Nat) : Bool :=
  city <= ministerDesignatedCity

example : isInspectionCity designatedCity = true := by decide
example : isInspectionCity ministerDesignatedCity = true := by decide
example : isInspectionCity otherMunicipality = false := by decide

end JapanTaxLaw.InspectionCity
