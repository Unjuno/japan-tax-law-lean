/-\!
# SecurityGuaranteeNormsSpec — 独立形式仕様

pinned 原文（担保・保証 265条片）から独立に読み取った仕様。実装を import しない。

担保額は延納額に相当。担保提供命令は许可次第。保証は主債務者不履行時に保証人が履行。
分割納付は total/times（times=0 なら未定義）。具体的な金額・当事者は NOT MODELLED。
-/
namespace JapanTaxLaw.SecurityGuaranteeNormsSpec

def securitySpec (d : Nat) : Nat := d
def mayRequireSpec (a : Bool) : Bool := a
def guaranteeSpec (p g : Nat) : Nat := if p == 0 then g else p
def installmentSpec (t n : Nat) : Option Nat := if n == 0 then none else some (t / n)

end JapanTaxLaw.SecurityGuaranteeNormsSpec
