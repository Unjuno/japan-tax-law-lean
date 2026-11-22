import JapanTaxLaw.TaxFinance

/-!
# ForeignDesignation — 外国の指定（政令 art.2）bounded L4 モデル

Sources (pinned):
  Law id: 337CO0000000227
  Revision: 337CO0000000227_20260401_508CO0000000083
  Raw snapshot: data/raw/337CO0000000227_20260401_508CO0000000083.law.json
  Article Num 2, flat/normalized leaf text 39 chars, U+3000 count 0.

原文逐語:
  「法第二条第三号に規定する政令で指定する外国は、台湾とする。」

Computation（原文逐語から導出、指定外国の列挙のみ）:
  指定外国 = {台湾}（ただ 1 つのみ）
  国を Nat 列挙で表現: 台湾=0, その他=1
  isDesignatedForeign(c) = (c == 0)

Scope / NOT MODELLED:
  - 法2条3号の「外国居住者等」の定義・他の要件は NOT MODELLED。
  - 台湾以外の地域の取扱い、条約上の地位は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.ForeignDesignation

open JapanTaxLaw.TaxFinance

/-- 台湾 = 0。 -/
def taiwan : Nat := 0
/-- その他 = 1。 -/
def otherCountry : Nat := 1

/-- 政令で指定する外国（台湾）か。 -/
def isDesignatedForeign (country : Nat) : Bool :=
  country == taiwan

example : isDesignatedForeign taiwan = true := by decide
example : isDesignatedForeign otherCountry = false := by decide

end JapanTaxLaw.ForeignDesignation
