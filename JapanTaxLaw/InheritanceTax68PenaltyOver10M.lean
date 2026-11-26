import JapanTaxLaw.TaxFinance

/-
# InheritanceTax68PenaltyOver10M — pinned clause 「前項の免れた相続税額又は贈与税額が千万円を超えるときは、情状により、同項の罰金は、千万円を超えその免れた相続税額又は贈与税額に相当する金額以下とすることができる。」

Pinned: law 325AC0000000073 (相続税法), revision 325AC0000000073_20260401_506AC0000000008,
article Num 68, paragraph 2.
Raw: data/raw/325AC0000000073_20260401_506AC0000000008.law.json (SHA-256 c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7). Normative unit: NORM|eba9f66fb67552c4ceaf56fe04af9a35b3174396499330bd3b9775f587dcaa37.
Source path: LawBody[3]/MainProvision/MainProvision[7]/Article:68/Article#68/Paragraph#2/ParagraphSentence/Sentence#1.
原文逐語: 「前項の免れた相続税額又は贈与税額が千万円を超えるときは、情状により、同項の罰金は、千万円を超えその免れた相続税額又は贈与税額に相当する金額以下とすることができる。」
Scope: ONLY 免れた相続税額又は贈与税額が千万円を超える場合の罰金加重の下限. The 千万円以下の金額, 金額以下の上限, 情状による軽減判断, the 第九十四条 parallel clause and all other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.InheritanceTax68PenaltyOver10M

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (10000000), STRICT. -/
def threshold : Nat := 10000000

/-- 「前項の免れた相続税額又は贈与税額が千万円を超えるときは、情状により、同項の罰金は、千万円を超えその免れた相続税額又は贈与税額に相当する金額以下とすることができる。」. -/
def inScope (yen : Nat) : Prop := threshold < yen

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (yen : Nat) : Bool := decide (10000000 < yen)

end JapanTaxLaw.InheritanceTax68PenaltyOver10M
