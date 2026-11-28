import JapanTaxLaw.TaxFinance

/-
# LocalTax144_33UnapprovedOilUpTo2Years — pinned clause 「前条第一項の規定に違反して道府県知事の承認を受けないで同項第三号若しくは第四号の行為を行つたとき、又は偽りその他不正の手段により同項の承認を受けたときは、その違反行為をした者は、二年以下の拘禁刑又は百万円以下の罰金に処する。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 144_33, paragraph 4.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|e9b25c324881b3b0fca31436899c8a8db88c7146f706f23e1a1af241c254ba55.
原文逐語: 「前条第一項の規定に違反して道府県知事の承認を受けないで同項第三号若しくは第四号の行為を行つたとき、又は偽りその他不正の手段により同項の承認を受けたときは、その違反行為をした者は、二年以下の拘禁刑又は百万円以下の罰金に処する。」
Scope: ONLY the 二年以下の拘禁刑 (years <= 2) INCLUSIVE ceiling for acting on hydrocarbon oil without prefectural-governor approval or by improper means. 百万円以下の罰金・承認の認定・第三号第四号の行為の内容・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax144_33UnapprovedOilUpTo2Years

open JapanTaxLaw.TaxFinance

/-- 「前条第一項の規定に違反して道府県知事の承認を受けないで同項第三号若しくは第四号の行為を行つたとき、又は偽りその他不正の手段により同項の承認を受けたときは、その違反行為をした者は、二年以下の拘禁刑又は百万円以下の罰金に処する。」 — statutory threshold literal (2); INCLUSIVE boundary. -/
def inScope (years : Nat) : Prop := years <= 2

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (years : Nat) : Bool := decide (years <= 2)

end JapanTaxLaw.LocalTax144_33UnapprovedOilUpTo2Years
