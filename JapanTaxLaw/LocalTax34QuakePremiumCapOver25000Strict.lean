import JapanTaxLaw.TaxFinance

/-
# LocalTax34QuakePremiumCapOver25000Strict — pinned clause 「前年中に支払つた地震保険料の金額の合計額（前年中において損害保険契約等に基づく剰余金の分配若しくは割戻金の割戻しを受け、又は損害保険契約等に基づき分配を受ける剰余金若しくは割戻しを受ける割戻金をもつて地震保険料の払込みに充てた場合には、当該剰余金又は割戻金の額（地震保険料に係る部分の金額に限る。）を控除した残額）の二分の一に相当する金額（その金額が二万五千円を超える場合には、二万五千円）」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 34, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|6d745a0c6801597941436638fda3d3cbf40be38765f614224cf6f898d650440c.
原文逐語: 「前年中に支払つた地震保険料の金額の合計額（前年中において損害保険契約等に基づく剰余金の分配若しくは割戻金の割戻しを受け、又は損害保険契約等に基づき分配を受ける剰余金若しくは割戻しを受ける割戻金をもつて地震保険料の払込みに充てた場合には、当該剰余金又は割戻金の額（地震保険料に係る部分の金額に限る。）を控除した残額）の二分の一に相当する金額（その金額が二万五千円を超える場合には、二万五千円）」
Scope: ONLY the 二万五千円を超える (yen > 25000) STRICT cap on the earthquake-insurance-premium deduction base: an excess over 25000 yen is capped at 25000 yen. 二分の一の算定, 剰余金・割戻金の控除, 所得控除の他の号 and 他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax34QuakePremiumCapOver25000Strict

open JapanTaxLaw.TaxFinance

/-- 「二万五千円を超える」 — statutory threshold literal 25_000; STRICT boundary. -/
def inScope (yen : Nat) : Prop := 25_000 < yen

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (yen : Nat) : Bool := decide (25_000 < yen)

end JapanTaxLaw.LocalTax34QuakePremiumCapOver25000Strict
