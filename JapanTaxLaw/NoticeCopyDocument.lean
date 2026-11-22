import JapanTaxLaw.TaxFinance

/-!
# NoticeCopyDocument — 法人税の特例書類（省令 art.2）bounded L4 モデル

Sources (pinned):
  Law id: 422M60000040052
  Revision: 422M60000040052_20101029_000000000000000
  Raw snapshot: data/raw/422M60000040052_20101029_000000000000000.law.json
  Article Num 2, flat/normalized leaf text 52 chars, U+3000 count 0.

原文逐語:
  「令第二条第二項に規定する財務省令で定める書類は、前条に規定する通知書の写しとする。」

Computation（原文逐語から導出、書類の列挙のみ）:
  指定書類 = {通知書の写し}（ただ 1 つのみ）
  書類を Nat 列挙: 通知書写し=0, その他=1
  isSpecifiedDocument(d) = (d == 0)

Scope / NOT MODELLED:
  - 令2条2項の特例の内容・前条の通知書の発行手続は NOT MODELLED。
  - 書類の形式・記載事項は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.NoticeCopyDocument

open JapanTaxLaw.TaxFinance

/-- 通知書の写し = 0。 -/
def noticeCopy : Nat := 0
/-- その他 = 1。 -/
def otherDocument : Nat := 1

/-- 財務省令で定める書類（通知書の写し）か。 -/
def isSpecifiedDocument (doc : Nat) : Bool :=
  doc == noticeCopy

example : isSpecifiedDocument noticeCopy = true := by decide
example : isSpecifiedDocument otherDocument = false := by decide

end JapanTaxLaw.NoticeCopyDocument
