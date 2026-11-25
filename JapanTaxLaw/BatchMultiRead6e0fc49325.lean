import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiRead6e0fc49325

def sourcePhraseText0 : String := "には、当該内国法人"
def replacementPhraseText0 : String := "には、当該特定適格組織再編成等により設立された内国法人"
def sourcePhraseText1 : String := "当該内国法人が当該支配関係法人"
def replacementPhraseText1 : String := "第三項に規定する被合併法人等が他の被合併法人等"
def sourcePhraseText2 : String := "同項の支配関係法人から特定適格組織再編成等"
def replacementPhraseText2 : String := "特定適格組織再編成等に係る次項に規定する被合併法人等（次号に規定する他の被合併法人等を除く。）から当該特定適格組織再編成等"
def sourcePhraseText3 : String := "当該支配関係法人が当該内国法人"
def replacementPhraseText3 : String := "当該被合併法人等が当該他の被合併法人等"
def sourcePhraseText4 : String := "有する資産（棚卸資産、"
def replacementPhraseText4 : String := "特定適格組織再編成等に係る次項に規定する他の被合併法人等から当該特定適格組織再編成等により移転を受けた資産（棚卸資産、当該"
def sourcePhraseText5 : String := "の属する事業年度開始の日における"
def replacementPhraseText5 : String := "における"
def sourcePhraseText6 : String := "支配関係発生日"
def replacementPhraseText6 : String := "当該他の被合併法人等が支配関係発生日"

inductive Phrase where
  | original0 | replacement0
  | original1 | replacement1
  | original2 | replacement2
  | original3 | replacement3
  | original4 | replacement4
  | original5 | replacement5
  | original6 | replacement6
  | other
  deriving DecidableEq, Repr

def applyReading : Phrase → Phrase
  | Phrase.original0 => Phrase.replacement0
  | Phrase.original1 => Phrase.replacement1
  | Phrase.original2 => Phrase.replacement2
  | Phrase.original3 => Phrase.replacement3
  | Phrase.original4 => Phrase.replacement4
  | Phrase.original5 => Phrase.replacement5
  | Phrase.original6 => Phrase.replacement6
  | p => p

def applyWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then applyReading p else p

theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl
theorem untriggered_identity (p : Phrase) : applyWhen false p = p := by
  cases p <;> rfl
theorem triggered_matches (p : Phrase) : applyWhen true p = applyReading p := by
  rfl

end JapanTaxLaw.BatchMultiRead6e0fc49325
