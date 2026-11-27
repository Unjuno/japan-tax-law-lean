import JapanTaxLaw.LocalTax144_16CertificateReturnWithin10Days

/-
# LocalTax144_16CertificateReturnWithin10DaysSpec — independent spec for 地方税法 Num 144_16/4

Needle 「第一項の証票の交付を受けた者は、軽油引取税の特別徴収の義務が消滅した場合又は事務所若しくは事業所を廃止した場合には、その消滅し、又は廃止した日から十日以内にその証票を道府県知事に返さなければならない。」.
The implementation uses `days ≤ threshold`; the independent spec states
the statutory INCLUSIVE ceiling as `days ≤ 10`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以内」/「以下」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.LocalTax144_16CertificateReturnWithin10Days

open JapanTaxLaw.TaxFinance

def specInScope (days : Nat) : Prop := days ≤ 10

theorem agree_scope (days : Nat) : inScope days ↔ specInScope days := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax144_16CertificateReturnWithin10Days
