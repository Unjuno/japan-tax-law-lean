import JapanTaxLaw.LocalTax18_2TwoYearSuspension

/-
# LocalTax18_2TwoYearSuspensionSpec — independent spec for 地方税法 Num 18_2/3

Needle 「地方税の徴収権で、偽りその他不正の行為によりその全部若しくは一部の税額を免れ、又はその全部若しくは一部の税額の還付を受けた地方税（当該地方税に係る延滞金及び加算金を含む。以下この項において同じ。）に係るものの時効は、当該地方税の前条第一項に規定する法定納期限の翌日から起算して二年間は、進行しない。」.
The implementation uses `years <= 2`; this independent spec states the
statutory boundary from statutory literals only, with no implementation identifier.
The formula below is the sole statutory literal site; the bridge is universal and axiom-free.
「以上」/「以下」/「以内」 are INCLUSIVE; 「を超える」 is STRICT.
-/
namespace JapanTaxLaw.LocalTax18_2TwoYearSuspension

open JapanTaxLaw.TaxFinance

def specInScope (years : Nat) : Prop := years <= 2

theorem agree_scope (years : Nat) : inScope years ↔ specInScope years := by
  unfold inScope specInScope
  rfl
end JapanTaxLaw.LocalTax18_2TwoYearSuspension
