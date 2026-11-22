/-\!
# RatioAndValueNormsSpec — 独立形式仕様

pinned 原文（割合比較・価額算入 815条片）から独立に読み取った仕様。実装を import しない。

割合以上は part/total>=threshold、以下は part/total<=threshold（total=0 は以下で真）。
価額算入はフラグ次第、取得財産課税額は value*rate。具体的な割合・価額は NOT MODELLED。
-/
namespace JapanTaxLaw.RatioAndValueNormsSpec

def atLeastSpec (p t th : Nat) : Prop := t > 0 ∧ p * 100 / t >= th
def atMostSpec (p t th : Nat) : Prop := t == 0 || p * 100 / t <= th
def includeSpec (i v : Nat) : Nat := if i == 1 then v else 0
def taxSpec (v r : Nat) : Nat := v * r

end JapanTaxLaw.RatioAndValueNormsSpec
