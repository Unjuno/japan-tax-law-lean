import JapanTaxLaw.TaxFinance

/-
# LocalTax321_15TwoOrMorePrefectures — pinned clause 「前条第六項の通知に係る同条第一項の市町村長の処分に不服がある関係市町村長は、道府県知事（関係市町村が二以上の道府県に係るときは、総務大臣）に対し、決定を求める旨を申し出ることができる。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 321_15, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|1fc2ab63bbf4a1b5e319927bae738c1d86adb78a16951d2135a3e09224f7ba8c.
原文逐語: 「前条第六項の通知に係る同条第一項の市町村長の処分に不服がある関係市町村長は、道府県知事（関係市町村が二以上の道府県に係るときは、総務大臣）に対し、決定を求める旨を申し出ることができる。」
Scope: ONLY the 関係市町村が二以上の道府県 (2 <= prefectures) INCLUSIVE lower bound selecting 総務大臣 as 裁決庁. 前条第六項の通知・第一項の処分・不服申立て手続・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax321_15TwoOrMorePrefectures

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (2), INCLUSIVE lower bound. -/
def threshold : Nat := 2

/-- 「前条第六項の通知に係る同条第一項の市町村長の処分に不服がある関係市町村長は、道府県知事（関係市町村が二以上の道府県に係るときは、総務大臣）に対し、決定を求める旨を申し出ることができる。」. -/
def inScope (prefectures : Nat) : Prop := threshold <= prefectures

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (prefectures : Nat) : Bool := decide (2 <= prefectures)

end JapanTaxLaw.LocalTax321_15TwoOrMorePrefectures
