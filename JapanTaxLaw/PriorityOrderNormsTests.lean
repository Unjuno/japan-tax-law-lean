import JapanTaxLaw.PriorityOrderNorms
import JapanTaxLaw.PriorityOrderNormsSpec

/-!
# PriorityOrderNormsTests — 優先順位演算子
-/
namespace JapanTaxLaw.PriorityOrderNormsTests

open JapanTaxLaw.PriorityOrderNorms

example (a : Nat) : compareAt a a Dir.asc = .equalRank := compareAt_equal a Dir.asc
example (a : Nat) : compareAt a a Dir.desc = .equalRank := compareAt_equal a Dir.desc
example (a b : Nat) : compareAt b a Dir.asc = invertOrd (compareAt a b Dir.asc) := compareAt_symm a b Dir.asc
example (a b : Nat) : compareAt b a Dir.desc = invertOrd (compareAt a b Dir.desc) := compareAt_symm a b Dir.desc
example (get : Nat → Nat → Nat) (a b : Nat) : comparePriority [] get a b = .equalRank := comparePriority_nil get a b
example : priorityDeclared = true := priority_is_declaration

end JapanTaxLaw.PriorityOrderNormsTests
