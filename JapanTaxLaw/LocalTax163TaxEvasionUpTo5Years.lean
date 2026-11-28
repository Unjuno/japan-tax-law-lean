import JapanTaxLaw.TaxFinance

/-
# LocalTax163TaxEvasionUpTo5Years — pinned clause 「偽りその他不正の行為により自動車税の全部又は一部を免れたときは、その違反行為をした者は、五年以下の拘禁刑若しくは百万円以下の罰金に処し、又はこれを併科する。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 163, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|ebebef16e46fe15d8de1d0dbae3cf998052867ac1eaa0e68461444ad8609f324.
原文逐語: 「偽りその他不正の行為により自動車税の全部又は一部を免れたときは、その違反行為をした者は、五年以下の拘禁刑若しくは百万円以下の罰金に処し、又はこれを併科する。」
Scope: ONLY the 五年以下の拘禁刑 (years <= 5) INCLUSIVE ceiling for 自動車税の全部又は一部を免れた場合. 百万円以下の罰金・併科・偽りその他不正の行為の認定・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax163TaxEvasionUpTo5Years

open JapanTaxLaw.TaxFinance

/-- 「偽りその他不正の行為により自動車税の全部又は一部を免れたときは、その違反行為をした者は、五年以下の拘禁刑若しくは百万円以下の罰金に処し、又はこれを併科する。」 — statutory threshold literal (5); INCLUSIVE boundary. -/
def inScope (years : Nat) : Prop := years <= 5

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (years : Nat) : Bool := decide (years <= 5)

end JapanTaxLaw.LocalTax163TaxEvasionUpTo5Years
