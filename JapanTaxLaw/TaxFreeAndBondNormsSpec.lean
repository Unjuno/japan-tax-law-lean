/-\!
# TaxFreeAndBondNormsSpec — 独立形式仕様

pinned 原文（非課税宣言・公債所在 1823条片）から独立に読み取った仕様。実装を import しない。

非課税は課税額を 0 にする。非課税限度額の按分は limit*(part/total)（total=0 なら未定義）。
公債の所在は国内/国外。具体的な金額・主体は NOT MODELLED。
-/
namespace JapanTaxLaw.TaxFreeAndBondNormsSpec

def taxFreeSpec (a : Nat) : Nat := 0
def shareSpec (l p t : Nat) : Option Nat := if t == 0 then none else some (l * (p / t))
def locationSpec (dom : Bool) : Nat := if dom then 0 else 1

end JapanTaxLaw.TaxFreeAndBondNormsSpec
