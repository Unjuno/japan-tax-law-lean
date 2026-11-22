/-\!
# RemainderAndValueNormsSpec — 独立形式仕様

pinned 原文（控除残額・価額設定・床面積 662条片）から独立に読み取った仕様。実装を import しない。

控除後残額は total-deduction、価額設定は参照先採用、床面積課税標準は area*rate、
合計額はリスト和。具体的な金額・面積は NOT MODELLED。
-/
namespace JapanTaxLaw.RemainderAndValueNormsSpec

def remainderSpec (t d : Nat) : Nat := t - d
def setSpec (v : Nat) : Nat := v
def areaSpec (a r : Nat) : Nat := a * r
def sumSpec : List Nat -> Nat
  | [] => 0
  | x :: xs => x + sumSpec xs

end JapanTaxLaw.RemainderAndValueNormsSpec
