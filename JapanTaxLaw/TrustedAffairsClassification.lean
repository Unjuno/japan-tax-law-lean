import JapanTaxLaw.TaxFinance

/-!
# TrustedAffairsClassification — 事務の区分（政令 art.10）bounded L4 モデル

Sources (pinned):
  Law id: 504CO0000000300
  Revision: 504CO0000000300_20260401_508CO0000000083
  Raw snapshot: data/raw/504CO0000000300_20260401_508CO0000000083.law.json
  Article Num 10, flat/normalized leaf text 90 chars, U+3000 count 0.

原文逐語:
  「第二条第一項の規定により都道府県が処理することとされている事務は、地方自治法
   第二条第九項第一号に規定する第一号法定受託事務とする。」

Computation（原文逐語から導出、事務区分の列挙のみ）:
  指定区分 = {第一号法定受託事務}（ただ 1 つのみ）
  区分を Nat 列挙: 第一号法定受託事務=0, その他=1
  isTrustedAffair(c) = (c == 0)

Scope / NOT MODELLED:
  - 法2条1項の都道府県が処理する事務の具体内容は NOT MODELLED。
  - 地方自治法の他の法定受託事務区分（第二号等）は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.TrustedAffairsClassification

open JapanTaxLaw.TaxFinance

/-- 第一号法定受託事務 = 0。 -/
def firstCategoryTrustedAffair : Nat := 0
/-- その他 = 1。 -/
def otherAffair : Nat := 1

/-- 第一号法定受託事務（政令で定める区分）か。 -/
def isTrustedAffair (affair : Nat) : Bool :=
  affair == firstCategoryTrustedAffair

example : isTrustedAffair firstCategoryTrustedAffair = true := by decide
example : isTrustedAffair otherAffair = false := by decide

end JapanTaxLaw.TrustedAffairsClassification
