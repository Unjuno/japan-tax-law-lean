import JapanTaxLaw.TransitionalHeadingsAndDateExprs
import JapanTaxLaw.TransitionalHeadingsAndDateExprsSpec

/-!
# TransitionalHeadingsAndDateExprsTests — 見出し・日付・委任
-/
namespace JapanTaxLaw.TransitionalHeadingsAndDateExprsTests

open JapanTaxLaw.TransitionalHeadingsAndDateExprs

theorem date_spec (p c b : Nat) :
    inDateExpr p c b = true ↔ JapanTaxLaw.TransitionalHeadingsAndDateExprsSpec.dateExprSpec p c b := by
  simp [inDateExpr, JapanTaxLaw.TransitionalHeadingsAndDateExprsSpec.dateExprSpec]

theorem ministry_spec (c : Nat) :
    ministryDelegation c = JapanTaxLaw.TransitionalHeadingsAndDateExprsSpec.ministrySpec c := by rfl

example : transitionalDeclared = true := rfl
example : inDateExpr 100 101 12 = true := by decide
example : inDateExpr 100 100 12 = false := by decide
example : inDateExpr 100 112 12 = true := by decide
example : inDateExpr 100 113 12 = false := by decide
example (p c b : Nat) (h : inDateExpr p c b = true) : p < c := date_lower p c b h
example (p c b : Nat) (h : inDateExpr p c b = true) : c <= p + b := date_upper p c b h
example (p c b : Nat) (h1 : p < c) (h2 : c <= p + b) : inDateExpr p c b = true :=
  date_of_bounds p c b h1 h2
example (p c b b' : Nat) (h : b <= b') (hw : inDateExpr p c b = true) : inDateExpr p c b' = true :=
  date_mono_bound p c b b' h hw
example : transitionalDeclared = true ∧ ministryDelegation 0 = 0 := heading_date_ministry_distinct

end JapanTaxLaw.TransitionalHeadingsAndDateExprsTests
