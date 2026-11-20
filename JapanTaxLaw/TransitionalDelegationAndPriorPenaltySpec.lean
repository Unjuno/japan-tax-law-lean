/-!
# TransitionalDelegationAndPriorPenaltySpec — 独立形式仕様

pinned 原文（経過措置の政令委任四種・施行前行為の罰則）から独立に読み取った
仕様。実装を import しない。

委任の内容は政令に委ねられており原文片にないため NOT MODELLED。
罰則の時間的適用は施行日を境界とする旧/新の切替え。
-/
namespace JapanTaxLaw.TransitionalDelegationAndPriorPenaltySpec

def delegationSpec (content : Nat) : Nat := content

def penaltyEraSpec (actDate enforcement : Nat) : Nat :=
  if actDate < enforcement then 0 else 1

end JapanTaxLaw.TransitionalDelegationAndPriorPenaltySpec
