import JapanTaxLaw.TaxFinance

/-
# LocalTax95GolfObstructionUpTo3Years — pinned clause 「ゴルフ場利用税の特別徴収義務者が滞納処分の執行を免れる目的でその財産を隠蔽し、損壊し、若しくは道府県の不利益に処分し、その財産に係る負担を偽つて増加する行為をし、又はその現状を改変して、その財産の価額を減損し、若しくはその滞納処分に係る滞納処分費を増大させる行為をしたときは、その者は、三年以下の拘禁刑若しくは二百五十万円以下の罰金に処し、又はこれを併科する。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 95, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|1285ffe8a8a824a7787b3db7826c58832e253aac9767e562b9d8f8b82bc2eba5.
原文逐語: 「ゴルフ場利用税の特別徴収義務者が滞納処分の執行を免れる目的でその財産を隠蔽し、損壊し、若しくは道府県の不利益に処分し、その財産に係る負担を偽つて増加する行為をし、又はその現状を改変して、その財産の価額を減損し、若しくはその滞納処分に係る滞納処分費を増大させる行為をしたときは、その者は、三年以下の拘禁刑若しくは二百五十万円以下の罰金に処し、又はこれを併科する。」
Scope: ONLY the 三年以下の拘禁刑 (years <= 3) INCLUSIVE ceiling for a golf-course-use-tax special collection agent who obstructs collection by concealing assets. 二百五十万円以下の罰金・併科・滞納処分の認定・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax95GolfObstructionUpTo3Years

open JapanTaxLaw.TaxFinance

/-- 「ゴルフ場利用税の特別徴収義務者が滞納処分の執行を免れる目的でその財産を隠蔽し、損壊し、若しくは道府県の不利益に処分し、その財産に係る負担を偽つて増加する行為をし、又はその現状を改変して、その財産の価額を減損し、若しくはその滞納処分に係る滞納処分費を増大させる行為をしたときは、その者は、三年以下の拘禁刑若しくは二百五十万円以下の罰金に処し、又はこれを併科する。」 — statutory threshold literal (3); INCLUSIVE boundary. -/
def inScope (years : Nat) : Prop := years <= 3

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (years : Nat) : Bool := decide (years <= 3)

end JapanTaxLaw.LocalTax95GolfObstructionUpTo3Years
