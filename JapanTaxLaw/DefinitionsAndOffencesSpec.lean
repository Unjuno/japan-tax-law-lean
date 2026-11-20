/-\!
# DefinitionsAndOffencesSpec — 独立形式仕様

pinned 原文（定義・省令事項・犯罪・罰金上限 506条片）から独立に読み取った仕様。
実装を import しない。

定義は表引き、省令事項は外部が与える。年齢閾値は 65 以上。
罰金は上限以下のとき適法。両罰は行為者と法人の罰金の連言。
貸付け区分・買取主体は呼出側が与える。具体的な定義・金額・主体は NOT MODELLED。
-/
namespace JapanTaxLaw.DefinitionsAndOffencesSpec

def definitionSpec (k : Nat) : Option Nat := none
def ministrySpec (c : Nat) : Nat := c
def ageSpec (a : Nat) : Prop := 65 <= a
def ratioSpec (p : Nat) : Prop := 95 < p
def fineCapSpec (a cap : Nat) : Prop := a <= cap
def dualFineSpec (a c : Nat) : Prop := a > 0 ∧ c > 0

end JapanTaxLaw.DefinitionsAndOffencesSpec
