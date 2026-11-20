/-!
# DelegatedTaxpayerCategoriesSpec — 独立形式仕様

pinned 原文（325AC0000000226 art.37 / art.314の6 の（３）（４））から独立に
読み取った仕様。実装を import しない。

政令決定・寡婦/ひとり親区分は呼出側が与える未解釈の入力（NOT MODELLED）。
-/
namespace JapanTaxLaw.DelegatedTaxpayerCategoriesSpec

/-- （３）寡婦又はひとり親で政令で定めるもの。 -/
def cat3Spec (widow singleOrder : Bool) (delegate : Bool) : Prop :=
  (widow || singleOrder) && delegate = true

/-- （４）ひとり親で政令で定めるもの。 -/
def cat4Spec (singleOrder delegate : Bool) : Prop :=
  singleOrder && delegate = true

/-- 入力状態を列挙した独立期待表（委任の内容自体は含めない）。 -/
def expectedCat3 : List (Bool × Bool × Bool) :=
  [(true, true, true), (true, false, true), (false, true, true)]

def expectedCat4 : List (Bool × Bool × Bool) :=
  [(true, true, true), (false, true, true)]

end JapanTaxLaw.DelegatedTaxpayerCategoriesSpec
