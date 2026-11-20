/-!
# PenaltyMaximaSpec — 独立形式仕様

pinned 原文（罰則 198条片）から独立に読み取った仕様。実装を import しない。

「X以下の拘禁刑」= 拘禁月数 <= X、「Y以下の罰金」= 罰金額 <= Y。
「併科」は両方を同時に科しうる旨の文言だが、上限構造は同じ。
実際の犯罪要件・数値・量刑は原文片ごとに異なるため NOT MODELLED。
-/
namespace JapanTaxLaw.PenaltyMaximaSpec

def withinSpec (m y mc fc : Nat) : Prop := m <= mc ∧ y <= fc

end JapanTaxLaw.PenaltyMaximaSpec
