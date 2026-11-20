/-!
# TobaccoTaxReadingRangesSpec — 独立形式仕様

pinned 原文（たばこ税の準用規定四種）から独立に読み取った仕様。
実装 (TobaccoTaxReadingRanges.lean) を import しない。

「第四項から第八項まで」= 4<=p<=8（両端包含）等。
段落の実質的内容は NOT MODELLED。
-/
namespace JapanTaxLaw.TobaccoTaxReadingRangesSpec

def prefRangeSpec (p : Nat) : Prop := 4 <= p ∧ p <= 8
def cityRangeSpec (p : Nat) : Prop := 4 <= p ∧ p <= 8
def art52RangeSpec (p : Nat) : Prop := 2 <= p ∧ p <= 7
def art51RangeSpec (p : Nat) : Prop := 2 <= p ∧ p <= 8

end JapanTaxLaw.TobaccoTaxReadingRangesSpec
