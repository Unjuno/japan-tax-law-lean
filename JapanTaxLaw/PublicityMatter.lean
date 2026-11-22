import JapanTaxLaw.TaxFinance

/-!
# PublicityMatter — 納付受託者の指定に係る公示事項（省令 art.1の11）bounded L4 モデル

Sources (pinned):
  Law id: 341M50000040055
  Revision: 341M50000040055_20260601_508M60000040016
  Raw snapshot: data/raw/341M50000040055_20260601_508M60000040016.law.json
  Article Num 1_11, flat/normalized leaf text 82 chars, U+3000 count 0.

原文逐語:
  「法第九条の六第二項（納付受託者）に規定する財務省令で定める事項は、財務大臣が
   同条第一項の規定による指定をした日とする。」

Computation（原文逐語から導出、公示事項の列挙のみ）:
  公示事項 = {財務大臣が指定をした日}（ただ 1 つのみ）
  事項を Nat 列挙: 指定日=0, その他=1
  isPublicityMatter(m) = (m == 0)

Scope / NOT MODELLED:
  - 法9条の6の納付受託者の定義・指定手続は NOT MODELLED。
  - 実際の公示の方法・時期は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.PublicityMatter

open JapanTaxLaw.TaxFinance

/-- 財務大臣が指定をした日 = 0。 -/
def designationDate : Nat := 0
/-- その他 = 1。 -/
def otherMatter : Nat := 1

/-- 財務省令で定める公示事項（指定日）か。 -/
def isPublicityMatter (matter : Nat) : Bool :=
  matter == designationDate

example : isPublicityMatter designationDate = true := by decide
example : isPublicityMatter otherMatter = false := by decide

end JapanTaxLaw.PublicityMatter
