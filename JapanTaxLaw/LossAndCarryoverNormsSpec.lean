/-\!
# LossAndCarryoverNormsSpec — 独立形式仕様

pinned 原文（損失・欠損・繰越 1067条片）から独立に読み取った仕様。実装を import しない。

欠損額は expense-income（収入が上回れば 0）。繰越は start<=current<=start+years。
災害損失は disaster<=year<=disaster+3。具体的な金額・年は NOT MODELLED。
-/
namespace JapanTaxLaw.LossAndCarryoverNormsSpec

def deficitSpec (i e : Nat) : Nat := e - i
def carrySpec (c s y : Nat) : Prop := s <= c ∧ c <= s + y
def disasterSpec (y d : Nat) : Prop := d <= y ∧ y <= d + 3

end JapanTaxLaw.LossAndCarryoverNormsSpec
