import JapanTaxLaw.TaxFinance

/-
# LocalTax774DirectorTermWithin3Years — pinned clause 「役員の任期は、三年以内において定款で定める期間とする。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 774, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|54ffe3da6c646aeab65f80b4de6357617c748c2815840ad48200b2f412500b3e.
Source path: LawBody[2]/MainProvision/MainProvision[8]/Article:774/Article#774/Paragraph#1/ParagraphSentence/Sentence#1.
原文逐語: 「役員の任期は、三年以内において定款で定める期間とする。」
Scope: ONLY 役員の任期は、三年以内において定款で定める期間とする. The 定款で定める期間の決定, the 第七百六十八条 委員の任期 parallel (modelled in batch 267) and all other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax774DirectorTermWithin3Years

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (3), INCLUSIVE. -/
def threshold : Nat := 3

/-- 「役員の任期は、三年以内において定款で定める期間とする」. -/
def inScope (years : Nat) : Prop := years ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (years : Nat) : Bool := decide (years ≤ 3)

end JapanTaxLaw.LocalTax774DirectorTermWithin3Years
