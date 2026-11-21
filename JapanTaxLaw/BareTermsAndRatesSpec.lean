/-\!
# BareTermsAndRatesSpec — 独立形式仕様

pinned 原文（税名・税率・算定用語・見出し 6275条片）から独立に読み取った仕様。
実装を import しない。

税率エントリは（年度, 倍率）の構造、施行日/算出の参照先は外部が与える。
見出し・税名・分数は構造宣言としてのみ記録。実際の税率・実質内容は NOT MODELLED。
-/
namespace JapanTaxLaw.BareTermsAndRatesSpec

def rateSpec (rate base : Nat) : Nat := base * rate / 100000
def actRefSpec (d : Nat) : Nat := d
def minSpec (a b : Nat) : Nat := if a <= b then a else b
def declarationSpec : Prop := True

end JapanTaxLaw.BareTermsAndRatesSpec
