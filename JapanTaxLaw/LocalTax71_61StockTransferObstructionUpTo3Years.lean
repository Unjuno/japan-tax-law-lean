import JapanTaxLaw.TaxFinance

/-
# LocalTax71_61StockTransferObstructionUpTo3Years — pinned clause 「株式等譲渡所得割の特別徴収義務者が滞納処分の執行を免れる目的でその財産を隠蔽し、損壊し、若しくは道府県の不利益に処分し、その財産に係る負担を偽つて増加する行為をし、又はその現状を改変して、その財産の価額を減損し、若しくはその滞納処分に係る滞納処分費を増大させる行為をしたときは、その者は、三年以下の拘禁刑若しくは二百五十万円以下の罰金に処し、又はこれを併科する。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 71_61, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|9bd7c7bd57ab21b3260c7176bc90ca8759c48a7a707e5e2a7af1c041beb2d31b.
原文逐語: 「株式等譲渡所得割の特別徴収義務者が滞納処分の執行を免れる目的でその財産を隠蔽し、損壊し、若しくは道府県の不利益に処分し、その財産に係る負担を偽つて増加する行為をし、又はその現状を改変して、その財産の価額を減損し、若しくはその滞納処分に係る滞納処分費を増大させる行為をしたときは、その者は、三年以下の拘禁刑若しくは二百五十万円以下の罰金に処し、又はこれを併科する。」
Scope: ONLY the 三年以下の拘禁刑 (years <= 3) INCLUSIVE ceiling for a stock-transfer-income withholding special collection agent who obstructs collection by concealing assets. 二百五十万円以下の罰金・併科・滞納処分の認定・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax71_61StockTransferObstructionUpTo3Years

open JapanTaxLaw.TaxFinance

/-- 「株式等譲渡所得割の特別徴収義務者が滞納処分の執行を免れる目的でその財産を隠蔽し、損壊し、若しくは道府県の不利益に処分し、その財産に係る負担を偽つて増加する行為をし、又はその現状を改変して、その財産の価額を減損し、若しくはその滞納処分に係る滞納処分費を増大させる行為をしたときは、その者は、三年以下の拘禁刑若しくは二百五十万円以下の罰金に処し、又はこれを併科する。」 — statutory threshold literal (3); INCLUSIVE boundary. -/
def inScope (years : Nat) : Prop := years <= 3

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (years : Nat) : Bool := decide (years <= 3)

end JapanTaxLaw.LocalTax71_61StockTransferObstructionUpTo3Years
