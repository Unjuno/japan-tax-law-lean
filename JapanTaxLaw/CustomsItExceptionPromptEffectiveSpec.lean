import JapanTaxLaw.CustomsItExceptionPromptEffective

/-
# CustomsItExceptionPromptEffectiveSpec — independent spec for 税関手続改正政令 附則第一条 proviso

Pinned source:
  Law id: 420CO0000000210
  Revision: 420CO0000000210_20081001_000000000000000
  Statutory article: 附則 第一条 proviso
  原文逐語: 「ただし、第十三条の規定は、公布の日から施行する。」
  Normative unit: NORM|efa09d98292a1de5055d9a7bdf08343c4d14f2f9bf9e64ad90a5bd4ddf492e34

This module carries its OWN zero-delay constant and a distinct successor-shifted
equality formula, `decide (succ delayDays == 1)`, rather than the impl's decimal
`delayDays == 0`. It reuses NO implementation definition inside its `spec*`
defs; the universal `agree_prompt_delay` theorem is the only bridge, and the
kernel checks it by definitional equality (axiom-free). No statutory numeral is
claimed: the source has none, and the vacuous numeric-literal axis is recorded,
not treated as PASS.

Not modelled: the general deferred rule, article 13's content and other
supplementary articles.
-/

namespace JapanTaxLaw.CustomsItExceptionPromptEffective

def specPromptDelayDays : Nat := 0

def specIsPromptEffective (delayDays : Nat) : Bool :=
  decide (Nat.succ delayDays == Nat.succ specPromptDelayDays)

theorem agree_prompt_delay (delayDays : Nat) :
    isPromptEffective delayDays = specIsPromptEffective delayDays := by
  unfold isPromptEffective promptDelayDays specIsPromptEffective specPromptDelayDays
  rfl

example : specIsPromptEffective 0 = true := by decide
example : specIsPromptEffective 1 = false := by decide

end JapanTaxLaw.CustomsItExceptionPromptEffective
