import JapanTaxLaw.TaxFinance

/-
# LocalTax22SecrecyDisclosureUpTo2Years — pinned clause 「地方税に関する調査（不服申立てに係る事件の審理のための調査及び地方税の犯則事件の調査を含む。）若しくは租税条約等の実施に伴う所得税法、法人税法及び地方税法の特例等に関する法律（昭和四十四年法律第四十六号）の規定に基づいて行う情報の提供のための調査に関する事務又は地方税の徴収に関する事務に従事している者又は従事していた者は、これらの事務に関して知り得た秘密を漏らし、又は窃用した場合においては、二年以下の拘禁刑又は百万円以下の罰金に処する。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 22, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|9880699951db4e5a92068bccce60abdcad16e103a21ff4c16369578f7ceac728.
原文逐語: 「地方税に関する調査（不服申立てに係る事件の審理のための調査及び地方税の犯則事件の調査を含む。）若しくは租税条約等の実施に伴う所得税法、法人税法及び地方税法の特例等に関する法律（昭和四十四年法律第四十六号）の規定に基づいて行う情報の提供のための調査に関する事務又は地方税の徴収に関する事務に従事している者又は従事していた者は、これらの事務に関して知り得た秘密を漏らし、又は窃用した場合においては、二年以下の拘禁刑又は百万円以下の罰金に処する。」
Scope: ONLY the 二年以下の拘禁刑 (years <= 2) INCLUSIVE ceiling for a person engaged in local-tax investigation who leaks or misuses a known secret. 百万円以下の罰金・両罰規定・犯則事件の調査手続・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax22SecrecyDisclosureUpTo2Years

open JapanTaxLaw.TaxFinance

/-- 「地方税に関する調査（不服申立てに係る事件の審理のための調査及び地方税の犯則事件の調査を含む。）若しくは租税条約等の実施に伴う所得税法、法人税法及び地方税法の特例等に関する法律（昭和四十四年法律第四十六号）の規定に基づいて行う情報の提供のための調査に関する事務又は地方税の徴収に関する事務に従事している者又は従事していた者は、これらの事務に関して知り得た秘密を漏らし、又は窃用した場合においては、二年以下の拘禁刑又は百万円以下の罰金に処する。」 — statutory threshold literal (2); INCLUSIVE boundary. -/
def inScope (years : Nat) : Prop := years <= 2

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (years : Nat) : Bool := decide (years <= 2)

end JapanTaxLaw.LocalTax22SecrecyDisclosureUpTo2Years
