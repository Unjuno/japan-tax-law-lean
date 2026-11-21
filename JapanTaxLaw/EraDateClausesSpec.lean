/-\!
# EraDateClausesSpec — 独立形式仕様

pinned 原文（元号日付の施行規定 6486条片）から独立に読み取った仕様。実装を import しない。

<元号>N年M月D日 を (元号, 年, 月, 日) に解析する。施行日は与えられた日付。
暦への換算・実際の日付・実質規定は NOT MODELLED（PROVED_SCOPE）。
-/
namespace JapanTaxLaw.EraDateClausesSpec

def dateSpec (e : Nat) (y m d : Nat) : Nat × Nat × Nat × Nat := (e, y, m, d)
def effectiveSpec (d : Nat) : Nat := d

end JapanTaxLaw.EraDateClausesSpec
