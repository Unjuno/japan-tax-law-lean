import JapanTaxLaw.LocalTax53CapitalOver100M

/-
# LocalTax53CapitalOver100MSpec — independent spec for 地方税法 Num 53/66/1

Needle 「納税申告書に係る事業年度開始の日（公共法人等にあつては、前年四月一日）現在における資本金の額又は出資金の額が一億円を超える法人」.
The implementation uses `threshold < yen`; the independent spec states
the statutory STRICT lower bound as `100000000 < yen`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「を超える」 is STRICT: the threshold itself does NOT qualify; only a value strictly above it does.
-/
namespace JapanTaxLaw.LocalTax53CapitalOver100M

open JapanTaxLaw.TaxFinance

def specInScope (yen : Nat) : Prop := 100000000 < yen

theorem agree_scope (yen : Nat) : inScope yen ↔ specInScope yen := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax53CapitalOver100M
