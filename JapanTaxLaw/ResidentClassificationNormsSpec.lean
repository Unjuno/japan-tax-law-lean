/-\!
# ResidentClassificationNormsSpec — 独立形式仕様

pinned 原文（居住者分類 2065条片）から独立に読み取った仕様。実装を import しない。

居住者/非居住者/一時居住者の分類は排他的。居住者・一時居住者は居住者課税対象、
非居住者は居住者課税対象外（源泉課税は別途）。具体的な個人は NOT MODELLED。
-/
namespace JapanTaxLaw.ResidentClassificationNormsSpec

def classSpec (code : Nat) : Nat :=
  match code with | 0 => 0 | 1 => 1 | 2 => 2 | _ => 1

def taxableSpec (c : Nat) : Bool := c == 0 || c == 2

end JapanTaxLaw.ResidentClassificationNormsSpec
