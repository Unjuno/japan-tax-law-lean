import JapanTaxLaw.LocalTax34QuakePremiumCapOver25000Strict

/-
# LocalTax34QuakePremiumCapOver25000StrictSpec — independent spec for 地方税法 Num 34/1

Needle 「前年中に支払つた地震保険料の金額の合計額（前年中において損害保険契約等に基づく剰余金の分配若しくは割戻金の割戻しを受け、又は損害保険契約等に基づき分配を受ける剰余金若しくは割戻しを受ける割戻金をもつて地震保険料の払込みに充てた場合には、当該剰余金又は割戻金の額（地震保険料に係る部分の金額に限る。）を控除した残額）の二分の一に相当する金額（その金額が二万五千円を超える場合には、二万五千円）」.
The implementation uses `25_000 < yen`; this independent spec states the
statutory STRICT boundary as `25_000 < yen`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「を超える」/「超え」 are STRICT: the threshold itself does NOT qualify.
-/
namespace JapanTaxLaw.LocalTax34QuakePremiumCapOver25000Strict

open JapanTaxLaw.TaxFinance

def specInScope (yen : Nat) : Prop := 25_000 < yen

theorem agree_scope (yen : Nat) : inScope yen ↔ specInScope yen := by
  unfold inScope specInScope
  rfl
end JapanTaxLaw.LocalTax34QuakePremiumCapOver25000Strict
