/-!
# DocumentationPresumptionsSpec — 独立形式仕様

pinned 原文（332AC0000000026 art.40の4/40の7/66の6/66の9の2 の資料未提出推定）
から独立に読み取った仕様。実装を import しない。

「資料の提示又は提出がないときは…に該当しないものと推定する」:
資料が無い場合は該当しない(false)、有る場合は呼出側の判定をそのまま使用。
-/
namespace JapanTaxLaw.DocumentationPresumptionsSpec

def presumptionSpec (provided status : Bool) : Bool :=
  if provided then status else false

def absentSpec (provided : Bool) : Prop := provided = false

end JapanTaxLaw.DocumentationPresumptionsSpec
