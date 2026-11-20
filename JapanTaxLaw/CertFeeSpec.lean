import JapanTaxLaw.CertFee

/-!
# CertFee spec — 関税法施行令 art.7 の独立整数定式
Sources (pinned): law 329CO0000000164, revision 329CO0000000164_20250401_507CO0000000141.
Independent restatement: 紙 400 円 / 電子 300 円 / 統計記録媒体 23,500 円、
n 枚合計 = n × 一枚額。実装とは独立に数値を書き下す。
-/

namespace JapanTaxLaw.CertFee

def specPaperFee : Nat := 400
def specElectronicFee : Nat := 300
def specStatFee : Nat := 23_500

def specFee (electronic : Bool) : Nat :=
  if electronic then 300 else 400

def specTotal (electronic : Bool) (n : Nat) : Nat :=
  n * specFee electronic

example : specPaperFee = 400 := by decide
example : specElectronicFee = 300 := by decide
example : specStatFee = 23_500 := by decide

def agreeCertFee : Bool :=
  [ (false,0), (false,1), (false,3), (true,0), (true,1), (true,3), (true,10) ].all fun (e, n) =>
    totalCertificateFeeYen e n == specTotal e n

example : agreeCertFee = true := by decide

end JapanTaxLaw.CertFee
