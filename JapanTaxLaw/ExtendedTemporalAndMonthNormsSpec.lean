/-!
# ExtendedTemporalAndMonthNormsSpec — 独立形式仕様

pinned 原文（追加の施行日・月数規定 435条片）から独立に読み取った仕様。
実装を import しない。

上限付き施行日: 公布日 < 施行日 <= 公布日 + 上限（上限は呼出側が与える）。
月数: 計算した月数が 0 なら 1、それ以外はそのまま。
月から日への換算・実際の日付は NOT MODELLED。
-/
namespace JapanTaxLaw.ExtendedTemporalAndMonthNormsSpec

def windowSpec (p e b : Nat) : Prop := p < e ∧ e <= p + b

def monthsSpec (m : Nat) : Nat := if m = 0 then 1 else m

end JapanTaxLaw.ExtendedTemporalAndMonthNormsSpec
