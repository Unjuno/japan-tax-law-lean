/-\!
# SimilarlyApplyNorms — 同様とする（準用の拡張）112 units, PROVED_SCOPE

112 clauses across tax laws ending 「…同様とする。」— each extends a rule to an
additional case ("the same applies when...", e.g. 「…であるときも、同様とする」).
Only the rule-extension structure is kernel-proven (extension applies the same
rule to a new case; extension is transitive; extending with an empty case is a
noop; extensions compose); the concrete rules and cases are NOT MODELLED. Hence
PROVED_SCOPE.
-/
namespace JapanTaxLaw.SimilarlyApplyNorms

-- 適用対象は Bool（規則が適用されるか）
-- 同様とする：基本ケースに加えて追加ケースにも同じ規則を適用（論理和）
def similarlyApply (base extra : Bool) : Bool := base || extra
theorem applies_to_base : similarlyApply true false = true := by decide
theorem applies_to_extra : similarlyApply false true = true := by decide
theorem no_case_no_apply : similarlyApply false false = false := by decide

-- transitivity: (A ∨ B) ∨ C = A ∨ (B ∨ C)
def extendTwice (a b c : Bool) : Bool := similarlyApply (similarlyApply a b) c
theorem extension_associative (a b c : Bool) :
    extendTwice a b c = similarlyApply a (similarlyApply b c) := by
  unfold extendTwice similarlyApply
  exact Bool.or_assoc a b c

-- 空の追加（false）は規則を変えない
theorem empty_extension_noop (base : Bool) : similarlyApply base false = base := by
  cases base <;> rfl

-- 追加ケースが既に基本に含まれるなら拡張は冪等
theorem redundant_extension (base : Bool) : similarlyApply base base = base := by
  cases base <;> rfl

def similarlyApplyDeclared : Bool := true
theorem similarly_apply_is_declaration : similarlyApplyDeclared = true := rfl

end JapanTaxLaw.SimilarlyApplyNorms
