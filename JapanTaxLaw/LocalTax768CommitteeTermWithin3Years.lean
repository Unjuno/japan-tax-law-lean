import JapanTaxLaw.TaxFinance

/-
# LocalTax768CommitteeTermWithin3Years — pinned clause 「委員の任期は、三年以内において定款で定める期間とする。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 768, paragraph 4.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|e1559bdd4ddc4d9df46494c2f23d924ad0bce2407bd86b187f84e870b5ce5fd1.
Source path: LawBody[2]/MainProvision/MainProvision[8]/Article:768/Article#768/Paragraph#4/ParagraphSentence/Sentence#1.
原文逐語: 「委員の任期は、三年以内において定款で定める期間とする。」
Scope: ONLY 委員の任期を三年以内において定款で定める期間とする. The 定款で定める期間の決定, the 第七百七十四条 officer-term parallel and all other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax768CommitteeTermWithin3Years

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (3), INCLUSIVE. -/
def threshold : Nat := 3

/-- 「委員の任期を三年以内において定款で定める期間とする」. -/
def inScope (years : Nat) : Prop := years ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (years : Nat) : Bool := decide (years ≤ 3)

end JapanTaxLaw.LocalTax768CommitteeTermWithin3Years
