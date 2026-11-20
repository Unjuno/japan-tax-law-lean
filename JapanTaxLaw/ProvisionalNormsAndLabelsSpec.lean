/-\!
# ProvisionalNormsAndLabelsSpec — 独立形式仕様

pinned 原文（暫定的規範と付随ラベル 425条片）から独立に読み取った仕様。実装を import しない。

枝番号は（序数, 枝番号）の組、算式・参照・定義は呼出側が与える関数/表、
従前例は施行時点より前の行為に旧法を適用、免除は権限（may）であって義務（must）ではない。
金額区分は区間、重量閾値は 1000（kg）を境とする二分。
具体的な金額・犯罪・算式・参照先は NOT MODELLED。
-/
namespace JapanTaxLaw.ProvisionalNormsAndLabelsSpec

def subItemSpec (base sub : Nat) : Nat × Nat := (base, sub)

def formulaSpec (f : Nat -> Nat) (x : Nat) : Nat := f x

def oldLawSpec (actTime enforcement : Nat) : Prop := actTime < enforcement

def mayExemptSpec : Prop := True
def mustExemptSpec : Prop := False

def bracketSpec (lo hi x : Nat) : Prop := lo <= x ∧ x <= hi

def underTonSpec (w : Nat) : Bool := decide (w <= 1000)
def overTonSpec (w : Nat) : Bool := decide (1000 < w)

end JapanTaxLaw.ProvisionalNormsAndLabelsSpec
