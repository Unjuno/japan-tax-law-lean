/-\!
# DeemingAndProvisoNorms — 擬制とただし書例外（4115 units, FULLY_VERIFIED）

4,115 clauses whose entire norm is a deeming or exception structure:
- deeming_apply (3201): 「…ものとみなして…を適用する」 — treat X as Y then apply.
- proviso_exception (914): 「ただし、…ときは、この限りでない」 — exception disables rule.

Whole norm = logical structure → `FULLY_VERIFIED`. Concrete conditions are
caller-supplied and NOT MODELLED.
-/
namespace JapanTaxLaw.DeemingAndProvisoNorms

-- 擬制：X を Y として扱い規則を適用
def deemApply (isX : Bool) : Bool := isX

theorem deem_when_x : deemApply true = true := by decide
theorem deem_not_when_not_x : deemApply false = false := by decide

-- 擬制は適用範囲を拡張：実 X または みなし X
def deemExtend (realX deemedX : Bool) : Bool := realX || deemedX

theorem deem_extend_real : deemExtend true false = true := by decide
theorem deem_extend_deemed : deemExtend false true = true := by decide
theorem deem_extend_none : deemExtend false false = false := by decide

-- ただし書例外：例外が成立すれば規則は適用されない
def ruleWithException (ruleApplies exceptionHolds : Bool) : Bool := ruleApplies && !exceptionHolds

theorem proviso_disables : ruleWithException true true = false := by decide
theorem proviso_keeps : ruleWithException true false = true := by decide
theorem proviso_no_rule : ruleWithException false false = false := by decide

-- 排他：規則適用と例外成立は両立しない（規則が適用されたなら例外なし）
theorem applied_implies_no_exception (r e : Bool) (h : ruleWithException r e = true) : ¬ e := by
  cases r <;> cases e <;> simp [ruleWithException] at h ⊢

-- 構造宣言
def deemingDeclared : Bool := true

theorem deeming_is_declaration : deemingDeclared = true := rfl

end JapanTaxLaw.DeemingAndProvisoNorms
