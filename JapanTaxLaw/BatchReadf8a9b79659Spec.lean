import JapanTaxLaw.BatchReadf8a9b79659

/-! Independent spec: equality test rather than pattern match. Agreement is
    proved for every phrase and both trigger values, exhaustively. -/
namespace JapanTaxLaw.BatchReadf8a9b79659

def specReading (p : Phrase) : Phrase :=
  if p == Phrase.original then Phrase.replacement else p

def specWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then specReading p else p

theorem agree_spec_impl (p : Phrase) : specReading p = applyReading p := by
  cases p <;> rfl

theorem agree_when_spec_impl (trigger : Bool) (p : Phrase) :
    specWhen trigger p = applyWhen trigger p := by
  cases trigger <;> cases p <;> rfl

end JapanTaxLaw.BatchReadf8a9b79659
