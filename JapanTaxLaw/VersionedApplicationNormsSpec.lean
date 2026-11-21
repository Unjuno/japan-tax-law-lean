/-\!
# VersionedApplicationNormsSpec — 独立形式仕様

pinned 原文（新旧法の適用 10319条片）から独立に読み取った仕様。実装を import しない。

施行日以后は新法、施行日前は旧法（排他的かつ全域的）。「なお従前の例による」は
旧法適用の印。改正後の規定は係属中は適用しない。具体的な規定・日付は NOT MODELLED。
-/
namespace JapanTaxLaw.VersionedApplicationNormsSpec

def afterSpec (d e : Nat) : Prop := e <= d
def beforeSpec (d e : Nat) : Prop := d < e
def oldLawSpec (flag : Bool) : Bool := flag
def amendedSpec (pending : Bool) : Bool := !pending

end JapanTaxLaw.VersionedApplicationNormsSpec
