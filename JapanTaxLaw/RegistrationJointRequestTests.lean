import JapanTaxLaw.RegistrationJointRequest
import JapanTaxLaw.RegistrationJointRequestSpec

/-!
# RegistrationJointRequestTests — kernel-decided boundary examples

実装・独立仕様の対応と、境界値・分岐到達可能性をカーネルで決定する。
-/

namespace JapanTaxLaw.RegistrationJointRequestTests

open JapanTaxLaw.RegistrationJointRequest
open JapanTaxLaw.RegistrationJointRequestSpec

/-- 実装と独立仕様の対応（spec 側は実装を参照しない）。 -/
theorem agrees_with_implementation (p s c : Bool) (n : Nat) :
    mayUseSingleRequest p s n c = true ↔ permitted p s n := by
  by_cases hn : 2 <= n <;> simp [mayUseSingleRequest, permitted, minProperties, hn]

-- ==== kernel-decided examples (boundaries / reachability) ====

-- 定数
example : minProperties = 2 := by decide

-- 件数境界: 0 / 1 不許可, 2 / 3 許可
example : mayUseSingleRequest true true 0 false = false := by decide
example : mayUseSingleRequest true true 1 false = false := by decide
example : mayUseSingleRequest true true 2 false = true := by decide
example : mayUseSingleRequest true true 3 false = true := by decide

-- 適用条件の分岐到達可能性
example : mayUseSingleRequest false true 5 false = false := by decide
example : mayUseSingleRequest true false 5 false = false := by decide
example : mayUseSingleRequest false false 5 false = false := by decide

-- 例外の不適用: 原因・目的が異なっても判定は同じ
example : mayUseSingleRequest true true 2 true = true := by decide
example : mayUseSingleRequest true true 1 true = false := by decide
example : mayUseSingleRequest true true 2 true = mayUseSingleRequest true true 2 false := by decide

-- 独立仕様との対応（具体値）
example : permitted true true 2 := by unfold permitted; decide
example : ¬ permitted true true 1 := by unfold permitted; decide
example : ¬ permitted false true 2 := by unfold permitted; decide
example : ¬ permitted true false 2 := by unfold permitted; decide

end JapanTaxLaw.RegistrationJointRequestTests
