import JapanTaxLaw.CorpOrderArt7TeachingHours800

/-!
# CorpOrderArt7TeachingHours800 spec — 800時間以上の独立定式

Sources (pinned): law 340M50000040012, revision 340M50000040012_20261001_505M60000040013.
Independent restatement: 「800時間未満でない」を否定形 `!(specMin < hours)` として
書く。実装識別子を再利用しない。有限領域の kernel-decided 検査であり普遍的な定理ではない。
-/

namespace JapanTaxLaw.CorpOrderArt7TeachingHours800

def specMin : Nat := 800

def specMeets (hours : Nat) : Bool := ! (hours < specMin)

example : specMeets 799 = false := by decide
example : specMeets 800 = true := by decide

def agreeCorpOrderArt7TeachingHours800 : Bool :=
  [0, 1, 799, 800, 801, 1200].all (fun h =>
    meetsRequirement h == specMeets h)

example : agreeCorpOrderArt7TeachingHours800 = true := by decide

end JapanTaxLaw.CorpOrderArt7TeachingHours800
