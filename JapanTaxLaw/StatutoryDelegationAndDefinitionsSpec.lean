/-!
# StatutoryDelegationAndDefinitionsSpec — 独立形式仕様

pinned 原文（用語の定義各号委任・経過措置政令委任見出し・技術的読替え委任）
から独立に読み取った仕様。実装を import しない。

いずれも内容は他（各号・政令）に委ねられており、原文片にないため NOT MODELLED。
-/
namespace JapanTaxLaw.StatutoryDelegationAndDefinitionsSpec

def itemDefinitionSpec (term : Nat) (defs : Nat → Nat) : Nat := defs term

def delegationDeclaredSpec : Prop := True

def cabinetReadingSpec (r : Nat) : Nat := r

end JapanTaxLaw.StatutoryDelegationAndDefinitionsSpec
