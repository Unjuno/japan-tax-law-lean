/-!
# TemporalEnforcementDatesSpec — 独立形式仕様

pinned 原文（施行日規定七種）から独立に読み取った仕様。実装を import しない。

「公布の日から施行する」= 即時（effective = promulgation）。
「公布の日から起算して X を超えない範囲内において政令で定める日から施行する」
= 公布日より後、公布日 + X 以下の日の範囲（下限排他・上限包含）。
月数から日数への換算は原文片的になく NOT MODELLED。
-/
namespace JapanTaxLaw.TemporalEnforcementDatesSpec

def immediateSpec (p e : Nat) : Prop := e = p

def deferredSpec (p e b : Nat) : Prop := p < e ∧ e <= p + b

end JapanTaxLaw.TemporalEnforcementDatesSpec
