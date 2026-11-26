import JapanTaxLaw.LocalTax13LightOilOver30k

/-
# LocalTax13LightOilOver30kSpec — independent spec for 地方税法 第十三条(5) 附則

Needle 「道府県知事は、前項の規定により申告納付すべき軽油引取税の額が三万円を超える場合には、当該特約業者、元売業者又は小売業者の申請により、三月以内の期間を限つて徴収の猶予をすることができる。」.
The implementation uses `30_000 < tax`; the independent spec rewrites the strict
lower bound as `Nat.succ 30_000 ≤ tax`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge. 「を超え」 is STRICT:
¥30,000 is excluded, ¥30,001 qualifies.
-/
namespace JapanTaxLaw.LocalTax13LightOilOver30k

open JapanTaxLaw.TaxFinance

def specInScope (tax : Nat) : Prop := Nat.succ 30_000 ≤ tax

theorem agree_scope (tax : Nat) : inScope tax ↔ specInScope tax := by
  unfold inScope specInScope threshold
  constructor
  · intro h
    exact Nat.succ_le_of_lt h
  · intro h
    exact Nat.lt_of_succ_le h

end JapanTaxLaw.LocalTax13LightOilOver30k
