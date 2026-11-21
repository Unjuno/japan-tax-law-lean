/-\!
# TableLabelsAndTermsSpec — 独立形式仕様

pinned 原文（表見出し・欄番号・用語・申請書項目 2305条片）から独立に読み取った
仕様。実装を import しない。

欄番号は「第」+漢数字+「欄」の序数。表見出しはラテン序数とラベルの対。
用語参照の参照先は外部が与える。記載項目は構造宣言としてのみ記録。
実質的内容は NOT MODELLED（PROVED_SCOPE）。
-/
namespace JapanTaxLaw.TableLabelsAndTermsSpec

def columnSpec (n : Nat) : Nat := n
def headerSpec (n : Nat) (label : String) : Nat × String := (n, label)
def termSpec (t : Nat) : Nat := t
def fieldSpec : Prop := True

end JapanTaxLaw.TableLabelsAndTermsSpec
