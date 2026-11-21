/-\!
# AmendmentEnforcementNormsSpec — 独立形式仕様

pinned 原文（改正規定の施行 1259条片）から独立に読み取った仕様。実装を import しない。

改正規定は施行日以后に適用。公布日起算の施行日は promulgate < eff <= promulgate+bound。
項目別施行日も enforcement<=date。具体的な日付・項目は NOT MODELLED。
-/
namespace JapanTaxLaw.AmendmentEnforcementNormsSpec

def effectiveSpec (d e : Nat) : Prop := e <= d
def windowSpec (p e b : Nat) : Prop := p < e ∧ e <= p + b

end JapanTaxLaw.AmendmentEnforcementNormsSpec
