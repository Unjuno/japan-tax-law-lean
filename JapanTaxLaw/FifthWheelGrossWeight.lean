import JapanTaxLaw.TaxFinance

/-
# FifthWheelGrossWeight — 登録免許税法施行規則 art.5(1)（牽引自動車の車両総重量）

Pinned: law 346CO0000000275, revision 346CO0000000275_20230101_504CO0000000195,
raw `data/raw/346CO0000000275_20230101_504CO0000000195.law.json`, Article 5 §1.

原文逐語: 「当該牽けん引自動車にあつてはその自動車検査証に記録される車両総重量から第五輪荷重を控除し牽けん引重量を加えた重量とし」

Variables (`Nat`, unit kg):
  `recorded` = 自動車検査証に記録される車両総重量,
  `fifthWheel` = 第五輪荷重,
  `towing` = 牽けん引重量.
  `grossWeight = (recorded - fifthWheel) + towing` (saturating subtraction first).

Scope: ONLY the arithmetic. The precondition (第五輪荷重 = 最大積載量), the
definition of セミトレーラ and 牽けん引重量, and the 被牽けん引自動車 rule are
NOT MODELLED. No `sorry`, `admit`, `axiom`.
-/
namespace JapanTaxLaw.FifthWheelGrossWeight

/-- 車両総重量 = (記録重量 − 第五輪荷重) + 牽引重量 (kg, Nat). -/
def grossWeight (recorded fifthWheel towing : Nat) : Nat :=
  (recorded - fifthWheel) + towing

theorem atTowingFloor (recorded fifthWheel towing : Nat) :
    fifthWheel >= recorded → grossWeight recorded fifthWheel towing = towing := by
  unfold grossWeight
  intro h
  rw [Nat.sub_eq_zero_of_le h]
  simp

theorem monotoneInTowing (recorded fifthWheel towing towing' : Nat) :
    towing <= towing' → grossWeight recorded fifthWheel towing <= grossWeight recorded fifthWheel towing' := by
  unfold grossWeight
  intro h
  exact Nat.add_le_add_left h (recorded - fifthWheel)

theorem monotoneInRecorded (recorded recorded' fifthWheel towing : Nat) :
    recorded <= recorded' → grossWeight recorded fifthWheel towing <= grossWeight recorded' fifthWheel towing := by
  unfold grossWeight
  intro h
  exact Nat.add_le_add_right (Nat.sub_le_sub_right h fifthWheel) towing

end JapanTaxLaw.FifthWheelGrossWeight
