import JapanTaxLaw.LocalTax701_43EmployeeCountUpTo100

/-
# LocalTax701_43EmployeeCountUpTo100Spec — independent spec for 地方税法 Num 701_43/4

Needle 「前項の場合において、第一項に規定する従業者の数の合計数及び第二項に規定する従業者の数が百人以下であるかどうかの判定の基礎となる事業所等のうち、課税標準の算定期間中を通じて従業者の数に著しい変動がある事業所等として政令で定めるもの（当該課税標準の算定期間の中途において廃止された事業所等を除く。）については、当該課税標準の算定期間に属する各月の末日現在における従業者の数を合計した数を当該課税標準の算定期間の月数で除して得た数をもつて前項の課税標準の算定期間の末日現在の従業者の数と」.
The implementation uses `employees <= 100`; this independent spec states the
statutory INCLUSIVE boundary as `employees <= 100`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」/「以下」/「以内」 are INCLUSIVE: the threshold itself qualifies.
-/
namespace JapanTaxLaw.LocalTax701_43EmployeeCountUpTo100

open JapanTaxLaw.TaxFinance

def specInScope (employees : Nat) : Prop := employees <= 100

theorem agree_scope (employees : Nat) : inScope employees ↔ specInScope employees := by
  unfold inScope specInScope
  rfl
end JapanTaxLaw.LocalTax701_43EmployeeCountUpTo100
