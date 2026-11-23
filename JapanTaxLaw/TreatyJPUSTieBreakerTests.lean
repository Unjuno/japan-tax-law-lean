import JapanTaxLaw.TreatyJPUSTieBreaker
import JapanTaxLaw.TreatyJPUSTieBreakerSpec

/-!
# TreatyJPUSTieBreakerTests — 条約第四条３（L3 別層）
-/
namespace JapanTaxLaw.TreatyJPUSTieBreakerTests

open JapanTaxLaw.TreatyJPUSTieBreaker

example (s : State) (v a n g : Option State) : resolve (some s) v a n g = some s := home_decides s v a n g
example (s : State) (a n g : Option State) : resolve none (some s) a n g = some s := vital_decides s a n g
example (s : State) (n g : Option State) : resolve none none (some s) n g = some s := abode_decides s n g
example (s : State) (g : Option State) : resolve none none none (some s) g = some s := nation_decides s g
example (s : State) : resolve none none none none (some s) = some s := agreement_decides s
example : resolve none none none none none = none := no_criterion
example (r : Bool) : appliesToDualResident true true && r = r := by simp [appliesToDualResident]
example : appliesToDualResident true false = false := dual_single
example : tieBreakerDeclared = true := tie_breaker_is_declaration

end JapanTaxLaw.TreatyJPUSTieBreakerTests
