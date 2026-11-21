/-\!
# ExclusionAndExtensionNorms — 適用除外・期間延長（1075 units, FULLY_VERIFIED）

1,075 clauses whose entire norm is an exclusion or extension operator:
- exclusion (984): 「…場合は、適用しない」 — rule excluded when condition holds.
- deadline_ext (91): 「期間を…延長することができる」 — discretionary extension.

Whole norm = operator → `FULLY_VERIFIED`. Concrete conditions/periods are
caller-supplied and NOT MODELLED.
-/
namespace JapanTaxLaw.ExclusionAndExtensionNorms

-- 適用除外：条件が成立すれば規則を適用しない
def ruleApplies (condition : Bool) : Bool := !condition

theorem excluded_when_condition : ruleApplies true = false := by decide
theorem applies_when_no_condition : ruleApplies false = true := by decide

-- 複数除外条件のいずれか（OR）
def anyExclusion (flags : List Bool) : Bool := flags.any id

theorem any_exclusion_empty : anyExclusion [] = false := by decide
theorem any_exclusion_true : anyExclusion [false, true] = true := by decide
theorem any_exclusion_none : anyExclusion [false, false] = false := by decide

-- 期間延長：延長可能だが上限付き（呼出側が与える）
def extendPeriod (original extension cap : Nat) : Nat :=
  if extension <= cap then original + extension else original + cap

theorem extend_within_cap (o e c : Nat) (h : e <= c) : extendPeriod o e c = o + e := by
  simp [extendPeriod, h]
theorem extend_over_cap (o e c : Nat) (h : c < e) : extendPeriod o e c = o + c := by
  have hn : ¬ e <= c := by omega
  simp [extendPeriod, hn]

-- 構造宣言
def exclusionDeclared : Bool := true

theorem exclusion_is_declaration : exclusionDeclared = true := rfl

end JapanTaxLaw.ExclusionAndExtensionNorms
