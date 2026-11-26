import JapanTaxLaw.TaxFinance

/-
# LocalTax7NoticeCountOver5 — pinned clause 「当該申告特例対象年に支出した特例控除対象寄附金について、前項の規定により申告特例通知書を送付した都道府県知事等の数が五を超えたとき。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002, article 第七条 (Num 7), paragraph 6, item 3 (附則, SupplProvision[26]).
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|684887421d790491d80566333d163df1918443214a9cca488c35761f9813f27e.
Source path: LawBody[3]/SupplProvision/SupplProvision[26]/Article:7/Article#7/Paragraph#6/Item#3/ItemSentence/Sentence#1.
原文逐語: 「当該申告特例対象年に支出した特例控除対象寄附金について、前項の規定により申告特例通知書を送付した都道府県知事等の数が五を超えたとき。」
Scope: ONLY the strict 五を超え count threshold (五 = 5 通知先). The donation
classification, the notification duty itself, paragraph 13, other items and
other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax7NoticeCountOver5

open JapanTaxLaw.TaxFinance

/-- 五 — を超え (strict, 5 都道府県知事等). -/
def threshold : Nat := 5

/-- 「申告特例通知書を送付した都道府県知事等の数が五を超えた」. -/
def inScope (count : Nat) : Prop := threshold < count

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (count : Nat) : Bool := decide (5 < count)

end JapanTaxLaw.LocalTax7NoticeCountOver5
