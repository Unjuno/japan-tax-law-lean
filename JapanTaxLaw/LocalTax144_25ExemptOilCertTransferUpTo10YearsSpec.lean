import JapanTaxLaw.LocalTax144_25ExemptOilCertTransferUpTo10Years

/-
# LocalTax144_25ExemptOilCertTransferUpTo10YearsSpec — independent spec for 地方税法 Num 144_25/2

Needle 「前条の規定に違反して免税証を譲り受け、免税軽油の引取りを行つたときは、その違反行為をした者は、十年以下の拘禁刑若しくは千万円以下の罰金に処し、又はこれを併科する。」.
The implementation uses `years <= 10`; this independent spec states the
statutory INCLUSIVE boundary as `years <= 10`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」/「以下」/「以内」 are INCLUSIVE: the threshold itself qualifies.
-/
namespace JapanTaxLaw.LocalTax144_25ExemptOilCertTransferUpTo10Years

open JapanTaxLaw.TaxFinance

def specInScope (years : Nat) : Prop := years <= 10

theorem agree_scope (years : Nat) : inScope years ↔ specInScope years := by
  unfold inScope specInScope
  rfl
end JapanTaxLaw.LocalTax144_25ExemptOilCertTransferUpTo10Years
