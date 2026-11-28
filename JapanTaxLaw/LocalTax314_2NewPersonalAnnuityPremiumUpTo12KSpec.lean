import JapanTaxLaw.LocalTax314_2NewPersonalAnnuityPremiumUpTo12K

/-
# LocalTax314_2NewPersonalAnnuityPremiumUpTo12KSpec — independent spec for 地方税法 Num 314_2/1

Needle 「前年中に支払つた新個人年金保険料の金額の合計額（前年中において新個人年金保険契約等に基づく剰余金の分配若しくは割戻金の割戻しを受け、又は新個人年金保険契約等に基づき分配を受ける剰余金若しくは割戻しを受ける割戻金をもつて新個人年金保険料の払込みに充てた場合には、当該剰余金又は割戻金の額（新個人年金保険料に係る部分の金額として政令で定めるところにより計算した金額に限る。）を控除した残額。以下（１）及び（３）（ｉ）において同じ。）が一万二千円以下である場合」.
The implementation uses `premium <= 12000`; this independent spec states the
statutory boundary from statutory literals only, with no implementation identifier.
The formula below is the sole statutory literal site; the bridge is universal and axiom-free.
「以上」/「以下」/「以内」 are INCLUSIVE; 「を超える」 is STRICT.
-/
namespace JapanTaxLaw.LocalTax314_2NewPersonalAnnuityPremiumUpTo12K

open JapanTaxLaw.TaxFinance

def specInScope (premium : Nat) : Prop := premium <= 12000

theorem agree_scope (premium : Nat) : inScope premium ↔ specInScope premium := by
  unfold inScope specInScope
  rfl
end JapanTaxLaw.LocalTax314_2NewPersonalAnnuityPremiumUpTo12K
