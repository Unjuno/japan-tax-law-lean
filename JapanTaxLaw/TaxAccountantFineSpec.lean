/-!
# TaxAccountantFineSpec — 独立形式仕様

pinned 原文「次の各号のいずれかに該当する者は、十万円以下の過料に処する。」
から独立に読み取った仕様。実装モジュールを import しない。
-/
namespace JapanTaxLaw.TaxAccountantFineSpec

/-- 原文の法的効果: 該当者かつ過料額が十万円以下。 -/
def permittedFine (eligible : Bool) (fineYen : Nat) : Prop :=
  eligible = true ∧ fineYen <= 100_000

end JapanTaxLaw.TaxAccountantFineSpec
