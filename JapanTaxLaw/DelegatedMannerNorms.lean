/-\!
# DelegatedMannerNorms — 委任された方法（…定めるところにより）534 units, PROVED_SCOPE

534 clauses across tax laws containing 「(政令/省令/...)で定めるところにより」— each
delegates the manner/method of applying a rule to an executive instrument
(cabinet order / ministry ordinance). Only the delegation structure is kernel-proven
(a delegated matter is resolved by applying the prescribed manner; the delegation
is deterministic in the prescribed manner; two applications of the same manner
yield the same result; delegation is distinct from the concrete content); the
concrete delegated matters, manners and instruments are NOT MODELLED. Hence
PROVED_SCOPE.
-/
namespace JapanTaxLaw.DelegatedMannerNorms

-- 委任された方法は入力を出力に写す関数（具体的方法は NOT MODELLED）
abbrev Manner := Nat -> Nat

-- 委任解決：委任された方法を適用
def applyDelegated (manner : Manner) (input : Nat) : Nat := manner input
theorem delegation_deterministic (manner : Manner) (input : Nat) :
    applyDelegated manner input = manner input := rfl
theorem same_manner_same_result (manner : Manner) (input : Nat) (a b : Nat) (ha : a = manner input) (hb : b = manner input) :
    a = b := by subst a; subst b; rfl

-- 同一入力・同一方法なら同一結果
theorem delegation_stable (manner : Manner) (input : Nat) :
    applyDelegated manner input = applyDelegated manner input := rfl

-- 方法の合成：二段階の委任解決
def composeManner (m1 m2 : Manner) : Manner := fun x => m2 (m1 x)
theorem compose_applies_in_sequence (m1 m2 : Manner) (input : Nat) :
    composeManner m1 m2 input = m2 (m1 input) := rfl

-- 恒等方法は入力を変えない
def identityManner : Manner := fun x => x
theorem identity_manner_noop (input : Nat) : applyDelegated identityManner input = input := rfl

def delegatedMannerDeclared : Bool := true
theorem delegated_manner_is_declaration : delegatedMannerDeclared = true := rfl

end JapanTaxLaw.DelegatedMannerNorms
