import JapanTaxLaw.CorpOrderArt4OwnershipOver50Percent

/-!
# CorpOrderArt4OwnershipOver50Percent spec — 50%超の独立定式

Sources (pinned): law 340CO0000000097, revision 340CO0000000097_20261001_507CO0000000121.
Independent restatement: 「残りが半分未満」として `total - held < held` で判定する。
実装識別子を再利用しない。有限領域の kernel-decided 検査であり普遍的な定理ではない。
-/

namespace JapanTaxLaw.CorpOrderArt4OwnershipOver50Percent

/-- 百分率の分母（百）も原文に保持して比率照合する。 -/
def specPercentDen : Nat := 100

def specHalf : Nat := 50

def specExceeds (held total : Nat) : Bool :=
  total - held < held

example : specExceeds 50 100 = false := by decide
example : specExceeds 51 100 = true := by decide

def agreeCorpOrderArt4OwnershipOver50Percent : Bool :=
  [0, 1, 49, 50, 51, 99, 100].all (fun held =>
    exceeds50 held 100 == specExceeds held 100)

example : agreeCorpOrderArt4OwnershipOver50Percent = true := by decide

end JapanTaxLaw.CorpOrderArt4OwnershipOver50Percent
