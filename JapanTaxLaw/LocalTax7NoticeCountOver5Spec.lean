import JapanTaxLaw.LocalTax7NoticeCountOver5

/-
# LocalTax7NoticeCountOver5Spec — independent spec for 地方税法 第七条(6)3 (附則)

Needle 「当該申告特例対象年に支出した特例控除対象寄附金について、前項の規定により申告特例通知書を送付した都道府県知事等の数が五を超えたとき。」.
The implementation uses `5 < count`; the independent spec rewrites the strict
lower bound as `Nat.succ 5 ≤ count`, built from statutory literals only with no
implementation identifier. Universal axiom-free bridge. 「を超え」 is STRICT:
5 recipients is excluded, 6 recipients qualifies.
-/
namespace JapanTaxLaw.LocalTax7NoticeCountOver5

open JapanTaxLaw.TaxFinance

def specInScope (count : Nat) : Prop := Nat.succ 5 ≤ count

theorem agree_scope (count : Nat) : inScope count ↔ specInScope count := by
  unfold inScope specInScope threshold
  constructor
  · intro h
    exact Nat.succ_le_of_lt h
  · intro h
    exact Nat.lt_of_succ_le h

end JapanTaxLaw.LocalTax7NoticeCountOver5
