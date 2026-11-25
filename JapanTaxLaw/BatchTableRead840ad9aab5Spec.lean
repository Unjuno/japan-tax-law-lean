import JapanTaxLaw.BatchTableRead840ad9aab5

/-! Independent spec: equality chain rather than pattern match. Agreement is
    proved for every constructor of the declared finite phrase domain. -/
namespace JapanTaxLaw.BatchTableRead840ad9aab5

def specReading (p : Phrase) : Phrase :=
  if p == Phrase.original0 then Phrase.replacement0 else if p == Phrase.original1 then Phrase.replacement1 else if p == Phrase.original2 then Phrase.replacement2 else if p == Phrase.original3 then Phrase.replacement3 else if p == Phrase.original4 then Phrase.replacement4 else if p == Phrase.original5 then Phrase.replacement5 else if p == Phrase.original6 then Phrase.replacement6 else if p == Phrase.original7 then Phrase.replacement7 else if p == Phrase.original8 then Phrase.replacement8 else if p == Phrase.original9 then Phrase.replacement9 else if p == Phrase.original10 then Phrase.replacement10 else if p == Phrase.original11 then Phrase.replacement11 else if p == Phrase.original12 then Phrase.replacement12 else if p == Phrase.original13 then Phrase.replacement13 else if p == Phrase.original14 then Phrase.replacement14 else if p == Phrase.original15 then Phrase.replacement15 else if p == Phrase.original16 then Phrase.replacement16 else if p == Phrase.original17 then Phrase.replacement17 else if p == Phrase.original18 then Phrase.replacement18 else p

def specWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then specReading p else p

theorem agree_spec_impl (p : Phrase) : specReading p = applyReading p := by
  cases p <;> rfl

theorem agree_when_spec_impl (trigger : Bool) (p : Phrase) :
    specWhen trigger p = applyWhen trigger p := by
  cases trigger <;> cases p <;> rfl

end JapanTaxLaw.BatchTableRead840ad9aab5
