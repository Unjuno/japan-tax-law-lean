import JapanTaxLaw.LocalTax72_2CapitalCeiling100M

/-
# LocalTax72_2CapitalCeiling100MSpec — independent spec for 地方税法 Num 72_2/2/1

Needle 「資本金の額又は出資金の額が一億円以下の法人であるかどうか及び資本又は出資を有しない法人であるかどうかの判定並びに前項第一号ロ（１）又は（２）に掲げる法人に該当するものであるかどうかの判定に関し必要な事項の判定（次号に掲げる判定を除く。）」.
The implementation uses `capital ≤ threshold`; the independent spec states
the statutory INCLUSIVE ceiling as `capital ≤ 100000000`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以内」/「以下」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.LocalTax72_2CapitalCeiling100M

open JapanTaxLaw.TaxFinance

def specInScope (capital : Nat) : Prop := capital ≤ 100000000

theorem agree_scope (capital : Nat) : inScope capital ↔ specInScope capital := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax72_2CapitalCeiling100M
