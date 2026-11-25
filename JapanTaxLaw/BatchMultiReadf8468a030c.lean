import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiReadf8468a030c

def sourcePhraseText0 : String := "特例適用投資組合契約（同項の規定の適用を受ける非居住者又は外国法人が締結している当該適用に係る投資組合契約をいう。以下この条及び次条において同じ。）"
def replacementPhraseText0 : String := "投資組合契約（次条第一項に規定する投資組合契約をいう。以下この項において同じ。）"
def sourcePhraseText1 : String := "当該特例適用投資組合契約"
def replacementPhraseText1 : String := "当該投資組合契約"

inductive Phrase where
  | original0 | replacement0
  | original1 | replacement1
  | other
  deriving DecidableEq, Repr

def applyReading : Phrase → Phrase
  | Phrase.original0 => Phrase.replacement0
  | Phrase.original1 => Phrase.replacement1
  | p => p

def applyWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then applyReading p else p

theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl
theorem untriggered_identity (p : Phrase) : applyWhen false p = p := by
  cases p <;> rfl
theorem triggered_matches (p : Phrase) : applyWhen true p = applyReading p := by
  rfl

end JapanTaxLaw.BatchMultiReadf8468a030c
