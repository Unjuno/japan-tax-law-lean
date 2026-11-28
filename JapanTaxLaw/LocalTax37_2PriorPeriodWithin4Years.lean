import JapanTaxLaw.TaxFinance

/-
# LocalTax37_2PriorPeriodWithin4Years — pinned clause 「都道府県等が指定対象期間の初日前四年以内（当該都道府県等が指定を受けていた期間に限る。次号において「特定期間」という。）において前各号に掲げる基準のうち適合すべきこととされていたものに適合していなかつた事実がないこと（当該事実により既に第五項の規定による指定の取消し（以下この条において「指定の取消し」という。）を受けた場合を除く。）。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 37_2, paragraph 2.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|f8dd551f9904c79c8b754c91ddfca9df1101eaf6abfeb6852bfeaa4f72196fac.
原文逐語: 「都道府県等が指定対象期間の初日前四年以内（当該都道府県等が指定を受けていた期間に限る。次号において「特定期間」という。）において前各号に掲げる基準のうち適合すべきこととされていたものに適合していなかつた事実がないこと（当該事実により既に第五項の規定による指定の取消し（以下この条において「指定の取消し」という。）を受けた場合を除く。）。」
Scope: ONLY the 指定対象期間の初日前四年以内 (years <= 4) INCLUSIVE look-back window for 特定期間. 既に指定の取消しを受けた場合の除外・前各号の基準適合・第五項の取消し・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax37_2PriorPeriodWithin4Years

open JapanTaxLaw.TaxFinance

/-- 「都道府県等が指定対象期間の初日前四年以内（当該都道府県等が指定を受けていた期間に限る。次号において「特定期間」という。）において前各号に掲げる基準のうち適合すべきこととされていたものに適合していなかつた事実がないこと（当該事実により既に第五項の規定による指定の取消し（以下この条において「指定の取消し」という。）を受けた場合を除く。）。」 — statutory threshold literal (4); INCLUSIVE boundary. -/
def inScope (years : Nat) : Prop := years <= 4

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (years : Nat) : Bool := decide (years <= 4)

end JapanTaxLaw.LocalTax37_2PriorPeriodWithin4Years
