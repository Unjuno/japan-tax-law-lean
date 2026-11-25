import JapanTaxLaw.BatchMultiReadf869d54388

/-! Independent spec: equality chain rather than pattern match. Agreement is
    proved for every constructor of the declared finite phrase domain. -/
namespace JapanTaxLaw.BatchMultiReadf869d54388

def specReading (p : Phrase) : Phrase :=
  if p == Phrase.original0 then Phrase.replacement0 else if p == Phrase.original1 then Phrase.replacement1 else if p == Phrase.original2 then Phrase.replacement2 else p

def specWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then specReading p else p

theorem agree_spec_impl (p : Phrase) : specReading p = applyReading p := by
  cases p <;> rfl

theorem agree_when_spec_impl (trigger : Bool) (p : Phrase) :
    specWhen trigger p = applyWhen trigger p := by
  cases trigger <;> cases p <;> rfl

end JapanTaxLaw.BatchMultiReadf869d54388
