/-\!
# MultiplicationOperatorNormsSpec — 独立形式仕様

pinned 原文（「…に…を乗じて得た額」）から独立。実装を import しない。
変数の意味・単位・定義域は実装の docstring に記録済み。
-/
namespace JapanTaxLaw.MultiplicationOperatorNormsSpec

def multipliedAmountSpec (base rate : Nat) : Nat := base * rate

end JapanTaxLaw.MultiplicationOperatorNormsSpec
