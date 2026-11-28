import JapanTaxLaw.LocalTax18FiveYearPrescription

/-
# LocalTax18FiveYearPrescriptionSpec — independent spec for 地方税法 Num 18/1

Needle 「地方団体の徴収金の徴収を目的とする地方団体の権利（以下この款において「地方税の徴収権」という。）は、法定納期限（次の各号に掲げる地方団体の徴収金については、それぞれ当該各号に定める日）の翌日から起算して五年間行使しないことによつて、時効により消滅する。」.
The implementation uses `years >= 5`; this independent spec states the
statutory boundary from statutory literals only, with no implementation identifier.
The formula below is the sole statutory literal site; the bridge is universal and axiom-free.
「以上」/「以下」/「以内」 are INCLUSIVE; 「を超える」 is STRICT.
-/
namespace JapanTaxLaw.LocalTax18FiveYearPrescription

open JapanTaxLaw.TaxFinance

def specInScope (years : Nat) : Prop := years >= 5

theorem agree_scope (years : Nat) : inScope years ↔ specInScope years := by
  unfold inScope specInScope
  rfl
end JapanTaxLaw.LocalTax18FiveYearPrescription
