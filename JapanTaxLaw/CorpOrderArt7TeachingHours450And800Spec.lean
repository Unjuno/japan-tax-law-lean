import JapanTaxLaw.CorpOrderArt7TeachingHours450And800

/-!
# CorpOrderArt7TeachingHours450And800 spec — 450/800 二条件の独立定式

Sources (pinned): law 340M50000040012, revision 340M50000040012_20261001_505M60000040013.
Independent restatement: 各下限を「未満でない」否定形で書き、接続を `||` の否定
（どちらかが欠ければ false）として構成する。実装識別子を再利用しない。
有限領域の kernel-decided 検査であり普遍的な定理ではない。
-/

namespace JapanTaxLaw.CorpOrderArt7TeachingHours450And800

def specAnnual : Nat := 450

def specTotal : Nat := 800

def specMeets (annual total : Nat) : Bool :=
  (! (annual < specAnnual)) && (! (total < specTotal))

example : specMeets 450 800 = true := by decide
example : specMeets 449 800 = false := by decide

def agreeCorpOrderArt7TeachingHours450And800 : Bool :=
  [0, 1, 449, 450, 451, 799, 800, 801].all (fun a =>
    [0, 449, 450, 799, 800, 801].all (fun t =>
      meetsBoth a t == specMeets a t))

example : agreeCorpOrderArt7TeachingHours450And800 = true := by decide

end JapanTaxLaw.CorpOrderArt7TeachingHours450And800
