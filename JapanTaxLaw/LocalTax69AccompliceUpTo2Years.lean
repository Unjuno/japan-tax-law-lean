import JapanTaxLaw.TaxFinance

/-
# LocalTax69AccompliceUpTo2Years — pinned clause 「情を知つて前二項の行為につき納税者又はその財産を占有する第三者の相手方となつたときは、その相手方としてその違反行為をした者は、二年以下の拘禁刑若しくは百五十万円以下の罰金に処し、又はこれを併科する。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 69, paragraph 3.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|713981f94fc0ba86398ae19c0b2db71fb733699f325cdf3527971f3e17db756c.
原文逐語: 「情を知つて前二項の行為につき納税者又はその財産を占有する第三者の相手方となつたときは、その相手方としてその違反行為をした者は、二年以下の拘禁刑若しくは百五十万円以下の罰金に処し、又はこれを併科する。」
Scope: ONLY the 二年以下の拘禁刑 (years <= 2) INCLUSIVE ceiling for 情を知つて前二項の行為の相手方となつた場合. 百五十万円以下の罰金・併科・前二項の行為の認定・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax69AccompliceUpTo2Years

open JapanTaxLaw.TaxFinance

/-- 「情を知つて前二項の行為につき納税者又はその財産を占有する第三者の相手方となつたときは、その相手方としてその違反行為をした者は、二年以下の拘禁刑若しくは百五十万円以下の罰金に処し、又はこれを併科する。」 — statutory threshold literal (2); INCLUSIVE boundary. -/
def inScope (years : Nat) : Prop := years <= 2

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (years : Nat) : Bool := decide (years <= 2)

end JapanTaxLaw.LocalTax69AccompliceUpTo2Years
