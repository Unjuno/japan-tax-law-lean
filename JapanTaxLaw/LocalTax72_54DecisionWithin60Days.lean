import JapanTaxLaw.TaxFinance

/-
# LocalTax72_54DecisionWithin60Days — pinned clause 「前項の規定による申出に対する総務大臣の決定は、その申出を受理した日から六十日以内にしなければならない。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 72_54, paragraph 5.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|56f6f8b178b7e92cc5e14f79876ba0076424c156b9d47f2d38fdda76f9ec7cea.
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:72_54/Article#72_54/Paragraph#5/ParagraphSentence/Sentence#1.
原文逐語: 「前項の規定による申出に対する総務大臣の決定は、その申出を受理した日から六十日以内にしなければならない。」
Scope: ONLY 申出を受理した日から六十日以内に総務大臣が決定をする期間. The 前項の申出自体, 決定の内容, the 第八条 parallel occurrence and all other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax72_54DecisionWithin60Days

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (60), INCLUSIVE. -/
def threshold : Nat := 60

/-- 「前項の規定による申出に対する総務大臣の決定は、その申出を受理した日から六十日以内にしなければならない。」. -/
def inScope (days : Nat) : Prop := days ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (days : Nat) : Bool := decide (days ≤ 60)

end JapanTaxLaw.LocalTax72_54DecisionWithin60Days
