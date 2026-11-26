import JapanTaxLaw.InheritanceTax68PenaltyOver10M

/-
# InheritanceTax68PenaltyOver10MSpec — independent spec for 相続税法 Num 68(2)

Needle 「前項の免れた相続税額又は贈与税額が千万円を超えるときは、情状により、同項の罰金は、千万円を超えその免れた相続税額又は贈与税額に相当する金額以下とすることができる。」.
The implementation uses `threshold < yen`; the independent spec states
the 千万円を超える STRICT lower bound on the evaded tax amount as `10000000 < yen`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「を超える」 is STRICT: the threshold itself does NOT qualify; only a value strictly above it does.
-/
namespace JapanTaxLaw.InheritanceTax68PenaltyOver10M

open JapanTaxLaw.TaxFinance

def specInScope (yen : Nat) : Prop := 10000000 < yen

theorem agree_scope (yen : Nat) : inScope yen ↔ specInScope yen := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.InheritanceTax68PenaltyOver10M
