import JapanTaxLaw.TaxFinance

/-
# HeaviestRecordedWeight — 登録免許税法施行規則 art.5(2)（記録重量が二以上ある場合）

Pinned: law 346CO0000000275, revision 346CO0000000275_20230101_504CO0000000195,
raw `data/raw/346CO0000000275_20230101_504CO0000000195.law.json`, Article 5 §2.

原文逐語: 「当該自動車検査証に記録される車両総重量が二以上あるときは、そのうちの最も重いものとする。」

Variables: `a b : Nat` = 自動車検査証に記録される二つの車両総重量 (kg).
`heaviest a b = max a b`. Scope: ONLY selecting the heavier of two recorded weights.
The determination of which weights are recorded, and §1/§3/§4, are NOT MODELLED.
No `sorry`, `admit`, `axiom`, no `Classical.choice`.
-/
namespace JapanTaxLaw.HeaviestRecordedWeight

def heaviest (a b : Nat) : Nat := max a b

theorem heaviestAtLeastLeft (a b : Nat) : a <= heaviest a b := by
  unfold heaviest
  omega

theorem heaviestAtLeastRight (a b : Nat) : b <= heaviest a b := by
  unfold heaviest
  omega

theorem heaviestMonotoneLeft (a a' b : Nat) : a <= a' → heaviest a b <= heaviest a' b := by
  unfold heaviest
  intro h
  omega

end JapanTaxLaw.HeaviestRecordedWeight
