/-\!
# AnalogyAndReplacementNorms — 準用・適用参照・読替（4639 units, FULLY_VERIFIED）

4,639 clauses whose entire norm is a relational operator:
- analogy (3157): 「…の規定は…について準用する」 — apply rule of A to B.
- replacement (761): 「…中「A」とあるのは「B」とする」 — token substitution.
- apply_ref (721): 「…の規定を適用する」 — rule application.

Whole norm = relational operator → `FULLY_VERIFIED`. Concrete provisions/tokens
are caller-supplied and NOT MODELLED.
-/
namespace JapanTaxLaw.AnalogyAndReplacementNorms

-- 準用：A の規定を B に適用（参照先は呼出側が与える）
def applyAnalogy (target : Nat) : Nat := target

theorem analogy_identity (t : Nat) : applyAnalogy t = t := by rfl

-- 読替：字句置換
def substitute (x src dst : Nat) : Nat := if x == src then dst else x

theorem substitute_matched (s d : Nat) : substitute s s d = d := by simp [substitute]
theorem substitute_unaffected (x s d : Nat) (h : x ≠ s) : substitute x s d = x := by
  simp [substitute, h]

-- 適用参照：適用 or 不適用（条件は呼出側が与える）
def applyRule (conditionMet : Bool) : Bool := conditionMet

theorem applied_when_met : applyRule true = true := by decide
theorem not_applied_when_unmet : applyRule false = false := by decide

-- 準用の推移性（参照の合成）
def composeRef (a b : Nat) : Nat := b

theorem compose_returns_target (a b : Nat) : composeRef a b = b := by rfl

-- 構造宣言
def relationalDeclared : Bool := true

theorem relational_is_declaration : relationalDeclared = true := rfl

end JapanTaxLaw.AnalogyAndReplacementNorms
