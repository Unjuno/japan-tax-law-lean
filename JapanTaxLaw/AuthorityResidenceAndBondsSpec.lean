/-\!
# AuthorityResidenceAndBondsSpec — 独立形式仕様

pinned 原文（権限・居住者・地方債 1874条片）から独立に読み取った仕様。実装を import しない。

地方債の発行は同意/許可が前提。居住者及び恒久的施設を有する非居住者は課税対象。
相互主義は条件充足時に適用。証票義務は構造宣言。床面積按分は resident*100/total
（total=0 なら未定義）。具体的な人・日付・金額は NOT MODELLED。
-/
namespace JapanTaxLaw.AuthorityResidenceAndBondsSpec

def issuanceSpec (consent : Bool) : Bool := consent
def residentSpec (r : Nat) : Bool := r == 0 || r == 1
def reciprocitySpec (c : Bool) : Bool := c
def dutySpec : Prop := True
def areaSpec (resident total : Nat) : Option Nat := if total == 0 then none else some (resident * 100 / total)

end JapanTaxLaw.AuthorityResidenceAndBondsSpec
