import JapanTaxLaw.TaxFinance

/-
# LocalTax72_49_3CorpBusinessTaxEvasionUpTo10Years — pinned clause 「偽りその他不正の行為により法人の行う事業に対する事業税の全部又は一部を免れた場合には、法人の代表者（法人課税信託の受託者である個人を含む。第三項において同じ。）、代理人、使用人その他の従業者で、その違反行為をした者は、十年以下の拘禁刑若しくは千万円以下の罰金に処し、又はこれを併科する。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 72_49_3, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|28ef205d48436ff2ab56707b86fa7cb09ada9e6dcdb3253cae880f6c2d8c3cd1.
原文逐語: 「偽りその他不正の行為により法人の行う事業に対する事業税の全部又は一部を免れた場合には、法人の代表者（法人課税信託の受託者である個人を含む。第三項において同じ。）、代理人、使用人その他の従業者で、その違反行為をした者は、十年以下の拘禁刑若しくは千万円以下の罰金に処し、又はこれを併科する。」
Scope: ONLY the 十年以下の拘禁刑 (years <= 10) INCLUSIVE ceiling for a corporation's representative, agent, employee or other worker who evades corporate business tax. 千万円以下の罰金・併科・法人課税信託の受託者の範囲・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax72_49_3CorpBusinessTaxEvasionUpTo10Years

open JapanTaxLaw.TaxFinance

/-- 「偽りその他不正の行為により法人の行う事業に対する事業税の全部又は一部を免れた場合には、法人の代表者（法人課税信託の受託者である個人を含む。第三項において同じ。）、代理人、使用人その他の従業者で、その違反行為をした者は、十年以下の拘禁刑若しくは千万円以下の罰金に処し、又はこれを併科する。」 — statutory threshold literal (10); INCLUSIVE boundary. -/
def inScope (years : Nat) : Prop := years <= 10

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (years : Nat) : Bool := decide (years <= 10)

end JapanTaxLaw.LocalTax72_49_3CorpBusinessTaxEvasionUpTo10Years
