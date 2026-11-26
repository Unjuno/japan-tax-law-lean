import JapanTaxLaw.InheritanceTaxPenaltyOver5M

/-
# InheritanceTaxPenaltyOver5MSpec — independent spec for 相続税法 第六十八条(4)

Needle 「免れた相続税額又は贈与税額が五百万円を超えるときは、情状により、同項の罰金は、五百万円を超えその免れた相続税額又は贈与税額に相当する金額以下とすることができる。」.
The implementation uses `5_000_000 < evaded`; the independent spec rewrites the
strict lower bound as `Nat.succ 5_000_000 ≤ evaded`, built from statutory
literals only with no implementation identifier. Universal axiom-free bridge.
「を超え」 is STRICT: ¥5,000,000 is excluded, ¥5,000,001 qualifies.
-/
namespace JapanTaxLaw.InheritanceTaxPenaltyOver5M

open JapanTaxLaw.TaxFinance

def specInScope (evaded : Nat) : Prop := Nat.succ 5_000_000 ≤ evaded

theorem agree_scope (evaded : Nat) : inScope evaded ↔ specInScope evaded := by
  unfold inScope specInScope threshold
  constructor
  · intro h
    exact Nat.succ_le_of_lt h
  · intro h
    exact Nat.lt_of_succ_le h

end JapanTaxLaw.InheritanceTaxPenaltyOver5M
