import JapanTaxLaw.LocalTax701_43FloorAreaUpTo1000Sqm

/-
# LocalTax701_43FloorAreaUpTo1000SqmSpec — independent spec for 地方税法 Num 701_43/3

Needle 「前二項の場合において、第一項に規定する事業所床面積の合計面積及び第二項に規定する事業所床面積が千平方メートル以下であるかどうか並びに第一項に規定する従業者の数の合計数及び第二項に規定する従業者の数が百人以下であるかどうかの判定は課税標準の算定期間の末日の現況によるものとする。」.
The implementation uses `sqm <= 1_000`; this independent spec states the
statutory INCLUSIVE boundary as `sqm <= 1_000`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」/「以下」/「以内」 are INCLUSIVE: the threshold itself qualifies.
-/
namespace JapanTaxLaw.LocalTax701_43FloorAreaUpTo1000Sqm

open JapanTaxLaw.TaxFinance

def specInScope (sqm : Nat) : Prop := sqm <= 1_000

theorem agree_scope (sqm : Nat) : inScope sqm ↔ specInScope sqm := by
  unfold inScope specInScope
  rfl
end JapanTaxLaw.LocalTax701_43FloorAreaUpTo1000Sqm
