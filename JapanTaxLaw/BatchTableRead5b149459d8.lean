import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchTableRead5b149459d8

def sourcePhraseText0 : String := "内国法人である普通法人又は協同組合等の設立の日の属する事業年度同日"
def replacementPhraseText0 : String := "恒久的施設を有する外国法人である普通法人の恒久的施設を有することとなつた日の属する事業年度又は恒久的施設を有しない外国法人である普通法人の第百三十八条第一項第四号（国内源泉所得）に規定する事業（第四号において「人的役務提供事業」という。）を国内において開始した日の属する事業年度若しくは当該普通法人の第百四十一条第二号（課税標準）に定める国内源泉所得で同項第四号に掲げる対価以外のものを有することとなつた日の属する事業年度その恒久的施設を有することとなつた日又はその開始した日若しくはその対価以外のものを有することとなつた日"
def sourcePhraseText1 : String := "収益事業を開始した日"
def replacementPhraseText1 : String := "第百四十一条各号に掲げる外国法人の区分に応じ当該各号に定める国内源泉所得で収益事業から生ずるものを有することとなつた日"
def sourcePhraseText2 : String := "内国法人である普通法人若しくは協同組合等の設立の日、"
def replacementPhraseText2 : String := "恒久的施設を有しない外国法人である普通法人が人的役務提供事業を国内において開始した日、当該普通法人が第百四十一条第二号に定める国内源泉所得で第百三十八条第一項第四号に掲げる対価以外のものを有することとなつた日又は"
def sourcePhraseText3 : String := "収益事業を開始した日又は前号イ若しくはロに掲げる法人の区分に応じそれぞれ同号イ若しくはロに定める日"
def replacementPhraseText3 : String := "第百四十一条各号に掲げる外国法人の区分に応じ当該各号に定める国内源泉所得で収益事業から生ずるものを有することとなつた日"
def sourcePhraseText4 : String := "設立等の日"
def replacementPhraseText4 : String := "申告対象外国法人となつた日"
def sourcePhraseText5 : String := "取引"
def replacementPhraseText5 : String := "取引（恒久的施設を有する外国法人にあつては、第百三十八条第一項第一号（国内源泉所得）に規定する内部取引に該当するものを含む。第百二十六条第一項及び第百二十七条第一項第三号（青色申告の承認の取消し）において同じ。）"
def sourcePhraseText6 : String := "第七十二条第一項各号"
def replacementPhraseText6 : String := "第百四十四条の四第一項各号又は第二項各号"
def sourcePhraseText7 : String := "第七十四条第一項"
def replacementPhraseText7 : String := "第百四十四条の六第一項又は第二項"

inductive Phrase where
  | original0 | replacement0
  | original1 | replacement1
  | original2 | replacement2
  | original3 | replacement3
  | original4 | replacement4
  | original5 | replacement5
  | original6 | replacement6
  | original7 | replacement7
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
  | Phrase.original7 => Phrase.replacement7
  | p => p

def applyWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then applyReading p else p

theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl
theorem untriggered_identity (p : Phrase) : applyWhen false p = p := by
  cases p <;> rfl
theorem triggered_matches (p : Phrase) : applyWhen true p = applyReading p := by
  rfl

end JapanTaxLaw.BatchTableRead5b149459d8
