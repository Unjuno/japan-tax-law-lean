import JapanTaxLaw.CustomsItExceptionPromptEffectiveSpec

/-
# CustomsItExceptionPromptEffectiveTests — kernel-decided checks for 税関手続改正政令 附則第一条 proviso

Closed Nat/Bool expressions discharged by `by decide`, or theorem applications.
-/

namespace JapanTaxLaw.CustomsItExceptionPromptEffective

example : promptDelayDays = 0 := rfl
example : isPromptEffective 0 = true := by decide
example : isPromptEffective 1 = false := by decide
example : isPromptEffective 2 = false := by decide
example : isPromptEffective 0 = specIsPromptEffective 0 := by decide
example : isPromptEffective 1 = specIsPromptEffective 1 := by decide
example (d : Nat) : isPromptEffective d = specIsPromptEffective d := agree_prompt_delay d

end JapanTaxLaw.CustomsItExceptionPromptEffective
