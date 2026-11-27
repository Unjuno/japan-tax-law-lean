import JapanTaxLaw.TaxFinance

/-
# LocalTax72_80_2TwoTrusteesDeeming — pinned clause 「一の法人課税信託等の受託者が二以上ある場合には、各受託者の当該法人課税信託等に係る信託資産等は、当該法人課税信託等の信託事務を主宰する受託者（次項において「主宰受託者」という。）の信託資産等とみなして、この節の規定を適用する。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 72_80_2, paragraph 4.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|623be03e65395857521c853b231781deacf59ce54a323174c1c4b91b2f283c53.
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:72_80_2/Article#72_80_2/Paragraph#4/ParagraphSentence/Sentence#1.
原文逐語: 「一の法人課税信託等の受託者が二以上ある場合には、各受託者の当該法人課税信託等に係る信託資産等は、当該法人課税信託等の信託事務を主宰する受託者（次項において「主宰受託者」という。）の信託資産等とみなして、この節の規定を適用する。」
Scope: ONLY the 一の法人課税信託等の受託者が二以上 (trustees ≥ 2) lower bound. 主宰受託者の指定・各受託者の信託資産等の帰属内容・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax72_80_2TwoTrusteesDeeming

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (2), INCLUSIVE lower bound. -/
def threshold : Nat := 2

/-- 「一の法人課税信託等の受託者が二以上ある場合には、各受託者の当該法人課税信託等に係る信託資産等は、当該法人課税信託等の信託事務を主宰する受託者（次項において「主宰受託者」という。）の信託資産等とみなして、この節の規定を適用する。」. -/
def inScope (trustees : Nat) : Prop := threshold ≤ trustees

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (trustees : Nat) : Bool := decide (2 ≤ trustees)

end JapanTaxLaw.LocalTax72_80_2TwoTrusteesDeeming
