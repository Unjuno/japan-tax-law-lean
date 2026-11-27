import JapanTaxLaw.TaxFinance

/-
# LocalTax72_113PaymentWithin30Days — pinned clause 「道府県知事は、前項の規定による通知があつた場合においては、その通知があつた日から三十日以内に、第一項の徴収取扱費を支払うものとする。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 72_113, paragraph 3.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|874d63a92690f3f0e32ed5baab90873c7bc3da8bb7a1780d4af3be8272c918c6.
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:72_113/Article#72_113/Paragraph#3/ParagraphSentence/Sentence#1.
原文逐語: 「道府県知事は、前項の規定による通知があつた場合においては、その通知があつた日から三十日以内に、第一項の徴収取扱費を支払うものとする。」
Scope: ONLY the 通知があつた日から三十日以内 (days ≤ 30) deadline. 前項の通知自体, 第一項の徴収取扱費の額の算定, 支払方法, 他の項, 他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax72_113PaymentWithin30Days

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (30), INCLUSIVE ceiling. -/
def threshold : Nat := 30

/-- 「道府県知事は、前項の規定による通知があつた場合においては、その通知があつた日から三十日以内に、第一項の徴収取扱費を支払うものとする。」. -/
def inScope (days : Nat) : Prop := days ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (days : Nat) : Bool := decide (days ≤ 30)

end JapanTaxLaw.LocalTax72_113PaymentWithin30Days
