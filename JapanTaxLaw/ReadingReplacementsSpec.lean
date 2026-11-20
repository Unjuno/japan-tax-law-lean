/-!
# ReadingReplacementsSpec — 独立形式仕様

pinned 原文（表による字句の読み替え 249条片）から独立に読み取った仕様。
実装を import しない。

中欄の字句を下欄の字句に置換し、上欄に掲げられた規定にのみ適用する。
実際の字句・算式・規定は NOT MODELLED。
-/
namespace JapanTaxLaw.ReadingReplacementsSpec

def substituteSpec (x src dst : Nat) : Nat := if x == src then dst else x

def listedSpec (i n : Nat) : Prop := i < n

end JapanTaxLaw.ReadingReplacementsSpec
